include base.comparator.BaseComparator

include math.util.MathUtil

include string.util.StringUtil

ArrayUtil(){
	appendArrayEntry(){
		local array=($(import ${1}))
		local maxLength=$(returnMaxLength array)
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
		local array=($(import ${2}))
		local state=${1}

		if [[ $(BaseComparator isEqual ${state} true) ]]; then
			partition 2 1 array
		elif [[ $(BaseComparator isEqual ${state} false) ]]; then
			partition 2 2 array
		fi
	}

	convertStringToArray(){
		local array=${1}

		StringUtil replace array , space
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
		local partitions=$(MathUtil decrement ${_partitions})

		local divisor=$(MathUtil increment ${partitions})
		local group=$(MathUtil decrement ${2})
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
			if [[ $(StringUtil length ${a}) > ${maxLength} ]]; then
				local maxLength=$(StringUtil length ${a})
			fi
		done

		echo ${maxLength}
	}

	strip(){
		local array=($(import ${1}))
		local newArray=()

		for arrayEntry in ${array[@]}; do
			if [[ ! $(BaseComparator isEqual ${2} ${arrayEntry}) ]]; then
				newArray+=(${arrayEntry})
			fi
		done

		echo ${newArray[@]}
	}

	$@
}