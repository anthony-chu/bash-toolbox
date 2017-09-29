BaseComparator(){
	isEqual(){
		if [[ ! ${1//[0-9-]/} && ! ${2//[0-9-]} ]]; then
			echo true
		else
			if [[ ${1} == ${2} ]]; then
				echo true
			fi
		fi
	}

	isEqualIgnoreCase(){
		local x=${1}
		local y=${2}
		isEqual ${x,,} ${y,,}
	}

	isLessThan(){
		if [[ ! ${1//[0-9-]/} && ! ${2//[0-9-]/} ]]; then
			if [[ ${1} -lt ${2} ]]; then
				echo true
			fi
		else
			if [[ ${1} < ${2} ]]; then
				echo true
			fi
		fi
	}

	isGreaterThan(){
		if [[ ! ${!//[0-9-]/} && ! ${2//[0-9-]/} ]]; then
			if [[ ${1} -gt ${2} ]]; then
				echo true
			fi
		else
			if [[ ${1} > ${2} ]]; then
				echo true
			fi
		fi
	}

	$@
}