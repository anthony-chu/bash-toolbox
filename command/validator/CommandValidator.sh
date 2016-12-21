include array.util.ArrayUtil
include array.validator.ArrayValidator

include command.exception.CommandException
include command.parser.CommandParser

CommandValidator(){
	validateCommand(){
		local validCommands=($(CommandParser getValidFunctions ${1}))

		if [[ ! $(ArrayValidator hasEntry ${validCommands[@]} ${2}) ]]; then
			local _flip=($(ArrayUtil flipArray ${@}))
			local cmd=${_flip[0]}

			CommandException noSuchCommandException ${cmd}
		fi
	}

	$@
}