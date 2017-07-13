include array.validator.ArrayValidator

include base.vars.BaseVars

include file.util.FileUtil
include file.writer.FileWriter

include props.util.PropsUtil

include string.util.StringUtil
include string.validator.StringValidator

PropsWriter(){
	_disableProps(){
		local property=$(PropsUtil getProperty ${1} ${2})

		if [[ ${property} &&
			! $(StringValidator beginsWith "#" ${property}) ]]; then

			FileWriter replace ${1} ${property} \#${property}
		fi
	}

	_enableProps(){
		FileWriter replace ${1} $(PropsUtil getProperty ${1} ${2}) ${2}=${3}
	}

	_setProps(){
		if [[ ! -e ${1} ]]; then
			local file=$(FileUtil makeFile ${1})
		fi

		local property=$(PropsUtil getProperty ${1} ${2})

		if [[ ${property} ]]; then
			if [[ $(StringValidator beginsWith "#" ${property}) ]]; then
				_enableProps ${1} ${2} ${3}
			else
				FileWriter replace ${1} ${2}=.* ${2}=${3}
			fi
		else
			FileWriter append ${1} ${2}=${3}
		fi
	}

	setAppServerProps(){
		_setProps ${appServerProps} ${2} ${3}
	}

	setBuildProps(){
		_setProps ${buildProps} ${2} ${3}
	}

	setPortalProps(){
		_setProps ${portalProps} ${2} ${3}
	}

	setTestProps(){
		_setProps ${testProps} ${2} ${3}
	}

	unsetAppServerProps(){
		_disableProps ${appServerProps} ${2}
	}

	unsetBuildProps(){
		_disableProps ${buildProps} ${2}
	}

	unsetPortalProps(){
		_disableProps ${portalProps} ${2}
	}

	unsetTestProps(){
		_disableProps ${testProps} ${2}
	}

	local _buildDir=$(BaseVars returnBuildDir ${2})
	local _bundleDir=$(BaseVars returnBundleDir ${2})
	local appServerProps=${_buildDir}/app.server.${HOSTNAME}.properties
	local buildProps=${_buildDir}/build.${HOSTNAME}.proeprties
	local portalProps=${_bundleDir}/portal-ext.properties
	local testProps=${_buildDir}/test.${HOSTNAME}.properties

	$@
}