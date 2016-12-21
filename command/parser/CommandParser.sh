include string.util.StringUtil

CommandParser(){
	getValidFunctions(){
		file=${1}

		validFunctions=()

		while read line; do
			if [[ ${line} == *\(\){ ]]; then
				validFunctions+=($(StringUtil strip ${line} \(\)\{))
			fi
		done < ${file}

		echo ${validFunctions[@]}
	}

	$@
}