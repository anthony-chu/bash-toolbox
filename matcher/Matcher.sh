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

	$@
}