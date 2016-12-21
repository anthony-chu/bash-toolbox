include array.util.ArrayUtil
include array.validator.ArrayValidator

include command.exception.CommandException

CommandValidator(){
	validateCommand(){
		if [[ ! $(ArrayValidator hasEntry ${@}) ]]; then
			local _flip=($(ArrayUtil flipArray ${@}))
			local cmd=${_flip[0]}

			CommandException noSuchCommandException ${cmd}
		fi
	}

	$@
}