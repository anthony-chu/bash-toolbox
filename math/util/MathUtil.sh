include base.comparator.BaseComparator

include string.validator.StringValidator

MathUtil(){
	decrement(){
		difference ${1} 1
	}

	difference(){
		echo $((${1}-${2}))
	}

	format(){
		if [[ ${1} -le 9 ]]; then
			echo 0${1}
		else
			echo ${1}
		fi
	}

	increment(){
		sum ${1} 1
	}

	isDivisible(){
		BaseComparator isEqual $(modulus ${1} ${2}) 0
	}

	isEven(){
		isDivisible ${1} 2
	}

	isOdd(){
		if [[ ! $(isEven ${1}) ]]; then
			echo true
		fi
	}

	modulus(){
		local var=${1}

		if [[ $(StringValidator beginsWith 0 ${var}) ]]; then
			local var=${var//0/}
		fi

		echo $((${var}%${2}))
	}

	exp(){
		local base=${1}
		local exponent=${2}

		echo $((${1}**${2}))
	}

	product(){
		echo $((${1}*${2}))
	}

	quotient(){
		echo $((${1}/${2}))
	}

	sum(){
		echo $((${1}+${2}))
	}

	$@
}