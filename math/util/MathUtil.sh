include math.exception.MathException
include string.validator.StringValidator

MathUtil(){
	if [[ ! $(StringValidator isNum ${2}) ]]; then
		MathException notANumberException ${2}
	fi

	decrement(){
		echo $((${1}-1))
	}

	difference(){
		if [[ ! $(StringValidator isNum ${2}) ]]; then
			MathException notANumberException ${2}
		fi

		echo $((${1}-${2}))
	}

	increment(){
		echo $((${1}+1))
	}

	sum(){
		if [[ ! $(StringValidator isNum ${2}) ]]; then
			MathException notANumberException ${2}
		fi

		echo $((${1}+${2}))
	}

	$@
}