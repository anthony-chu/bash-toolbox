include array.validator.ArrayValidator

include command.exception.CommandException
include command.parser.CommandParser

CommandValidator(){
	validateCommand(){
		local validCommands=($(CommandParser getValidFunctions ${1}))

		if [[ ! $(ArrayValidator hasEntry ${validCommands[@]} ${2}) ]]; then
			local cmd=${@:${#}}

			CommandException noSuchCommandException ${cmd}
		fi
	}

	$@
}