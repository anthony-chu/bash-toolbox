BaseComparatorTest(){
	local packages=(
		base.comparator.BaseComparator

		test.executor.TestExecutor
		test.util.TestUtil
	)

	run(){
		TestExecutor executeTest BaseComparatorTest
	}

	testIsEqual[number][false](){
		${assertNull} $(BaseComparator isEqual 123 321)
	}

	testIsEqual[number][true](){
		${assertTrue} $(BaseComparator isEqual 123 123)
	}

	testIsEqual[string][false](){
		${assertNull} $(BaseComparator isEqual foo bar)
	}

	testIsEqual[string][true](){
		${assertTrue} $(BaseComparator isEqual foo foo)
	}

	testIsEqualIgnoreCase[false](){
		${assertNull} $(BaseComparator isEqualIgnoreCase foo bar)
	}

	testIsEqualIgnoreCase[true](){
		${assertTrue} $(BaseComparator isEqualIgnoreCase FOO foo)
	}

	testIsLessThan[case][false](){
		${assertNull} $(BaseComparator isLessThan FOO foo)
	}

	testIsLessThan[case][true](){
		${assertTrue} $(BaseComparator isLessThan foo FOO)
	}

	testIsLessThan[number][false](){
		${assertNull} $(BaseComparator isLessThan 2 1)
	}

	testIsLessThan[number][true](){
		${assertTrue} $(BaseComparator isLessThan 1 2)
	}

	testIsLessThan[string][false](){
		${assertNull} $(BaseComparator isLessThan foo bar)
	}

	testIsLessThan[string][true](){
		${assertTrue} $(BaseComparator isLessThan bar foo)
	}

	testIsGreaterThan[case][false](){
		${assertNull} $(BaseComparator isGreaterThan foo FOO)
	}

	testIsGreaterThan[case][true](){
		${assertTrue} $(BaseComparator isGreaterThan FOO foo)
	}

	testIsGreaterThan[number][false](){
		${assertNull} $(BaseComparator isGreaterThan 1 2)
	}

	testIsGreaterThan[number][true](){
		${assertTrue} $(BaseComparator isGreaterThan 2 1)
	}

	testIsGreaterThan[string][false](){
		${assertNull} $(BaseComparator isGreaterThan bar foo)
	}

	testIsGreaterThan[string][true](){
		${assertTrue} $(BaseComparator isGreaterThan foo bar)
	}

	local assertNull="TestUtil assertNull"
	local assertTrue="TestUtil assertTrue"

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}