@class
Matcher(){
	matches(){
		local pattern=$(readvar ${1})
		local string=$(readvar ${2})

		local doMatch=$(echo ${string} | grep ${pattern})

		if [[ ${doMatch} == ${string} ]]; then
			echo true
		fi
	}

	replace(){
		local pattern=$(readvar ${1})
		local replace=$(readvar ${3})
		local string=$(readvar ${2})

		if [[ ${1} == space ]]; then
			local pattern="\ "
		fi

		if [[ ${3} == space ]]; then
			local replace="\ "
		elif [[ ${1} == null ]]; then
			local replace=""
		fi

		echo ${string} | sed "s#${pattern}#${replace}#g"
	}

	$@
}