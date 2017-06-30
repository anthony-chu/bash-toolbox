include array.util.ArrayUtil

include math.util.MathUtil

include string.util.StringUtil

HelpMessage(){
	parseFile(){
		local descriptionMap=()
		local file=${1}
		local functionMap=()
		local lineNumber=1

		while read line; do
			if [[ ${line} == @description* ]]; then
				descriptionMap+=($(StringUtil strip line @description))

				local funLineNumber=$(MathUtil increment ${lineNumber})

				local funLine=$(sed "${funLineNumber}q;d" ${file})

				functionMap+=($(StringUtil strip funLine [\(\){]))
			fi

			local lineNumber=$(MathUtil increment ${lineNumber})
		done < ${file}

		echo ${descriptionMap[@]}
		echo ${functionMap[@]}
	}

	printHelpMessage(){
		local _file=${1}
		local map=($(parseFile ${_file}))

		local descriptionMap=($(ArrayUtil bisect true map))
		local functionMap=($(ArrayUtil bisect false map))

		local functionMap=($(ArrayUtil appendArrayEntry functionMap))

		local message=("Commands:")

		for (( i=0; i<${#descriptionMap[@]}; i++ )); do
			message+=("\t${functionMap[i]}................${descriptionMap[i]}")
		done

		for (( i=0; i<${#message[@]}; i++ )); do
			local _message=$(StringUtil parseMessage ${message[i]})

			echo -e "${_message}"
		done
	}

	$@
}