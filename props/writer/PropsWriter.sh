include base.vars.BaseVars

include file.io.util.FileIOUtil
include file.name.util.FileNameUtil

include props.validator.PropsValidator

PropsWriter(){

	_setProps(){
		if [[ ! -e ${1} ]]; then
			local propsFile=$(FileUtil makeFile ${1})
		fi

		if [[ $(PropsValidator propertyExists ${1} ${2}) ]]; then
			FileIOUtil replace ${1} ${2}=.* ${2}=${3}
		else
			FileIOUtil append ${1} ${2}=${3}
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

	local _bundleDir=$(BaseVars returnBundleDir ${2})
	local _buildDir=$(BaseVars returnBuildDir ${2})
	local appServerProps=${_buildDir}/app.server.${HOSTNAME}.properties
	local buildProps=${_buildDir}/build.${HOSTNAME}.properties
	local portalProps=${_bundleDir}/portal-ext.properties
	local testProps=${_buildDir}/test.${HOSTNAME}.properties

	$@
}