include string.util.StringUtil

TestExecutor(){
	executeTest(){
		local group=${1}
		shift
		local tests=(${@})

		for test in ${tests[@]}; do
			testName=$(StringUtil capitalize ${test})

			if [[ $(${group} test${testName}) == FAIL ]]; then
				echo ${group}#test${testName}
			fi
		done
	}

	${@}
}