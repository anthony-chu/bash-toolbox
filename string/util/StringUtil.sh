include base.comparator.BaseComparator

include string.validator.StringValidator

StringUtil(){
	append(){
		echo ${1}${2}
	}

	build(){
		for _string in ${@}; do
			local string=$(append ${string} ${_string})
		done

		echo ${string}
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