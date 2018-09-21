include logger.Logger

@class
CommandException(){
	noSuchCommandException(){
		Logger log error "\"${1}\"_is_not_a_valid_command"
		exit
	}

	$@
}