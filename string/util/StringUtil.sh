include base.comparator.BaseComparator

include math.util.MathUtil

include string.validator.StringValidator

@class
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

		if [[ ${level} -gt 0 ]]; then
			for (( i=0; i<$(MathUtil exp 2 ${level}); i++ )); do
				local str=$(append \\ ${str})
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
			if [[ ${str} ]]; then
				local str=$(append $(append ${str} ${separator}) ${_string})
			else
				local str=${_string}
			fi
		done

		echo ${str}
	}

	length(){
		local str=${@}

		echo ${#str}
	}

	parseMessage(){
		replace ${1} _ space
	}

	replace(){
		local input=$(readvar ${1})
		local new=${3}
		local old=${2}

		if [[ ${new} == space ]]; then
			local new="\ "
		elif [[ ${new} == null ]]; then
			local new=""
		fi

		if [[ ${old} == space ]]; then
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

	substring(){
		if [[ $# == 3 ]]; then
			local init=${2}
			local length=${3}
			local string=$(readvar ${1})
		elif [[ $# == 2 ]]; then
			local init=0
			local length=${2}
			local string=$(readvar ${1})
		fi

		echo ${string:${init}:${length}}
	}

	toArray(){
		local array=()
		local string=$(readvar ${1})

		for (( i=0; i<$(length ${string}); i++ )); do
			array+=(${string:i:1})
		done

		echo ${array[@]}
	}

	toLowerCase(){
		local str=${@}

		echo ${str,,}
	}

	toUpperCase(){
		local str=${@}

		echo ${str^^}
	}

	trim(){
		local mode=${3}
		local string=$(readvar ${1})
		local substring=$(readvar ${2})

		case ${mode} in
			0) strip string ${substring} ;;
			1) echo ${string%$substring*} ;;
			-1) echo ${string#*$substring} ;;
			*) strip string ${substring} ;;
		esac
	}

	$@
}