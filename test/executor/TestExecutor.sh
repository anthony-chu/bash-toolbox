include command.validator.CommandValidator

include string.util.StringUtil

TestExecutor(){
	executeTest(){
		local testClass=${1}

		local _tests=(
			$(CommandValidator
				getValidFunctions bash-toolbox/test/${testClass}.sh)
		)

		local tests=()

		for _test in ${_tests[@]}; do
			if [[ ${_test} != ${testClass} && ${_test} != run ]]; then
				if [[ $(${testClass} ${_test}) == FAIL ]]; then
					echo ${testClass}\#${_test}
				fi
			fi
		done
	}

	$@
}