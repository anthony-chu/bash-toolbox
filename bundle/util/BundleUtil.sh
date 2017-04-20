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
			if [[ ! $(StringValidator isSubstring ${1} 6) ]]; then
				${replace} ${appServerDir}/bin/setenv.sh Xmx1024m Xmx2048m

				local string1=XX:MaxPermSize=[[:digit:]]\+m
				local string2=Xms1024m

				${replace} ${appServerDir}/bin/setenv.sh ${string1} ${string2}
			else
				${replace} ${appServerDir}/bin/setenv.sh Xmx1024m "Xmx2048m Xms1024m"

				local string1=XX:MaxPermSize=[[:digit:]]\+m
				local string2=XX:MaxPermSize=512m

				${replace} ${appServerDir}/bin/setenv.sh ${string1} ${string2}
			fi
		elif [[ $(AppServerValidator isWildfly appServer) ]]; then
			local d=[[:digit:]]

			${replace} ${appServerDir}/bin/standalone.conf Xmx${d}\+m Xmx2048m

			local string1=MaxMetaspaceSize=${d}\+m
			local string2=MaxMetaspaceSize=1024m

			${replace} ${appServerDir}/bin/standalone.conf ${string1} ${string2}
		fi

		Logger logCompletedMsg
	}

	deleteBundleContent(){
		deleteHomeFolders ${1}
		deleteTempFiles ${1}

		Logger logProgressMsg "deleting_remaining_bundle_folders"

		for dir in deploy osgi poshi tools work; do
			rm -rf ${bundleDir}/${dir}
		done

		Logger logCompletedMsg

		Logger logProgressMsg "deleting_app_server_directory"
		rm -rf $(AppServerFactory getAppServerDir ${1} ${2})
		Logger logCompletedMsg
	}

	deleteHomeFolders(){
		Logger logProgressMsg "deleting_home_folders"
		rm -rf ${bundleDir}/data ${bundleDir}/logs
		Logger logCompletedMsg
	}

	deleteTempFiles(){
		local appServerDir=$(AppServerFactory getAppServerDir ${1} ${2})

		Logger logProgressMsg "deleting_temporary_directories"
		rm -rf ${appServerDir}/temp ${appServerDir}/work
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

	local branch=$(BaseVars returnBranch $@)
	local bundleDir=$(BaseVars returnBundleDir ${branch})
	local replace="FileIOUtil replace"

	$@
}