include base.comparator.BaseComparator

include math.util.MathUtil

include string.util.StringUtil

ArrayUtil(){
	appendArrayEntry(){
		local array=($@)
		local maxLength=$(returnMaxLength ${array[@]})
		local newArray=()
		local placeholder=.

		for a in ${array[@]}; do
			while [ $(StringUtil length ${a}) -lt ${maxLength} ]; do
				local a=$(StringUtil append ${a} ${placeholder})
			done

			newArray+=(${a})
		done

		echo ${newArray[@]}
	}

	bisect(){
		local state=${1}

		shift

		local array=(${@})

		if [[ $(BaseComparator isEqual ${state} true) ]]; then
			partition 2 1 ${array[@]}
		elif [[ $(BaseComparator isEqual ${state} false) ]]; then
			partition 2 2 ${array[@]}
		fi
	}

	convertStringToArray(){
		StringUtil replace ${1} , space
	}

	flipArray(){
		local inputArray=($@)
		local newArray=()

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
				local maxLength=$(StringUtil length ${a})
			fi
		done

		echo ${maxLength}
	}

	partition(){
		local _partitions=${1}
		local partitions=$(MathUtil decrement ${1})
		shift
		local group=$(MathUtil decrement ${1})
		shift

		local array=(${@})
		local divisor=$(MathUtil increment ${partitions})
		local size=${#array[@]}
		local length=$((${size}/${_partitions}))

		for (( i=0; i<=${partitions}; i++ )); do
			local init=$((${i}*${size}/${divisor}))

			eval "subArray${i}=(${array[@]:${init}:${length}})"
		done

		local subArray=subArray${group}[@]

		echo ${!subArray}
	}

	strip(){
		local array=(${@})
		local entry=${array[-1]}

		local newArray=()

		for arrayEntry in ${array[@]}; do
			if [[ ! $(BaseComparator isEqual ${entry} ${arrayEntry}) ]]; then
				newArray+=(${arrayEntry})
			fi
		done

		echo ${newArray[@]}
	}

	$@
}