include array.util.ArrayUtil
include array.validator.ArrayValidator

include command.exception.CommandException

CommandValidator(){
	validateCommand(){
		if [[ ! $(ArrayValidator hasEntry ${@}) ]]; then
			_flip=($(ArrayUtil flipArray ${@}))
			cmd=${_flip[0]}

			CommandException noSuchCommandException ${cmd}
		fi
	}

	$@
}