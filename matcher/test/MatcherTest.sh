include matcher.Matcher

include test.util.TestUtil

@class
MatcherTest(){
	@test
	testReplaceMultipleGroups(){
		local pattern='\([0-9]\+\)-[a-z]\+-\([0-9]\+\)'
		local replace='\1+\2'
		local string="123-abc-123"

		TestUtil assertEquals $(Matcher replace pattern string replace) "123+123"
	}

	@test
	testReplaceSingleGroup(){
		local pattern='[0-9]\+-\([a-z]\+\)-[0-9]\+'
		local replace='\1'
		local string="123-abc-123"

		TestUtil assertEquals $(Matcher replace pattern string replace) abc
	}

	@test
	testReplacePatternWithString(){
		local pattern='[0-9]\+-[a-z]\+-[0-9]\+'
		local replace="xyz"
		local string="123-abc-123"

		TestUtil assertEquals $(Matcher replace pattern string replace) xyz
	}

	@test
	testMatcherMatchesPattern(){
		local _string=123abc123

		TestUtil assertTrue $(Matcher matches _pattern _string)
	}

	@test
	testMatcherDoesNotMatchPattern(){
		local _string=abc123abc

		TestUtil assertNull $(Matcher matches _pattern _string)
	}

	local _pattern='[0-9]\+[a-zA-Z]\+[0-9]\+'

	$@
}