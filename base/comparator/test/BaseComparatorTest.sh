include base.comparator.BaseComparator

include test.executor.TestExecutor
include test.util.TestUtil

BaseComparatorTest(){
	run(){
		TestExecutor executeTest base.comparator.test
	}

	testIsEqual[number](){
		${assertTrue} $(BaseComparator isEqual 123 123)
	}

	testIsEqual[string](){
		${assertTrue} $(BaseComparator isEqual foo foo)
	}

	testIsEqualIgnoreCase(){
		${assertTrue} $(BaseComparator isEqualIgnoreCase FOO foo)
	}

	testIsLessThan[case](){
		${assertTrue} $(BaseComparator isLessThan foo FOO)
	}

	testIsLessThan[number](){
		${assertTrue} $(BaseComparator isLessThan 1 2)
	}

	testIsLessThan[string](){
		${assertTrue} $(BaseComparator isLessThan bar foo)
	}

	testIsGreaterThan[case](){
		${assertTrue} $(BaseComparator isGreaterThan FOO foo)
	}

	testIsGreaterThan[number](){
		${assertTrue} $(BaseComparator isGreaterThan 2 1)
	}

	testIsGreaterThan[string](){
		${assertTrue} $(BaseComparator isGreaterThan foo bar)
	}

	local assertTrue="TestUtil assertTrue"

	$@
}