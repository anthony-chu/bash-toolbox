include language.util.LanguageUtil

include test.executor.TestExecutor
include test.util.TestUtil

LanguageUtilTest(){
	run(){
		TestExecutor executeTest LanguageUtilTest
	}

	testToggleArticleVowelForm[false](){
		${assertEquals} $(LanguageUtil toggleArticleVowelForm cba) a
	}

	testToggleArticleVowelForm[true](){
		${assertEquals} $(LanguageUtil toggleArticleVowelForm abc) an
	}

	testTogglePlurality[false](){
		${assertEquals} $(LanguageUtil togglePlurality 1 bar bars) bar
	}

	testTogglePlurality[true](){
		${assertEquals} $(LanguageUtil togglePlurality 2 bar bars) bars
	}

	local assertEquals="TestUtil assertEquals"

	$@
}