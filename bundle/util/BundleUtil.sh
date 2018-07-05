include app.server.factory.AppServerFactory
include app.server.validator.AppServerValidator

include base.vars.BaseVars

include file.writer.FileWriter

include logger.Logger

include string.validator.StringValidator

@class
BundleUtil(){
	configure(){
		Logger logProgressMsg "increasing_memory_limit"

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

		Logger logCompletedMsg
	}

	deleteBundleContent(){
		deleteHomeFolders ${1}
		deleteTempFiles ${1}

		Logger logProgressMsg "deleting_remaining_bundle_folders"

		rm -rf ${bundleDir}/{.githash,deploy,osgi,poshi,tools,work}

		Logger logCompletedMsg

		Logger logProgressMsg "deleting_app_server_directory"
		rm -rf ${appServerDir}
		Logger logCompletedMsg
	}

	deleteHomeFolders(){
		Logger logProgressMsg "deleting_home_folders"

		rm -rf ${bundleDir}/{data,logs}

		Logger logCompletedMsg
	}

	deleteTempFiles(){
		Logger logProgressMsg "deleting_temporary_directories"

		rm -rf ${appServerDir}/{temp,work}

		Logger logCompletedMsg
	}

	resetOSGiState(){
		local osgiStateDir=${bundleDir}/osgi/state

		if [[ -e ${osgiStateDir} ]]; then
			Logger logProgressMsg "deleting_osgi_state_folder"
			rm -rf ${osgiStateDir}
			Logger logCompletedMsg
		fi
	}

	local appServer=$(AppServerValidator returnAppServer $@)
	local branch=$(BaseVars getBranch $@)

	local appServerDir=$(
			AppServerFactory getAppServerDir ${appServer} ${branch})
	local bundleDir=$(BaseVars getBundleDir ${branch})
	local replace="FileWriter replace"

	$@
}