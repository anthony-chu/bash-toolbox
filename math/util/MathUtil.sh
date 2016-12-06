include base.comparator.BaseComparator
include math.exception.MathException
include string.validator.StringValidator

MathUtil(){
	if [[ ! $(StringValidator isNum ${2}) ]]; then
		MathException notANumberException ${2}
	fi

	decrement(){
		difference ${1} 1
	}

	difference(){
		if [[ ! $(StringValidator isNum ${2}) ]]; then
			MathException notANumberException ${2}
		fi

		echo $((${1}-${2}))
	}

	increment(){
		sum ${1} 1
	}

	modulus(){
		if [[ ! $(StringValidator isNum ${2}) ]]; then
			MathException notANumberException ${2}
		fi

		echo $((${1}%${2}))
	}

	sum(){
		if [[ ! $(StringValidator isNum ${2}) ]]; then
			MathException notANumberException ${2}
		fi

		echo $((${1}+${2}))
	}

	$@
}