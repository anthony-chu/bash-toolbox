include app.server.validator.AppServerValidator

include base.vars.BaseVars

include file.name.util.FileNameUtil

include logger.Logger

include props.writer.PropsWriter

include string.validator.StringValidator

@class
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

		local cacheDir=$(FileNameUtil getPath 1 /d/liferay-binaries-cache-2017)

		${writer} setBuildProps ${branch} build.binaries.cache.dir ${cacheDir}
		${writer} setBuildProps ${branch} lp.source.dir ${buildDir}

		if [[ $(StringValidator isSubstring ${branch} 6.1) ]]; then
			${writer} setBuildProps ${branch} jsp.precompile off
		else
			${writer} setBuildProps ${branch} jsp.precompile on
		fi

		Logger logCompletedMsg
	}

	setupSDK(){
		if [[ $(StringValidator isSubstring ${branch} master) || $(
				StringValidator isSubstring ${branch} 7.0.x) ]]; then

			local lib="tools/sdk/dependencies/com.liferay.source.formatter/lib"

			if [ ! -e ${buildDir}/${lib} ]; then
				Logger logProgressMsg "building_SDK_directory"

				cd ${buildDir}

				ant setup-sdk

				Logger logCompletedMsg
			fi
		fi
	}

	local appServer=$(AppServerValidator returnAppServer $@)
	local branch=$(FileNameUtil getPath 1 $(BaseVars getBranch $@))
	local buildDir=$(FileNameUtil getPath 1 $(
		BaseVars getBuildDir ${branch}))

	local bundleDir=$(FileNameUtil getPath 1 $(
		BaseVars getBundleDir ${branch}))

	local writer=PropsWriter

	$@
}