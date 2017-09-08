StringUtilTest(){
	local packages=(
		string.util.StringUtil

		test.executor.TestExecutor
		test.util.TestUtil
	)

	run(){
		TestExecutor executeTest StringUtilTest
	}

	testAppend(){
		${assertEquals} $(StringUtil append foo bar) foobar
	}

	testCapitalize(){
		${assertEquals} $(StringUtil capitalize foo) Foo
	}

	testEscape[none](){
		${assertEquals} $(StringUtil escape "'" 0) "'"
	}

	testEscape[once](){
		${assertEquals} $(StringUtil escape "'" 1) "\\\'"
	}

	testEscape[twice](){
		${assertEquals} $(StringUtil escape "'" 2) "\\\\\\\\'"
	}

	testJoin(){
		local array=(foo bar)

		${assertEquals} $(StringUtil join array) foobar
	}

	testJoinWithSeparator(){
		local array=(foo foo bar bar)

		${assertEquals} $(StringUtil join array ,) foo,foo,bar,bar
	}

	testLength(){
		${assertEquals} $(StringUtil length foo) 3
	}

	testParseMessage(){
		local output="foo bar"
		local result="$(StringUtil parseMessage foo_bar)"

		${assertEquals} result output
	}

	testReplace(){
		${assertEquals} $(StringUtil replace foo-bar - .) foo.bar
	}

	testReplaceExactChar(){
		${assertEquals} $(StringUtil replace foo.bar [.] -) foo-bar
	}

	testReplace[new-space](){
		local output="foo bar"
		local result="$(StringUtil replace foo-bar - space)"

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
		local output="$(StringUtil split foo-bar -)"
		local result="foo bar"

		${assertEquals} output result
	}

	testStrip(){
		${assertEquals} $(StringUtil strip foo-bar -) foobar
	}

	testStripExactChar(){
		${assertEquals} $(StringUtil strip foo.bar [.]) foobar
	}

	testToLowerCase(){
		${assertEquals} $(StringUtil toLowerCase FOO) foo
	}

	testToUpperCase(){
		${assertEquals} $(StringUtil toUpperCase foo) FOO
	}

	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"

	include ${packages[@]}

	${@}

	exclude ${packages[@]}
}