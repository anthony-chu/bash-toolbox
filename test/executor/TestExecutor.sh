include command.validator.CommandValidator

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
				if [[ $(${testClass} ${_test}) == FAIL ]]; then
					echo ${testClass}\#${_test}
				fi
			fi
		done
	}

	$@
}