include logger.Logger

@class
CommandException(){
	noSuchCommandException(){
		_log error "\"${1}\"_is_not_a_valid_command"
		exit
	}

	local _log="Logger log"

	$@
}