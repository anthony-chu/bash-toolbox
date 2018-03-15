include array.util.ArrayUtil

include file.name.util.FileNameUtil

include props.util.PropsUtil

include string.util.StringUtil
include string.validator.StringValidator

include system.validator.SystemValidator

@class
PropsReaderUtil(){
	getPropsFileName(){
		local _propsFile=${1}
		local propsFile=($(StringUtil split _propsFile /))

		local _path=$(ArrayUtil trim propsFile 1)

		echo /$(StringUtil replace _path space /) ${propsFile[-1]}
	}

	getValue(){
		local output=($(PropsUtil getProperty ${1} ${2}))

		for (( i=0; i<${#output[@]}; i++ )); do
			if [[ $(StringValidator beginsWith "#" ${output[i]}) ]]; then
				output[i]=""
			fi
		done

		local value=($(StringUtil split ${output[0]} =))

		echo ${value[-1]}
	}

	readProps(){
		local propsFileMap=($(getPropsFileName ${1}))

		if [[ ! -e ${1} ]]; then
			if [[ $(SystemValidator isWindows) ]]; then
				local env=win
			else
				local env=nix
			fi

			local message=(
				property_file_\"${propsFileMap[1]}\"_does_not_exist_in
				$(FileNameUtil getPath ${propsFileMap[0]})
			)

			Logger logErrorMsg "$(StringUtil join message _)"
			return
		fi

		if [[ $(PropsUtil getProperty ${1} ${2}) ]]; then
			getValue ${1} ${2}
		else
			local message=(
				property_\"${2}\"_does_not_exist_in
				${propsFileMap[1]}
			)

			Logger logErrorMsg "$(StringUtil join message _)"
			return
		fi
	}

	$@
}