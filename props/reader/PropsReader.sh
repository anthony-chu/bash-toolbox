include base.vars.BaseVars

include props.reader.util.PropsReaderUtil

PropsReader(){
	readAppServerProps(){
		${readProps} ${_buildDir}/app.server.${HOSTNAME}.properties ${2}
	}

	readBuildProps(){
		${readProps} ${_buildDir}/build.${HOSTNAME}.properties ${2}
	}

	readPortalProps(){
		${readProps} ${_bundleDir}/portal-ext.properties ${2}
	}

	readTestProps(){
		${readProps} ${_buildDir}/test.${HOSTNAME}.properties ${2}
	}

	local _bundleDir=$(BaseVars returnBundleDir ${2})
	local _buildDir=$(BaseVars returnBuildDir ${2})
	local readProps="PropsReaderUtil readProps"

	$@
}