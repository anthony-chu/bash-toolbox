include base.comparator.BaseComparator

include test.util.TestUtil

@class
BaseComparatorTest(){
	@test
	testIsEqual[number][false](){
		${assertNull} 123 == 321
	}

	@test
	testIsEqual[number][true](){
		${assertTrue} 123 == 123
	}

	@test
	testIsEqual[string][false](){
		${assertNull} foo == bar
	}

	@test
	testIsEqual[string][true](){
		${assertTrue} foo == foo
	}

	@test
	testIsEqualIgnoreCase[false](){
		${assertNull} $(BaseComparator isEqualIgnoreCase foo bar)
	}

	@test
	testIsEqualIgnoreCase[true](){
		${assertTrue} $(BaseComparator isEqualIgnoreCase FOO foo)
	}

	@test
	testIsLessThan[case][false](){
		${assertNull} $(BaseComparator isLessThan FOO foo)
	}

	@test
	testIsLessThan[case][true](){
		${assertTrue} $(BaseComparator isLessThan foo FOO)
	}

	@test
	testIsLessThan[number][false](){
		${assertNull} $(BaseComparator isLessThan 2 1)
	}

	@test
	testIsLessThan[number][true](){
		${assertTrue} $(BaseComparator isLessThan 1 2)
	}

	@test
	testIsLessThan[string][false](){
		${assertNull} $(BaseComparator isLessThan foo bar)
	}

	@test
	testIsLessThan[string][true](){
		${assertTrue} $(BaseComparator isLessThan bar foo)
	}

	@test
	testIsGreaterThan[case][false](){
		${assertNull} $(BaseComparator isGreaterThan foo FOO)
	}

	@test
	testIsGreaterThan[case][true](){
		${assertTrue} $(BaseComparator isGreaterThan FOO foo)
	}

	@test
	testIsGreaterThan[number][false](){
		${assertNull} $(BaseComparator isGreaterThan 1 2)
	}

	@test
	testIsGreaterThan[number][true](){
		${assertTrue} $(BaseComparator isGreaterThan 2 1)
	}

	@test
	testIsGreaterThan[string][false](){
		${assertNull} $(BaseComparator isGreaterThan bar foo)
	}

	@test
	testIsGreaterThan[string][true](){
		${assertTrue} $(BaseComparator isGreaterThan foo bar)
	}

	local assertNull="TestUtil assertNull"
	local assertTrue="TestUtil assertTrue"

	$@
}