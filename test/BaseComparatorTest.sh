include base.comparator.BaseComparator
include test.executor.TestExecutor

BaseComparatorTest(){
	run(){
		local tests=(
			isEqual[Number]
			isEqual[String]
			isEqualIgnoreCase
			isLessThan[Case]
			isLessThan[Number]
			isLessThan[String]
			isGreaterThan[Case]
			isGreaterThan[Number]
			isGreaterThan[String]
		)

		TestExecutor executeTest BaseComparatorTest ${tests[@]}
	}

	testIsEqual[Number](){
		if [[ $(BaseComparator isEqual 123 123) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsEqual[String](){
		if [[ $(BaseComparator isEqual foo foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsEqualIgnoreCase(){
		if [[ $(BaseComparator isEqualIgnoreCase FOO foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsLessThan[Case](){
		if [[ $(BaseComparator isLessThan foo FOO) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsLessThan[Number](){
		if [[ $(BaseComparator isLessThan 1 2) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsLessThan[String](){
		if [[ $(BaseComparator isLessThan bar foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsGreaterThan[Case](){
		if [[ $(BaseComparator isGreaterThan FOO foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsGreaterThan[Number](){
		if [[ $(BaseComparator isGreaterThan 2 1) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsGreaterThan[String](){
		if [[ $(BaseComparator isGreaterThan foo bar) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	$@
}