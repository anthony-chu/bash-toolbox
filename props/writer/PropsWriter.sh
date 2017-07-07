include array.validator.ArrayValidator

include base.vars.BaseVars

include file.io.util.FileIOUtil
include file.util.FileUtil

include props.util.PropsUtil

include string.util.StringUtil
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

	copyLegacyProperties(){
		local version=${2}

		if [[ $(StringValidator beginsWith 6. ${version}) ]]; then
			local minorVersions=(0 1 2)

			if [[ $(ArrayValidator hasEntry minorVersions $(StringUtil
				strip version 6.)) ]]; then

				local _legacyProps=portal-legacy-${version}.properties

				local legacyProps=bash-toolbox/resources/${_legacyProps}
				local portalProps=${_bundleDir}/portal-ext.properties

				cat ${legacyProps} >> ${portalProps}
			fi
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

	unsetAppServerProps(){
		_disableProps ${_buildDir}/app.server.${HOSTNAME}.properties ${2}
	}

	unsetBuildProps(){
		_disableProps ${_buildDir}/build.${HOSTNAME}.properties ${2}
	}

	unsetPortalProps(){
		_disableProps ${_bundleDir}/portal-ext.properties ${2}
	}

	unsetTestProps(){
		_disableProps ${_buildDir}/test.${HOSTNAME}.properties ${2}
	}

	local _bundleDir=$(BaseVars returnBundleDir ${2})
	local _buildDir=$(BaseVars returnBuildDir ${2})

	$@
}