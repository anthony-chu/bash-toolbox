include props.reader.util.PropsReaderUtil

include repo.Repo

@class
PropsReader(){
	readAppServerProps(){
		${readProps} ${buildDir}/app.server.${USERNAME}.properties ${2}
	}

	readBuildProps(){
		${readProps} ${buildDir}/build.${USERNAME}.properties ${2}
	}

	readPortalProps(){
		${readProps} ${bundleDir}/portal-ext.properties ${2}
	}

	readTestProps(){
		${readProps} ${buildDir}/test.${USERNAME}.properties ${2}
	}

	local bundleDir=$(Repo getBundleDir ${2})
	local buildDir=$(Repo getBuildDir ${2})
	local readProps="PropsReaderUtil readProps"

	$@
}