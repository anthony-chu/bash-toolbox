include string.validator.StringValidator

include test.executor.TestExecutor
include test.util.TestUtil

@class
StringValidatorTest(){
	run(){
		TestExecutor executeTest StringValidatorTest
	}

	@test
	testBeginsWith[false](){
		${assertNull} $(StringValidator beginsWith - a)
	}

	@test
	testBeginsWith[true](){
		${assertTrue} $(StringValidator beginsWith - -a)
	}

	@test
	testBeginsWithVowel[a](){
		${assertTrue} $(StringValidator beginsWithVowel alpha)
	}

	@test
	testBeginsWithVowel[A](){
		${assertTrue} $(StringValidator beginsWithVowel Alpha)
	}

	@test
	testBeginsWithVowel[e](){
		${assertTrue} $(StringValidator beginsWithVowel epsilon)
	}

	@test
	testBeginsWithVowel[E](){
		${assertTrue} $(StringValidator beginsWithVowel Epsilon)
	}

	@test
	testBeginsWithVowel[false](){
		${assertNull} $(StringValidator beginsWithVowel beta)
	}

	@test
	testBeginsWithVowel[i](){
		${assertTrue} $(StringValidator beginsWithVowel iota)
	}

	@test
	testBeginsWithVowel[I](){
		${assertTrue} $(StringValidator beginsWithVowel Iota)
	}

	@test
	testBeginsWithVowel[null](){
		${assertNull} $(StringValidator beginsWithVowel)
	}

	@test
	testBeginsWithVowel[o](){
		${assertTrue} $(StringValidator beginsWithVowel omega)
	}

	@test
	testBeginsWithVowel[O](){
		${assertTrue} $(StringValidator beginsWithVowel Omega)
	}

	@test
	testBeginsWithVowel[u](){
		${assertTrue} $(StringValidator beginsWithVowel upsilon)
	}

	@test
	testBeginsWithVowel[U](){
		${assertTrue} $(StringValidator beginsWithVowel Upsilon)
	}

	@test
	testIsAlpha[false](){
		${assertNull} $(StringValidator isAlpha 123)
	}

	@test
	testIsAlpha[space](){
		${assertTrue} $(StringValidator isAlpha abc def)
	}

	@test
	testIsAlpha[true](){
		${assertTrue} $(StringValidator isAlpha abc)
	}

	@test
	testIsAlphaNum[false](){
		${assertNull} $(StringValidator isAlphaNum abc_)
	}

	@test
	testIsAlphaNum[space](){
		${assertTrue} $(StringValidator isAlphaNum abc 123)
	}

	@test
	testIsAlphaNum[true](){
		${assertTrue} $(StringValidator isAlphaNum abc123)
	}

	@test
	testIsSubstring[false](){
		${assertNull} $(StringValidator isSubstring foobar this)
	}

	@test
	testIsSubstring[true](){
		${assertTrue} $(StringValidator isSubstring foobar foo)
	}

	@test
	testIsNull[empty-variable](){
		local this=""

		${assertTrue} $(StringValidator isNull ${this})
	}

	@test
	testIsNull[false](){
		${assertNull} $(StringValidator isNull foo)
	}

	@test
	testIsNull[true](){
		${assertTrue} $(StringValidator isNull)
	}

	@test
	testIsNull[undefined-variable](){
		${assertTrue} $(StringValidator isNull ${this})
	}

	@test
	testIsNum[false](){
		${assertNull} $(StringValidator isNum abc)
	}

	@test
	testIsNum[negative](){
		${assertTrue} $(StringValidator isNum - 123)
	}

	@test
	testIsNum[true](){
		${assertTrue} $(StringValidator isNum 123)
	}

	@test
	testIsOption[alpha](){
		${assertTrue} $(StringValidator isOption -foo)
	}

	@test
	testIsOption[alphaNum](){
		${assertTrue} $(StringValidator isOption -foo123)
	}

	@test
	testIsOption[num](){
		${assertTrue} $(StringValidator isOption -123)
	}

	local assertNull="TestUtil assertNull"
	local assertTrue="TestUtil assertTrue"

	${@}
}