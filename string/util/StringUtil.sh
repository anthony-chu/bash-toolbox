include array.util.ArrayUtil

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

	join(){
		local array=($(ArrayUtil import ${1}))

		for _string in ${array[@]}; do
			local string=$(append ${string} ${_string})
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
		local input=${!1}
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