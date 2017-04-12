include command.validator.CommandValidator

include string.util.StringUtil

TestExecutor(){
	executeTest(){
		local classPath=${1}
		local testClassArray=($(StringUtil split classPath [.]))

		for (( i=0; i < ${#testClassArray[@]}; i++ )); do
			testClassArray[${i}]=$(StringUtil capitalize ${testClassArray[i]})
		done

		local testClass=$(StringUtil join testClassArray)

		local _tests=(
			$(CommandValidator getValidFunctions bash-toolbox/$(StringUtil
				replace classPath [.] /)/${testClass}.sh)
		)

		for _test in ${_tests[@]}; do
			if [[ ${_test} != $(StringUtil join testClass) && ${_test} != run ]]; then
				if [[ $(${testClass} ${_test}) == FAIL ]]; then
					echo ${testClass}\#${_test}
				fi
			fi
		done
	}

	$@
}