include base.comparator.BaseComparator

include math.exception.MathException

include string.util.StringUtil
include string.validator.StringValidator

MathUtil(){
	if [[ ! $(StringValidator isNum ${2}) ]]; then
		MathException notANumberException ${2}
	fi

	if [[ ! $(StringValidator isNum ${3}) ]]; then
		MathException notANumberException ${3}
	fi

	decrement(){
		difference ${1} 1
	}

	difference(){
		echo $((${1}-${2}))
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
			local var=$(StringUtil strip ${var} 0)
		fi

		echo $((${var}%${2}))
	}

	sum(){
		echo $((${1}+${2}))
	}

	$@
}