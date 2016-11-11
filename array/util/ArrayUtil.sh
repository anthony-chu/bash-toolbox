include base.comparator.BaseComparator
include string.util.StringUtil

ArrayUtil(){
	appendArrayEntry(){
		local array=($@)
		local maxLength=$(returnMaxLength ${array[@]})
		local newArray=()
		local placeholder=.

		for a in ${array[@]}; do
			while [ $(StringUtil length ${a}) -lt ${maxLength} ]; do
				a=$(StringUtil append ${a} ${placeholder})
			done

			newArray+=(${a})
		done

		echo ${newArray[@]}
	}

	convertStringToArray(){
		StringUtil replace ${1} , space
	}

	flipArray(){
		inputArray=($@)
		newArray=()

		for (( i=${#inputArray[@]}; i>=0; i-- )); do
			newArray+=(${inputArray[i]})
		done

		echo ${newArray[@]}
	}

	returnMaxLength(){
		local array=($@)
		local maxLength=0

		for a in ${array[@]}; do
			if [[ $(StringUtil length ${a}) > ${maxLength} ]]; then
				maxLength=$(StringUtil length ${a})
			fi
		done

		echo ${maxLength}
	}

	strip(){
		array=(${@})
		entry=${array[-1]}

		newArray=()

		for arrayEntry in ${array[@]}; do
			if [[ ! $(BaseComparator isEqual ${entry} ${arrayEntry}) ]]; then
				newArray+=(${arrayEntry})
			fi
		done

		echo ${newArray[@]}
	}

	$@
}