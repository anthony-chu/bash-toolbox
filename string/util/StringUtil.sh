include base.comparator.BaseComparator
include string.validator.StringValidator

StringUtil(){
	_flipArray(){
		inputArray=($@)
		newArray=()

		for (( i=${#inputArray[@]}; i>=0; i-- )); do
			newArray+=(${inputArray[i]})
		done

		echo ${newArray[@]}
	}

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

	parseMessage(){
		replace ${@} _ space
	}

	replace(){
		local input=(${@})

		orig=${input[-2]}
		new=${input[-1]}

		_temp=($(_flipArray ${input[@]}))

		_input=(${_temp[@]:2})

		string=($(_flipArray ${_input[@]}))

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