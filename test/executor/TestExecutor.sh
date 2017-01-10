include command.validator.CommandValidator

include string.util.StringUtil

TestExecutor(){
	executeTest(){
		local _tests=(
			$(CommandValidator getValidFunctions bash-toolbox/test/${1}.sh)
		)

		local tests=()

		for _test in ${_tests[@]}; do
			if [[ ${_test} != ${1} && ${_test} != run ]]; then
				if [[ $(${1} ${_test}) == FAIL ]]; then
					echo ${1}\#${_test}
				fi
			fi
		done
	}

	$@
}