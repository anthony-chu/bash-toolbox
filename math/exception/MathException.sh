include math.exception.util.MathExceptionUtil

MathException(){
	notANumberException(){
		MathExceptionUtil logErrorMsg "${1}_is_not_a_number"
		exit
	}

	$@
}