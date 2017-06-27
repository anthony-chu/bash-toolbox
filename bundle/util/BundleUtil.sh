include app.server.factory.AppServerFactory
include app.server.validator.AppServerValidator

include base.comparator.BaseComparator
include base.vars.BaseVars

include file.io.util.FileIOUtil

include logger.Logger

include string.util.StringUtil

BundleUtil(){
	configure(){
		local appServerDir=$(AppServerFactory getAppServerDir ${1} ${2})

		Logger logProgressMsg "increasing_memory_limit"

		if [[ $(AppServerValidator isTomcat appServer) ]]; then
			local tomcatReplace="${replace} ${appServerDir}/bin/setenv.sh"

			if [[ ! $(StringValidator isSubstring branch 6) ]]; then
				${tomcatReplace} Xmx1024m Xmx2048m

				${tomcatReplace} MaxPermSize=[[:digit:]]\\\+m Xms1024m
			else
				${tomcatReplace} Xmx1024m "Xmx2048m Xms1024m"

				${tomcatReplace} XX:MaxPermSize=[[:digit:]]\\\+ XX:MaxPermSize=512
			fi
		elif [[ $(AppServerValidator isWildfly appServer) ]]; then
			local d=[[:digit:]]

			${replace} ${appServerDir}/bin/standalone.conf Xmx${d}\\\+m Xmx2048m

			local string1=MaxMetaspaceSize=${d}\\\+m
			local string2=MaxMetaspaceSize=1024m

			${replace} ${appServerDir}/bin/standalone.conf ${string1} ${string2}
		fi

		Logger logCompletedMsg
	}

	deleteBundleContent(){
		deleteHomeFolders ${1}
		deleteTempFiles ${1}

		Logger logProgressMsg "deleting_remaining_bundle_folders"

		rm -rf ${bundleDir}/{deploy,osgi,poshi,tools,work}

		Logger logCompletedMsg

		Logger logProgressMsg "deleting_app_server_directory"
		rm -rf $(AppServerFactory getAppServerDir ${1} ${2})
		Logger logCompletedMsg
	}

	deleteHomeFolders(){
		Logger logProgressMsg "deleting_home_folders"

		rm -rf ${bundleDir}/{data,logs}

		Logger logCompletedMsg
	}

	deleteTempFiles(){
		local appServerDir=$(AppServerFactory getAppServerDir ${1} ${2})

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
	local branch=$(BaseVars returnBranch $@)
	local bundleDir=$(BaseVars returnBundleDir ${branch})
	local replace="FileIOUtil replace"

	$@
}