include string.validator.stringvalidator
include test.executor.TestExecutor

StringValidatorTest(){
	run(){
		local tests=(
			beginsWith[false]
			beginsWith[true]
			beginsWithVowel[a]
			beginsWithVowel[A]
			beginsWithVowel[e]
			beginsWithVowel[E]
			beginsWithVowel[false]
			beginsWithVowel[i]
			beginsWithVowel[I]
			beginsWithVowel[null]
			beginsWithVowel[o]
			beginsWithVowel[O]
			beginsWithVowel[u]
			beginsWithVowel[U]
			isAlpha[false]
			isAlpha[space]
			isAlpha[true]
			isAlphaNum[false]
			isAlphaNum[space]
			isAlphaNum[true]
			isSubstring[false]
			isSubstring[true]
			isNull[false]
			isNull[true]
			isNum[false]
			isNum[true]
			isOption[alpha]
			isOption[alphaNum]
			isOption[num]
		)

		TestExecutor executeTest StringValidatorTest ${tests[@]}
	}

	testBeginsWith[false](){
		if [[ ! $(StringValidator beginsWith - a) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWith[true](){
		if [[ $(StringValidator beginsWith - -a) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[a](){
		if [[ $(StringValidator beginsWithVowel alpha) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[A](){
		if [[ $(StringValidator beginsWithVowel Alpha) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[e](){
		if [[ $(StringValidator beginsWithVowel epsilon) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[E](){
		if [[ $(StringValidator beginsWithVowel Epsilon) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[false](){
		if [[ ! $(StringValidator beginsWithVowel beta) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[i](){
		if [[ $(StringValidator beginsWithVowel iota) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[I](){
		if [[ $(StringValidator beginsWithVowel Iota) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[null](){
		if [[ ! $(StringValidator beginsWithVowel) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[o](){
		if [[ $(StringValidator beginsWithVowel omega) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[O](){
		if [[ $(StringValidator beginsWithVowel Omega) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[u](){
		if [[ $(StringValidator beginsWithVowel upsilon) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testBeginsWithVowel[U](){
		if [[ $(StringValidator beginsWithVowel Upsilon) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsAlpha[false](){
		if [[ ! $(StringValidator isAlpha 123) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsAlpha[space](){
		if [[ $(StringValidator isAlpha abc def) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsAlpha[true](){
		if [[ $(StringValidator isAlpha abc) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsAlphaNum[false](){
		if [[ ! $(StringValidator isAlphaNum abc_) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsAlphaNum[space](){
		if [[ $(StringValidator isAlphaNum abc 123) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsAlphaNum[true](){
		if [[ $(StringValidator isAlphaNum abc123) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsSubstring[false](){
		if [[ ! $(StringValidator isSubstring foobar this) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsSubstring[true](){
		if [[ $(StringValidator isSubstring foobar foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsNull[false](){
		if [[ ! $(StringValidator isNull foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsNull[true](){
		if [[ $(StringValidator isNull) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsNum[false](){
		if [[ ! $(StringValidator isNum abc) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsNum[true](){
		if [[ $(StringValidator isNum 123) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsOption[alpha](){
		if [[ $(StringValidator isOption -foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsOption[alphaNum](){
		if [[ $(StringValidator isOption -foo123) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsOption[num](){
		if [[ $(StringValidator isOption -123) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	${@}
}