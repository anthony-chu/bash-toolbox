include language.util.LanguageUtil

include test.util.TestUtil

@class
LanguageUtilTest(){
	@test
	testToggleArticleVowelForm[false](){
		local output=($(LanguageUtil toggleArticleVowelForm cba))
		local result=(a cba)

		${assertEquals} output result
	}

	@test
	testToggleArticleVowelForm[true](){
		local output=($(LanguageUtil toggleArticleVowelForm abc))
		local result=(an abc)

		${assertEquals} output result
	}

	@test
	testTogglePlurality[singular](){
		local output=($(LanguageUtil togglePlurality 1 bar bars))
		local result=(1 bar)

		${assertEquals} output result
	}

	@test
	testTogglePlurality[multiple,plural](){
		local output=($(LanguageUtil togglePlurality 2 bar bars))
		local result=(2 bars)

		${assertEquals} output result
	}

	@test
	testTogglePlurality[multiple,plural](){
		local output=($(LanguageUtil togglePlurality 0 bar bars))
		local result=(0 bars)

		${assertEquals} output result
	}

	local assertEquals="TestUtil assertEquals"

	$@
}