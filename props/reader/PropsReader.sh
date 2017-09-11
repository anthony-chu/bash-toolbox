include base.vars.BaseVars

include props.reader.util.PropsReaderUtil

PropsReader(){
	readAppServerProps(){
		${readProps} ${buildDir}/app.server.${HOSTNAME}.properties ${2}
	}

	readBuildProps(){
		${readProps} ${buildDir}/build.${HOSTNAME}.properties ${2}
	}

	readPortalProps(){
		${readProps} ${bundleDir}/portal-ext.properties ${2}
	}

	readTestProps(){
		${readProps} ${buildDir}/test.${HOSTNAME}.properties ${2}
	}

	local bundleDir=$(BaseVars returnBundleDir ${2})
	local buildDir=$(BaseVars returnBuildDir ${2})
	local readProps="PropsReaderUtil readProps"

	$@
}