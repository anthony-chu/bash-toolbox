include command.validator.CommandValidator

include logger.Logger

include string.validator.StringValidator

TestExecutor(){
	executeTest(){
		local testClass=${1}

		local path=($(echo ${testClass} | sed "s#\([A-Z]\)# \1#g"))

		for p in ${path[@],,}; do
			local classpath+=/${p}
		done

		local _tests=(
			$(CommandValidator
				getValidFunctions bash-toolbox${classpath}/${testClass}.sh)
		)

		local ignorableCommands="${testClass} run setUp tearDown"

		for _test in ${_tests[@]}; do
			local isIgnorable=$(
				StringValidator isSubstring ignorableCommands _test)

			if [[ ! ${isIgnorable} ]]; then
				local status=$(${testClass} ${_test})ED

				if [[ $(StringValidator isSubstring status PASS) ]]; then
					local logLevel=Success
				elif [[ $(StringValidator isSubstring status FAIL) ]]; then
					local logLevel=Error
				fi

				Logger log${logLevel}Msg "${testClass}#${_test}_${status}"
			fi
		done
	}

	$@
}