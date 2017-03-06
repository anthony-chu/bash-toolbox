include base.vars.BaseVars

include logger.Logger

OSGiUtil(){
	resetState(){
		local osgiStateDir=${bundleDir}/osgi/state

		if [[ -e ${osgiStateDir} ]]; then
			Logger logProgressMsg "deleting_osgi_state_folder"
			rm -rf ${osgiStateDir}
			Logger logCompletedMsg
		fi
	}

	local bundleDir=$(BaseVars returnBundleDir $@)

	$@
}