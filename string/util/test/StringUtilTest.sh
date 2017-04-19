include string.util.StringUtil

include test.executor.TestExecutor
include test.util.TestUtil

StringUtilTest(){
	run(){
		TestExecutor executeTest string.util.test
	}

	testAppend(){
		${assertEquals} $(StringUtil append foo bar) foobar
	}

	testCapitalize(){
		${assertEquals} $(StringUtil capitalize foo) Foo
	}

	testJoin(){
		local array=(foo bar)

		${assertEquals} $(StringUtil join array) foobar
	}

	testLength(){
		${assertEquals} $(StringUtil length foo) 3
	}

	testParseMessage(){
		local input="foo_bar"
		local output="foo bar"
		local result="$(StringUtil parseMessage input)"

		${assertEquals} result output
	}

	testReplace(){
		local string="foo-bar"

		${assertEquals} $(StringUtil replace string - .) foo.bar
	}

	testReplace[new-space](){
		local input="foo-bar"
		local output="foo bar"
		local result="$(StringUtil replace input - space)"

		${assertEquals} result output
	}

	testReplace[old-space](){
		local string="foo bar"

		${assertEquals} $(StringUtil replace string space -) foo-bar
	}

	testReturnOption[false](){
		${assertNull} $(StringUtil returnOption foo)
	}

	testReturnOption[true](){
		${assertEquals} $(StringUtil returnOption -foo) foo
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

		${assertEquals} $(StringUtil strip input -) foobar
	}

	testToLowerCase(){
		${assertEquals} $(StringUtil toLowerCase FOO) foo
	}

	testToUpperCase(){
		${assertEquals} $(StringUtil toUpperCase foo) FOO
	}

	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"

	${@}
}