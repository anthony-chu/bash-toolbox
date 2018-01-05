include array.util.ArrayUtil

include file.util.FileUtil

include math.util.MathUtil

include string.util.StringUtil

@class
HelpMessage(){
	getParam(){
		local annotation="@param"
		local descriptionMap=()
		local file=$(FileUtil getCurFile true)
		local lineNumber=1
		local paramMap=()

		while read line; do
			if [[ ${line} == ${annotation}* ]]; then
				descriptionMap+=(${line//${annotation}/})

				local nextLineNumber=$((lineNumber+1))

				local nextLineContent=$(sed "${nextLineNumber}q;d" ${file})

				local substring1="="
				local substring2="local"

				local nextLineContent=$(
					StringUtil trim nextLineContent substring1 1)

				local nextLineContent=$(
					StringUtil trim nextLineContent substring2 -1)

				paramMap+=(${nextLineContent})
			fi

			local lineNumber=$((lineNumber+1))
		done < ${file}

		echo ${descriptionMap[@]}
		echo ${paramMap[@]}
	}

	parseFile(){
		local descriptionMap=()
		local file=$(FileUtil getCurFile true)
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
		local map=($(parseFile))

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