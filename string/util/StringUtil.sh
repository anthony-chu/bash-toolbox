include base.comparator.BaseComparator

include string.validator.StringValidator

StringUtil(){
	_flipArray(){
		local inputArray=($@)
		local newArray=()

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
		local str=${@}

		echo ${#str}
	}

	parseMessage(){
		replace ${@} _ space
	}

	replace(){
		local input=(${@})

		local orig=${input[-2]}
		local new=${input[-1]}

		local _temp=($(_flipArray ${input[@]}))

		local _input=(${_temp[@]:2})

		local string=($(_flipArray ${_input[@]}))

		if [[ $(BaseComparator isEqual ${new} space) ]]; then
			local new=" "
		elif [[ $(BaseComparator isEqual ${new} null) ]]; then
			local new=""
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