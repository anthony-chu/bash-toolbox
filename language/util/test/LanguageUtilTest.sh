include language.util.LanguageUtil

include test.executor.TestExecutor
include test.util.TestUtil

@class
LanguageUtilTest(){
	run(){
		TestExecutor executeTest LanguageUtilTest
	}

	@test
	testToggleArticleVowelForm[false](){
		${assertEquals} $(LanguageUtil toggleArticleVowelForm cba) a
	}

	@test
	testToggleArticleVowelForm[true](){
		${assertEquals} $(LanguageUtil toggleArticleVowelForm abc) an
	}

	@test
	testTogglePlurality[false](){
		${assertEquals} $(LanguageUtil togglePlurality 1 bar bars) bar
	}

	@test
	testTogglePlurality[true](){
		${assertEquals} $(LanguageUtil togglePlurality 2 bar bars) bars
	}

	local assertEquals="TestUtil assertEquals"

	$@
}