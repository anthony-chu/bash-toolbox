include command.validator.CommandValidator

include logger.Logger

include string.util.StringUtil
include string.validator.StringValidator

TestExecutor(){
	executeTest(){
		local results_debug=()
		local results_fail=()
		local results_pass=()
		local testClass=${1}

		local path=($(echo ${testClass} | sed "s#\([A-Z]\)# \1#g"))

		for p in ${path[@],,}; do
			local classpath+=/${p}
		done

		local _tests=(
			$(CommandValidator
				getTestCommands bash-toolbox${classpath}/${testClass}.sh)
		)

		for _test in ${_tests[@]}; do
			local status=$(${testClass} ${_test})ED

			if [[ $(StringValidator isSubstring status PASS) ]]; then
				local logLevel=Success

				results_pass+=(${_test})
			elif [[ $(StringValidator isSubstring status FAIL) ]]; then
				local logLevel=Error

				results_fail+=(${_test})
			else
				local logLevel=Debug
				local status=SKIPPED

				results_debug+=(${_test})
			fi

			Logger log${logLevel}Msg "${testClass}#${_test}_${status}"
		done

		local total=$((
			${#results_debug[@]}+${#results_fail[@]}+${#results_pass[@]}
		))

		local message=(
			${total}_tests_found,
			${#results_pass[@]}_tests_passed,
			${#results_fail[@]}_tests_failed,
			${#results_debug[@]}_tests_skipped
		)

		Logger logInfoMsg "$(StringUtil join message _)"
	}

	$@
}