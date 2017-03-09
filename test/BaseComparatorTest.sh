include base.comparator.BaseComparator

include test.executor.TestExecutor

BaseComparatorTest(){
	run(){
		TestExecutor executeTest BaseComparatorTest
	}

	testIsEqual[number](){
		if [[ $(BaseComparator isEqual 123 123) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsEqual[string](){
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

	testIsLessThan[case](){
		if [[ $(BaseComparator isLessThan foo FOO) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsLessThan[number](){
		if [[ $(BaseComparator isLessThan 1 2) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsLessThan[string](){
		if [[ $(BaseComparator isLessThan bar foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsGreaterThan[case](){
		if [[ $(BaseComparator isGreaterThan FOO foo) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsGreaterThan[number](){
		if [[ $(BaseComparator isGreaterThan 2 1) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsGreaterThan[string](){
		if [[ $(BaseComparator isGreaterThan foo bar) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	$@
}