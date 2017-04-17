include language.util.LanguageUtil

include test.executor.TestExecutor
include test.util.TestUtil

LanguageUtilTest(){
	run(){
		TestExecutor executeTest language.util.test
	}

	testToggleArticleVowelForm[false](){
		${assertEquals} $(LanguageUtil toggleArticleVowelForm cba) a
	}

	testToggleArticleVowelForm[true](){
		${assertEquals} $(LanguageUtil toggleArticleVowelForm abc) a
	}

	testTogglePlurality[false](){
		${assertEquals} $(LanguageUtil togglePlurality 1 bar bars) b
	}

	testTogglePlurality[true](){
		${assertEquals} $(LanguageUtil togglePlurality 2 bar bars) b
	}

	local assertEquals="TestUtil assertEquals"

	$@
}