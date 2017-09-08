TestExecutor(){
	local packages=(
		command.validator.CommandValidator

		string.validator.StringValidator
	)

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
					local status=$(colorme green ${status})
				elif [[ $(StringValidator isSubstring status FAIL) ]]; then
					local status=$(colorme red ${status})
				fi

				echo -e ${testClass}\#${_test} ${status}
			fi
		done
	}

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}