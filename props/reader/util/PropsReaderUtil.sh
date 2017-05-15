include array.util.ArrayUtil

include base.vars.BaseVars

include file.name.util.FileNameUtil

include logger.util.LoggerUtil

include props.util.PropsUtil

include string.util.StringUtil

include system.validator.SystemValidator

PropsReaderUtil(){
	getPropsFileName(){
		local _propsFile=${1}
		local propsFile=($(StringUtil split _propsFile /))

		local _path=$(ArrayUtil trim propsFile 1)

		echo /$(StringUtil replace _path space /) ${propsFile[-1]}
	}

	getValue(){
		local output=$(PropsUtil getProperty ${1} ${2})

		local value=($(StringUtil split output =))

		echo ${value[-1]}
	}

	readProps(){
		local propsFileMap=($(getPropsFileName ${1}))

		if [[ ! -e ${1} ]]; then
			local message=(
				property_file_\"${propsFileMap[1]}\"_does_not_exist_in_
				$(FileNameUtil getPath ${env} ${propsFileMap[0]})
			)

			Logger logErrorMsg "$(StringUtil join message)"
			return
		fi

		if [[ $(PropsUtil getProperty ${1} ${2}) ]]; then
			getValue ${1} ${2}
		else
			local message=(
				property_\"${2}\"_does_not_exist_in_
				${propsFileMap[1]}
			)

			Logger logErrorMsg $(StringUtil join message)
			return
		fi
	}

	local _bundleDir=$(BaseVars returnBundleDir ${2})
	local _buildDir=$(BaseVars returnBuildDir ${2})

	if [[ $(SystemValidator isWindows) ]]; then
		local env=win
	else
		local env=nix
	fi

	$@
}