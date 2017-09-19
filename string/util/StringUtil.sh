include base.comparator.BaseComparator

include math.util.MathUtil

include string.validator.StringValidator

StringUtil(){
	append(){
		echo ${1}${2}
	}

	capitalize(){
		local str=${@}

		echo ${str^}
	}

	escape(){
		local level=$(MathUtil decrement ${2})
		local str=${1}

		if [[ ! $(BaseComparator isLessThan ${level} 0) ]]; then
			for (( i=0; i<$(MathUtil power 2 ${level}); i++ )); do
				local str="\\"${str}
			done
		fi

		echo ${str}
	}

	join(){
		local __array=${1}
		local _array=${__array}[@]
		local array=(${!_array})

		local separator=${2}

		for _string in ${array[@]}; do
			if [[ ${string} ]]; then
				local string=$(append $(
					append ${string} ${separator}) ${_string})
			else
				local string=${_string}
			fi
		done

		echo ${string}
	}

	length(){
		local str=${@}

		echo ${#str}
	}

	parseMessage(){
		replace ${@} _ space
	}

	replace(){
		local input=$(readvar ${1})
		local new=${3}
		local old=${2}

		if [[ $(BaseComparator isEqual ${new} space) ]]; then
			local new="\ "
		elif [[ $(BaseComparator isEqual ${new} null) ]]; then
			local new=""
		fi

		if [[ $(BaseComparator isEqual ${old} space) ]]; then
			local old=" "
		fi

		echo ${input} | sed "s;${old};${new};g"
	}

	returnOption(){
		if [[ $(StringValidator isOption ${1}) ]]; then
			local option=${1}

			strip option -
		fi
	}

	split(){
		replace ${@} space
	}

	strip(){
		replace ${@} null
	}

	toLowerCase(){
		local str=${@}

		echo ${str,,}
	}

	toUpperCase(){
		local str=${@}

		echo ${str^^}
	}

	$@
}