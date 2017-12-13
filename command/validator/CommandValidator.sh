include array.validator.ArrayValidator

include command.exception.CommandException

include string.util.StringUtil

CommandValidator(){
	getCommandsByAnnotation(){
		local annotation=${2}
		local lineNumber=1
		local file=${1}
		local validFunctions=()

		while read line; do
			if [[ ${line} == *\(\){ ]]; then
				local prevLineNumber=$((${lineNumber}-1))

				local prevLineContent=$(sed "${prevLineNumber}q;d" ${file})

				if [[ ${prevLineContent} =~ ${annotation} ]]; then
					validFunctions+=($(StringUtil strip line \(\)\{))
				fi
			fi

			local lineNumber=$((${lineNumber}+1))
		done < ${file}

		echo ${validFunctions[@]}
	}

	getValidFunctions(){
		local file=${1}
		local validFunctions=()

		local all=($(getCommandsByAnnotation ${file}))
		local ignore=($(getCommandsByAnnotation ${file} @ignore))
		local private=($(getCommandsByAnnotation ${file} @private))

		for a in ${all[@]}; do
			if [[ ! "${ignore[@]} ${private[@]}" =~ ${a} ]]; then
				validFunctions+=(${a})
			fi
		done

		echo ${validFunctions[@]}
	}

	getTestCommands(){
		getCommandsByAnnotation ${1} @test
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