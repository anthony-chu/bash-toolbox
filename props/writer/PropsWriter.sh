include base.vars.BaseVars

include file.io.util.FileIOUtil
include file.util.FileUtil

include props.util.PropsUtil

include string.validator.StringValidator

PropsWriter(){
	_disableProps(){
		local property=$(PropsUtil getProperty ${1} ${2})

		if [[ ${property} && ! $(StringValidator
			beginsWith "#" ${property}) ]]; then

			FileIOUtil replace ${1} ${property} \#${property}
		fi
	}

	_enableProps(){
		FileIOUtil replace ${1} $(PropsUtil getProperty ${1} ${2}) ${2}=${3}
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
				FileIOUtil replace ${1} ${2}=.* ${2}=${3}
			fi
		else
			FileIOUtil append ${1} ${2}=${3}
		fi
	}

	setAppServerProps(){
		_setProps ${_buildDir}/app.server.${HOSTNAME}.properties ${2} ${3}
	}

	setBuildProps(){
		_setProps ${_buildDir}/build.${HOSTNAME}.properties ${2} ${3}
	}

	setPortalProps(){
		_setProps ${_bundleDir}/portal-ext.properties ${2} ${3}
	}

	setTestProps(){
		_setProps ${_buildDir}/test.${HOSTNAME}.properties ${2} ${3}
	}

	local _bundleDir=$(BaseVars returnBundleDir ${2})
	local _buildDir=$(BaseVars returnBuildDir ${2})

	$@
}