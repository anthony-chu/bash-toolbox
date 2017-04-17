include logger.Logger

include props.writer.PropsWriter

include string.validator.StringValidator

SourceUtil(){
	clearGradleCache(){
		if [[ -e ${buildDir}/.gradle/caches ]]; then
			Logger logProgressMsg "clearing_gradle_cache"

			git clean -fdq

			Logger logCompletedMsg
		fi
	}

	config(){
		Logger logProgressMsg "building_properties"

		local props=(app.server build)

		for prop in ${props[@]}; do
			touch ${buildDir}/${prop}.${HOSTNAME}.properties
		done

		${writer} setAppServerProps ${branch} app.server.parent.dir ${bundleDir}
		${writer} setAppServerProps ${branch} app.server.type ${1}

		${writer} setBuildProps ${branch} app.server.parent.dir ${bundleDir}
		${writer} setBuildProps ${branch} app.server.type ${1}
		${writer} setBuildProps ${branch} auto.deploy.dir=${bundleDir}/deploy
		${writer} setBuildProps ${branch} lp.source.dir ${buildDir}

		if [[ $(StringValidator isSubstring ${branch} 6.1) ]]; then
			PropsWriter setBuildProps ${branch} jsp.precompile off
		else
			PropsWriter setBuildProps ${branch} jsp.precompile on
		fi

		Logger logCompletedMsg
	}

	local branch=$(BaseVars returnBranch $@)
	local buildDir=$(BaseVars returnBuildDir ${branch})
	local bundleDir=$(BaseVars returnBundleDir ${branch})
	local writer=PropsWriter

	$@
}