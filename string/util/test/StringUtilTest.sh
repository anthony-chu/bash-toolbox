include string.util.StringUtil

include test.executor.TestExecutor

StringUtilTest(){
	run(){
		TestExecutor executeTest string.util.test
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

	testJoin(){
		local array=(foo bar)

		if [[ $(StringUtil join array) == foobar ]]; then
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

	testParseMessage(){
		local message="foo_bar"

		if [[ $(StringUtil parseMessage message) == "foo bar" ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReplace(){
		local string="foo-bar"

		if [[ $(StringUtil replace string - .) == foo.bar ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReplace[new-space](){
		local string="foo-bar"

		if [[ $(StringUtil replace string - space) == "foo bar" ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReplace[old-space](){
		local string="foo bar"

		if [[ $(StringUtil replace string space -) == foo-bar ]]; then
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

	testSplit(){
		local input="foo-bar"

		if [[ $(StringUtil split input -) == "foo bar" ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testStrip(){
		local input="foo-bar"

		if [[ $(StringUtil strip input -) == foobar ]]; then
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