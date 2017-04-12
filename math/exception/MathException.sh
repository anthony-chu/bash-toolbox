include logger.Logger

MathException(){
	divideByZeroException(){
		Logger logErrorMsg "cannot_divide_by_zero"
	}

	notANumberException(){
		Logger logErrorMsg "\"${1}\"_is_not_a_number"
		exit
	}

	$@
}