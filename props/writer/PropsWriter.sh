include base.vars.BaseVars

PropsWriter(){
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