include array.validator.ArrayValidator

include base.comparator.BaseComparator

include command.exception.CommandException

include string.util.StringUtil

@class
CommandValidator(){
	getCommandsByAnnotation(){
		local annotation=${2}
		local lineNumber=1
		local file=${1}
		local validFunctions=()

		while read line; do
			if [[ ${line} == *\(\)*{ ]]; then
				local prevLineNumber=$((${lineNumber}-1))

				if [[ $(BaseComparator isEqual ${prevLineNumber} 0) ]]; then
					local prevLineContent=""
				else
					local prevLineContent=$(sed "${prevLineNumber}q;d" ${file})
				fi

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
		local class=($(getCommandsByAnnotation ${file} @class))
		local ignore=($(getCommandsByAnnotation ${file} @ignore))
		local private=($(getCommandsByAnnotation ${file} @private))

		for a in ${all[@]}; do
			if [[ ! "${class[@]} ${ignore[@]} ${private[@]}" =~ ${a} ]]; then
				validFunctions+=(${a})
			fi
		done

		echo ${validFunctions[@]}
	}

	getTestCommands(){
		local ignore=(
			$(getCommandsByAnnotation ${1} @ignore)
		)

		local testCommands=()

		local tests=(
			$(getCommandsByAnnotation ${1} @test)
		)

		for t in ${tests[@]}; do
			if [[ ! ${ignore[@]} =~ ${t} ]]; then
				testCommands+=(${t})
			fi
		done

		echo ${testCommands[@]}
	}

	validateCommand(){
		local validCommands=(
			$(getValidFunctions ${1})
		)

		if [[ ! $(ArrayValidator hasEntry validCommands ${2}) ]]; then
			local cmd=${2}

			CommandException noSuchCommandException ${cmd}
		fi
	}

	$@
}