include base.comparator.BaseComparator

include test.executor.TestExecutor
include test.util.TestUtil

BaseComparatorTest(){
	run(){
		TestExecutor executeTest BaseComparatorTest
	}

	testIsEqual[number][true](){
		${assertTrue} $(BaseComparator isEqual 123 123)
	}

	testIsEqual[string][true](){
		${assertTrue} $(BaseComparator isEqual foo foo)
	}

	testIsEqualIgnoreCase[true](){
		${assertTrue} $(BaseComparator isEqualIgnoreCase FOO foo)
	}

	testIsLessThan[case][true](){
		${assertTrue} $(BaseComparator isLessThan foo FOO)
	}

	testIsLessThan[number][true](){
		${assertTrue} $(BaseComparator isLessThan 1 2)
	}

	testIsLessThan[string][true](){
		${assertTrue} $(BaseComparator isLessThan bar foo)
	}

	testIsGreaterThan[case][true](){
		${assertTrue} $(BaseComparator isGreaterThan FOO foo)
	}

	testIsGreaterThan[number][true](){
		${assertTrue} $(BaseComparator isGreaterThan 2 1)
	}

	testIsGreaterThan[string][true](){
		${assertTrue} $(BaseComparator isGreaterThan foo bar)
	}

	local assertTrue="TestUtil assertTrue"

	$@
}