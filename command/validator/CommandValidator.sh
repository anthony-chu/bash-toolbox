include array.validator.ArrayValidator

include command.exception.CommandException

include string.util.StringUtil

CommandValidator(){
	getValidFunctions(){
		local file=${1}

		local validFunctions=()

		while read line; do
			if [[ ${line} == *\(\){ ]]; then
				validFunctions+=($(StringUtil strip line \(\)\{))
			fi
		done < ${file}

		echo ${validFunctions[@]}
	}

	validateCommand(){
		local validCommands=($(getValidFunctions ${1}))

		if [[ ! $(ArrayValidator hasEntry validCommands ${2}) ]]; then
			local cmd=${2}

			CommandException noSuchCommandException ${cmd}
		fi
	}

	$@
}