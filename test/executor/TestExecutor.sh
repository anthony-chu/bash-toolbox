include command.validator.CommandValidator

include string.util.StringUtil

TestExecutor(){
	executeTest(){
		local classPath=${1}
		local testClassArray=($(StringUtil split classPath [.]))

		for (( i=0; i < ${#testClass[@]}; i++ )); do
			testClassArray[${i}]=$(StringUtil capitalize ${testClassArray[i]})
		done

		local _tests=(
			$(CommandValidator getValidFunctions bash-toolbox/$(StringUtil
				replace classPath [.] /)/$(StringUtil join testClass).sh)
		)

		for _test in ${_tests[@]}; do
			if [[ ${_test} != $(StringUtil join testClass) && ${_test} != run ]]; then
				if [[ $($(StringUtil join testClass) ${_test}) == FAIL ]]; then
					echo ${testClass}\#${_test}
				fi
			fi
		done
	}

	$@
}