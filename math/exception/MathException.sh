include logger.Logger

MathException(){
	notANumberException(){
		Logger logErrorMsg "${1}_is_not_a_number"
		exit
	}

	$@
}