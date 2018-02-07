include string.util.StringUtil

include test.util.TestUtil

@class
StringUtilTest(){
	@test
	testAppend(){
		${assertEquals} $(StringUtil append foo bar) foobar
	}

	@test
	testCapitalize(){
		${assertEquals} $(StringUtil capitalize foo) Foo
	}

	@test
	testEscape[none](){
		${assertEquals} $(StringUtil escape "'" 0) "'"
	}

	@test
	testEscape[once](){
		${assertEquals} $(StringUtil escape "'" 1) "\\\'"
	}

	@test
	testEscape[twice](){
		${assertEquals} $(StringUtil escape "'" 2) "\\\\\\\\'"
	}

	@test
	testJoin(){
		local array=(foo bar)

		${assertEquals} $(StringUtil join array) foobar
	}

	@test
	testJoinWithSeparator(){
		local array=(foo foo bar bar)

		${assertEquals} $(StringUtil join array ,) foo,foo,bar,bar
	}

	@test
	testLength(){
		${assertEquals} $(StringUtil length foo) 3
	}

	@test
	testParseMessage(){
		local output="foo bar"
		local result="$(StringUtil parseMessage foo_bar)"

		${assertEquals} result output
	}

	@test
	testReplace(){
		${assertEquals} $(StringUtil replace foo-bar - .) foo.bar
	}

	@test
	testReplaceExactChar(){
		${assertEquals} $(StringUtil replace foo.bar [.] -) foo-bar
	}

	@test
	testReplace[new-space](){
		local output="foo bar"
		local result="$(StringUtil replace foo-bar - space)"

		${assertEquals} result output
	}

	@test
	testReplace[old-space](){
		local string="foo bar"

		${assertEquals} $(StringUtil replace string space -) foo-bar
	}

	@test
	testReturnOption[false](){
		${assertNull} $(StringUtil returnOption foo)
	}

	@test
	testReturnOption[true](){
		${assertEquals} $(StringUtil returnOption -foo) foo
	}

	@test
	testSplit(){
		local output="$(StringUtil split foo-bar -)"
		local result="foo bar"

		${assertEquals} output result
	}

	@test
	testStrip(){
		${assertEquals} $(StringUtil strip foo-bar -) foobar
	}

	@test
	testStripExactChar(){
		${assertEquals} $(StringUtil strip foo.bar [.]) foobar
	}

	@test
	testTrimLeadingChars(){
		local input=123456789
		local output=789

		${assertEquals} $(StringUtil trim input 456 -1) output
	}

	@test
	testTrimStripChars(){
		local input=123456789
		local output=123789

		${assertEquals} $(StringUtil trim input 456 0) output
	}

	@test
	testTrimTrailingChars(){
		local input=123456789
		local output=123

		${assertEquals} $(StringUtil trim input 456 1) output
	}

	@test
	testToLowerCase(){
		${assertEquals} $(StringUtil toLowerCase FOO) foo
	}

	@test
	testToUpperCase(){
		${assertEquals} $(StringUtil toUpperCase foo) FOO
	}

	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"

	${@}
}