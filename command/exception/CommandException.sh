include logger.Logger

CommandException(){
	noSuchCommandException(){
		Logger logErrorMsg "\"${1}\"_is_not_a_valid_command"
		exit
	}

	$@
}