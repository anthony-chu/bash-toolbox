include base.vars.BaseVars

include file.io.util.FileIOUtil

include props.validator.PropsValidator

PropsWriter(){

	_setProps(){
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

	if [[ ! ${bundleDir} ]]; then
		local bundleDir=$(BaseVars returnBundleDir ${2})
	else
		local bundleDir=${bundleDir}
	fi

	local _buildDir=$(BaseVars returnBuildDir ${2})
	local appServerProps=${_buildDir}/app.server.${HOSTNAME}.properties
	local buildProps=${_buildDir}/build.${HOSTNAME}.properties

	$@
}