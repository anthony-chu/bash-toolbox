include array.util.ArrayUtil

include base.comparator.BaseComparator

ArrayValidator(){
	hasEntry(){
		local array=$(ArrayUtil import ${1})
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
			local array=($(ArrayUtil import ${1}))
			local count=0

			for a in ${array[@]}; do
				if [[ $(BaseComparator isEqual ${a} ${2}) ]]; then
					((count++))
				fi
			done

			if [[ ! $(BaseComparator isGreaterThan ${count} 1) ]]; then
				echo true
			fi
		fi
	}

	$@
}