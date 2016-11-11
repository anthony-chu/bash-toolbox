include string.util.StringUtil
include test.executor.TestExecutor

StringUtilTest(){
	run(){
		local tests=(
			append
			capitalize
			length
			replace[space]
			replace
			returnOption[false]
			returnOption[true]
			toLowerCase
			toUpperCase
		)

		TestExecutor executeTest StringUtilTest ${tests[@]}
	}

	testAppend(){
		if [[ $(StringUtil append foo bar) == foobar ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testCapitalize(){
		if [[ $(StringUtil capitalize foo) == Foo ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testLength(){
		if [[ $(StringUtil length foo) == 3 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReplace(){
		if [[ $(StringUtil replace foo-bar - .) == foo.bar ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReplace[space](){
		if [[ $(StringUtil replace foo-bar - space) == "foo bar" ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnOption[false](){
		if [[ ! $(StringUtil returnOption foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnOption[true](){
		if [[ $(StringUtil returnOption -foo) == foo ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testToLowerCase(){
		if [[ $(StringUtil toLowerCase FOO) == foo ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testToUpperCase(){
		if [[ $(StringUtil toUpperCase foo) == FOO ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	${@}
}