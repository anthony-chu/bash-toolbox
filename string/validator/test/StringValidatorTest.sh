include string.validator.stringvalidator

include test.executor.TestExecutor
include test.util.TestUtil

StringValidatorTest(){
	run(){
		TestExecutor executeTest string.validator.test
	}

	testBeginsWith[false](){
		${assertNull} $(StringValidator beginsWith - a)
	}

	testBeginsWith[true](){
		${assertTrue} $(StringValidator beginsWith - -a)
	}

	testBeginsWithVowel[a](){
		${assertTrue} $(StringValidator beginsWithVowel alpha)
	}

	testBeginsWithVowel[A](){
		${assertTrue} $(StringValidator beginsWithVowel Alpha)
	}

	testBeginsWithVowel[e](){
		${assertTrue} $(StringValidator beginsWithVowel epsilon)
	}

	testBeginsWithVowel[E](){
		${assertTrue} $(StringValidator beginsWithVowel Epsilon)
	}

	testBeginsWithVowel[false](){
		${assertNull} $(StringValidator beginsWithVowel beta)
	}

	testBeginsWithVowel[i](){
		${assertTrue} $(StringValidator beginsWithVowel iota)
	}

	testBeginsWithVowel[I](){
		${assertTrue} $(StringValidator beginsWithVowel Iota)
	}

	testBeginsWithVowel[null](){
		${assertNull} $(StringValidator beginsWithVowel)
	}

	testBeginsWithVowel[o](){
		${assertTrue} $(StringValidator beginsWithVowel omega)
	}

	testBeginsWithVowel[O](){
		${assertTrue} $(StringValidator beginsWithVowel Omega)
	}

	testBeginsWithVowel[u](){
		${assertTrue} $(StringValidator beginsWithVowel upsilon)
	}

	testBeginsWithVowel[U](){
		${assertTrue} $(StringValidator beginsWithVowel Upsilon)
	}

	testIsAlpha[false](){
		${assertNull} $(StringValidator isAlpha 123)
	}

	testIsAlpha[space](){
		${assertTrue} $(StringValidator isAlpha abc def)
	}

	testIsAlpha[true](){
		${assertTrue} $(StringValidator isAlpha abc)
	}

	testIsAlphaNum[false](){
		${assertNull} $(StringValidator isAlphaNum abc_)
	}

	testIsAlphaNum[space](){
		${assertTrue} $(StringValidator isAlphaNum abc 123)
	}

	testIsAlphaNum[true](){
		${assertTrue} $(StringValidator isAlphaNum abc123)
	}

	testIsSubstring[false](){
		${assertNull} $(StringValidator isSubstring foobar this)
	}

	testIsSubstring[true](){
		${assertTrue} $(StringValidator isSubstring foobar foo)
	}

	testIsNull[false](){
		${assertNull} $(StringValidator isNull foo)
	}

	testIsNull[true](){
		${assertTrue} $(StringValidator isNull)
	}

	testIsNum[false](){
		${assertNull} $(StringValidator isNum abc)
	}

	testIsNum[negative](){
		${assertTrue} $(StringValidator isNum - 123)
	}

	testIsNum[true](){
		${assertTrue} $(StringValidator isNum 123)
	}

	testIsOption[alpha](){
		${assertTrue} $(StringValidator isOption -foo)
	}

	testIsOption[alphaNum](){
		${assertTrue} $(StringValidator isOption -foo123)
	}

	testIsOption[num](){
		${assertTrue} $(StringValidator isOption -123)
	}

	local assertNull="TestUtil assertNull"
	local assertTrue="TestUtil assertTrue"

	${@}
}