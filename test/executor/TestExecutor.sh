include command.validator.CommandValidator

include language.util.LanguageUtil

include logger.Logger

include math.util.MathUtil

include string.util.StringUtil

@class
TestExecutor(){
	executeTest(){
		local results_debug=()
		local results_fail=()
		local results_pass=()
		local testClass=${1}

		local path=(
			$(
				echo ${testClass} | \
				sed "s#\([A-Z]\)# \1#g"
			)
		)

		for p in ${path[@],,}; do
			local classpath+=/${p}
		done

		local _tests=(
			$(
				CommandValidator
					getTestCommands bash-toolbox${classpath}/${testClass}.sh
			)
		)

		for _test in ${_tests[@]}; do
			local status=$(${testClass} ${_test})ED

			if [[ ${status} =~ FAIL ]]; then
				local logLevel=error

				results_fail+=(${_test})
			elif [[ ${status} =~ PASS ]]; then
				local logLevel=success;

				results_pass+=(${_test})
			else
				local logLevel=debug
				local status=SKIPPED

				results_debug+=(${_test})
			fi

			${_log} ${logLevel} "${testClass}#${_test}_${status}"
		done

		local total=$(MathUtil
			sum ${#results_debug[@]} ${#results_fail[@]} ${#results_pass[@]})

		local results_debug_msg=(
			$(LanguageUtil togglePlurality ${#results_debug[@]} test tests)
		)

		local results_fail_msg=(
			$(LanguageUtil togglePlurality ${#results_fail[@]} test tests)
		)

		local results_pass_msg=(
			$(LanguageUtil togglePlurality ${#results_pass[@]} test tests)
		)

		local total_msg=(
			$(LanguageUtil togglePlurality ${total} test tests)
		)

		local message=(
			$(StringUtil join total_msg _)_found,
			$(StringUtil join results_pass_msg _)_passed,
			$(StringUtil join results_fail_msg _)_failed,
			$(StringUtil join results_debug_msg _)_skipped
		)

		${_log} info "$(StringUtil join message _)"
	}

	local _log="Logger log"

	$@
}