include base.comparator.BaseComparator
include string.validator.StringValidator

StringUtil(){
	append(){
		echo ${1}${2}
	}

	capitalize(){
		local str=${@}

		echo ${str^}
	}

	length(){
		str=${@}

		echo ${#str}
	}

	replace(){
		local input=(${@})

		orig=${input[-2]}
		new=${input[-1]}

		for (( i=${#input[@]}; i>=0; i-- )); do
			_temp+=(${input[i]})
		done

		_input=(${_temp[@]:2})

		for (( i=${#_input[@]}; i>=0; i-- )); do
			string+=(${_input[i]})
		done

		if [[ $(BaseComparator isEqual ${orig} space) ]]; then
			orig=" "
		fi

		if [[ $(BaseComparator isEqual ${new} space) ]]; then
			new=" "
		elif [[ $(BaseComparator isEqual ${new} null) ]]; then
			new=""
		fi

		echo ${string[@]//${orig}/${new}}
	}

	returnOption(){
		if [[ $(StringValidator isOption ${1}) ]]; then
			strip ${1} -
		fi
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