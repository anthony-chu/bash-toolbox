include app.server.factory.AppServerFactory
include app.server.validator.AppServerValidator

include repo.Repo

include file.writer.FileWriter

include logger.Logger

include string.validator.StringValidator

@class
BundleUtil(){
	configure(){
		${_log} info "increasing_memory_limit..."

		if [[ $(AppServerValidator isTomcat appServer) ]]; then
			local tomcatReplace="${replace} ${appServerDir}/bin/setenv.sh"

			if [[ ! $(StringValidator isSubstring branch 6) ]]; then
				${tomcatReplace} 'Xmx[0-9]\+m' Xmx2048m

				${tomcatReplace} 'XX:MaxPermSize=[0-9]\+m' Xms1024m
			else
				${tomcatReplace} 'Xmx[0-9]\+m' 'Xmx2048m -Xms1024m'

				${tomcatReplace} '\(MaxPermSize\)=[0-9]\+' '\1=512'
			fi
		elif [[ $(AppServerValidator isWildfly appServer) || $(
				AppServerValidator isJboss appServer) ]]; then

			local file=${appServerDir}/bin/standalone.conf

			${replace} ${file} '\(MaxMetaspaceSize\)=[0-9]\+m' '\1=1024m'
			${replace} ${file} '\(timeout\)=[0-9]\+' '\1=6000'
			${replace} ${file} 'Xmx[0-9]\+m' 'Xmx2048m -Xms1024m'
		fi

		${_log} info "completed"
	}

	deleteBundleContent(){
		deleteHomeFolders ${1}
		deleteTempFiles ${1}

		${_log} info "deleting_remaining_bundle_folders..."

		rm -rf ${bundleDir}/{.githash,deploy,osgi,poshi,tools,work}

		${_log} info "completed"

		${_log} info "deleting_app_server_directory..."
		rm -rf ${appServerDir}
		${_log} info "completed"
	}

	deleteHomeFolders(){
		${_log} info "deleting_home_folders..."

		rm -rf ${bundleDir}/{data,logs}

		${_log} info "completed"
	}

	deleteTempFiles(){
		${_log} info "deleting_temporary_directories..."

		rm -rf ${appServerDir}/{temp,work}

		${_log} info "completed"
	}

	resetOSGiState(){
		local osgiStateDir=${bundleDir}/osgi/state

		if [[ -e ${osgiStateDir} ]]; then
			${_log} info "deleting_osgi_state_folder..."
			rm -rf ${osgiStateDir}
			${_log} info "completed"
		fi
	}

	local _log="Logger log"

	local appServer=$(AppServerValidator returnAppServer $@)
	local branch=$(Repo getBranch $@)

	local appServerDir=$(
		AppServerFactory getAppServerDir ${appServer} ${branch}
	)

	local bundleDir=$(Repo getBundleDir ${branch})
	local replace="FileWriter replace"

	$@
}