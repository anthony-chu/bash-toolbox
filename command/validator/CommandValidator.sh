include array.validator.ArrayValidator

include command.exception.CommandException

include string.util.StringUtil

CommandValidator(){
	getValidFunctions(){
		local lineNumber=1
		local file=${1}
		local validFunctions=()

		while read line; do
			if [[ ${line} == *\(\){ ]]; then
				local prevLineNumber=$((${lineNumber}-1))

				local prevLineContent=$(sed "${prevLineNumber}q;d" ${file})

				if [[ ! ${prevLineContent} =~ @ignore &&
					! ${prevLineContent} =~ @private ]]; then

					validFunctions+=($(StringUtil strip line \(\)\{))
				fi
			fi

			local lineNumber=$((${lineNumber}+1))
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