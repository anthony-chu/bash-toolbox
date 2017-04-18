include base.comparator.BaseComparator

ArrayUtil(){
	_trim(){
		local array=($(import ${1}))

		unset 'array[${#array[@]}-1]'

		echo ${array[@]}
	}

	appendArrayEntry(){
		local array=($(import ${1}))
		local maxLength=$(returnMaxLength array)
		local placeholder=.

		for (( i=0; i < ${#array[@]}; i++ )); do
			while [ ${#array[i]} -lt ${maxLength} ]; do
				array[${i}]+=${placeholder}
			done
		done

		echo ${array[@]}
	}

	bisect(){
		local array=($(import ${2}))
		local state=${1}

		if [[ $(BaseComparator isEqual ${state} true) ]]; then
			partition 2 1 array
		elif [[ $(BaseComparator isEqual ${state} false) ]]; then
			partition 2 2 array
		fi
	}

	flipArray(){
		local inputArray=($(import ${1}))
		local newArray=()

		for (( i=${#inputArray[@]}; i>=0; i-- )); do
			newArray+=(${inputArray[i]})
		done

		echo ${newArray[@]}
	}

	import(){
		local __array=${1}
		local _array=${__array}[@]

		echo ${!_array}
	}

	partition(){
		local _partitions=${1}
		local array=($(import ${3}))
		local partitions=$((${_partitions}-1))

		local divisor=$((${partitions}+1))
		local group=$((${2}-1))
		local size=${#array[@]}
		local length=$((${size}/${_partitions}))

		for (( i=0; i<=${partitions}; i++ )); do
			local init=$((${i}*${size}/${divisor}))

			eval "subArray${i}=(${array[@]:${init}:${length}})"
		done

		local subArray=subArray${group}[@]

		echo ${!subArray}
	}

	returnMaxLength(){
		local array=($(import ${1}))
		local maxLength=0

		for a in ${array[@]}; do
			if [[ ${#a} > ${maxLength} ]]; then
				local maxLength=${#a}
			fi
		done

		echo ${maxLength}
	}

	strip(){
		local array=($(import ${1}))

		for (( i=0; i < ${#array[@]}; i++ )); do
			if [[ $(BaseComparator isEqual ${2} ${array[i]}) ]]; then
				array[${i}]=""
			fi
		done

		echo ${array[@]}
	}

	trim(){
		local array=($(import ${1}))
		local i=0

		while [[ ${i} < ${2} ]]; do
			local array=($(_trim array))

			local i=$((i+1))
		done

		echo ${array[@]}
	}

	$@
}