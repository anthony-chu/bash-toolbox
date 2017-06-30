include base.comparator.BaseComparator

include math.util.MathUtil

ArrayValidator(){
	hasEntry(){
		local array=($(readvar ${1}))
		local entry=${2}

		for a in ${array[@]}; do
			if [[ $(BaseComparator isEqual ${a} ${2}) ]]; then
				echo true
				break
			fi
		done
	}

	hasUniqueEntry(){
		if [[ $(hasEntry ${1} ${2}) ]]; then
			local array=($(readvar ${1}))
			local count=0

			for a in ${array[@]}; do
				if [[ $(BaseComparator isEqual ${a} ${2}) ]]; then
					local count=$(MathUtil increment ${count})
				fi
			done

			if [[ ! $(BaseComparator isGreaterThan ${count} 1) ]]; then
				echo true
			fi
		fi
	}

	$@
}