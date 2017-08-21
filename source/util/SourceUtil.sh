include logger.Logger

include props.writer.PropsWriter

include string.validator.StringValidator

SourceUtil(){
	clearGradleCache(){
		if [ -d ${buildDir}/.gradle/caches/ ]; then
			Logger logProgressMsg "clearing_gradle_cache"

			cd ${buildDir}/.gradle/caches/

			git clean -fdq

			Logger logCompletedMsg
		fi
	}

	config(){
		Logger logProgressMsg "building_properties"

		for prop in {app.server,build}; do
			touch ${buildDir}/${prop}.${HOSTNAME}.properties
		done

		${writer} setAppServerProps ${branch} app.server.parent.dir ${bundleDir}
		${writer} setAppServerProps ${branch} app.server.type ${appServer}

		${writer} setBuildProps ${branch} lp.source.dir ${buildDir}

		if [[ $(StringValidator isSubstring ${branch} 6.1) ]]; then
			${writer} setBuildProps ${branch} jsp.precompile off
		else
			${writer} setBuildProps ${branch} jsp.precompile on
		fi

		Logger logCompletedMsg
	}

	deep_clean(){
		if [[ ${1} == 1 ]]; then
			cd ${buildDir}

			git clean -fdqx
		fi
	}

	local appServer=$(AppServerValidator returnAppServer $@)
	local branch=$(BaseVars returnBranch $@)
	local buildDir=$(BaseVars returnBuildDir ${branch})
	local bundleDir=$(BaseVars returnBundleDir ${branch})
	local writer=PropsWriter

	$@
}