CommandException(){
	local packages=(
		logger.Logger
	)

	noSuchCommandException(){
		Logger logErrorMsg "\"${1}\"_is_not_a_valid_command"
		exit
	}

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}