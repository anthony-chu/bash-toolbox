include array.validator.ArrayValidator
include test.executor.TestExecutor

ArrayValidatorTest(){
	run(){
		local tests=(
			hasEntry[false]
			hasEntry[true]
			hasUniqueEntry[false]
			hasUniqueEntry[true]
		)

		TestExecutor executeTest ArrayValidatorTest ${tests[@]}
	}

	testHasEntry[false](){
		local inputArray=(foo foo)

		if [[ ! $(ArrayValidator hasEntry ${inputArray[@]} bar) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testHasEntry[true](){
		local inputArray=(foo bar)

		if [[ $(ArrayValidator hasEntry ${inputArray[@]} foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testHasUniqueEntry[false](){
		local inputArray=(foo foo bar)

		if [[ ! $(ArrayValidator hasUniqueEntry ${inputArray[@]} foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testHasUniqueEntry[true](){
		local inputArray=(foo foo bar)

		if [[ $(ArrayValidator hasUniqueEntry ${inputArray[@]} bar) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	$@
}