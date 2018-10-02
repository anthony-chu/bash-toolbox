include app.server.validator.AppServerValidator
include app.server.version.AppServerVersion

include base.vars.BaseVars

include file.name.util.FileNameUtil

include logger.Logger

include props.writer.PropsWriter

include string.validator.StringValidator

@class
SourceUtil(){
	clearGradleCache(){
		if [ -d ${buildDir}/.gradle/caches/ ]; then
			${_log} info "clearing_gradle_cache..."

			cd ${buildDir}/.gradle/caches/

			git clean -fdq

			${_log} info "completed"
		fi
	}

	config(){
		${_log} info "building_properties..."

		for prop in {app.server,build}; do
			touch ${buildDir}/${prop}.${HOSTNAME}.properties
		done

		${writer} setAppServerProps ${branch} app.server.parent.dir ${bundleDir}
		${writer} setAppServerProps ${branch} app.server.type ${appServer}

		local appServerVersion=$(
			AppServerVersion getAppServerVersion ${appServer} ${branch}
		)

		local propName=app.server.${appServer}.version
		local propValue=${appServerVersion//[a-zA-Z-]/}

		${writer} setAppServerProps ${branch} ${propName} ${propValue}

		local cacheDir=$(FileNameUtil getPath /d/liferay-binaries-cache-2017)

		${writer} setBuildProps ${branch} lp.source.dir ${buildDir}

		if [[ $(StringValidator isSubstring ${branch} 6.2) ]]; then
			${writer} setBuildProps ${branch} javac.compiler modern
		fi

		${_log} info "completed"
	}

	setupSDK(){
		if [[ $(StringValidator isSubstring ${branch} master) || $(
				StringValidator isSubstring ${branch} 7.0.x) ]]; then

			local lib="tools/sdk/dependencies/com.liferay.source.formatter/lib"

			if [ ! -e ${buildDir}/${lib} ]; then
				${_log} info "building_SDK_directory..."

				cd ${buildDir}

				ant setup-sdk

				${_log} info "completed"
			fi
		fi
	}

	local _log="Logger log"

	local appServer=$(AppServerValidator returnAppServer $@)
	local branch=$(BaseVars getBranch $@)

	local buildDir=$(
		FileNameUtil getPath $(
			BaseVars getBuildDir ${branch}
		)
	)

	local bundleDir=$(
		FileNameUtil getPath $(
			BaseVars getBundleDir ${branch}
		)
	)

	local writer=PropsWriter

	$@
}