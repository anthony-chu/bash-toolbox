include base.vars.BaseVars

include logger.Logger

OSGiUtil(){
	resetState(){
		if [[ -e ${bundleDir}/osgi/state ]]; then
			Logger logProgressMsg "deleting_osgi_state_folder"
			rm -rf ${bundleDir}/osgi/state
			Logger logCompletedMsg
		fi
	}

	if [[ ${2} ]]; then
		local branch=$(BaseVars returnBranch ${2})
		local bundleDir=$(BaseVars returnBundleDir ${2})
	else
		local branch=$(BaseVars returnBranch ${1})
		local bundleDir=$(BaseVars returnBundleDir ${1})
	fi

	$@
}