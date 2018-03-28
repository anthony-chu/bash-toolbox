include matcher.Matcher

include test.util.TestUtil

@class
MatcherTest(){
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