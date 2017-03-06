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

	local bundleDir=$(BaseVars returnBundleDir $@)

	$@
}