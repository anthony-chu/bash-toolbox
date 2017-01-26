include base.vars.BaseVars

include file.io.util.FileIOUtil

PropsWriter(){

	setAppServerProps(){
		FileIOUtil replace ${appServerProps} ${2}=.* ${2}=${3}
	}

	setBuildProps(){
		FileIOUtil replace ${buildProps} ${2}=.* ${2}=${3}
	}

	writeAppServerProps(){
		FileIOUtil append ${appServerProps} ${2}
	}

	writeBuildProps(){
		FileIOUtil append ${buildProps} ${2}
	}

	local _buildDir=$(BaseVars returnBuildDir ${2})
	local appServerProps=${_buildDir}/app.server.${HOSTNAME}.properties
	local buildProps=${_buildDir}/build.${HOSTNAME}.properties

	$@
}