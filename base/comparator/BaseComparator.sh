BaseComparator(){
	isEqual(){
		if [[ ${1} == ${2} ]]; then
			echo true
		fi
	}

	isEqualIgnoreCase(){
		local x=${1}
		local y=${2}
		isEqual ${x,,} ${y,,}
	}

	isLessThan(){
		if [[ ${1} < ${2} ]]; then
			echo true
		fi
	}

	isGreaterThan(){
		if [[ ${1} > ${2} ]]; then
			echo true
		fi
	}

	$@
}