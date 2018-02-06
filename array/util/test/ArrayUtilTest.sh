include array.util.ArrayUtil

include test.executor.TestExecutor
include test.util.TestUtil

@class
ArrayUtilTest(){
	@test
	test_trim(){
		local inputArray=({1..7})
		local outputArray=({1..6})
		local result=($(ArrayUtil _trim inputArray))

		${assertEquals} result outputArray
	}

	@test
	testAppendArrayEntry(){
		local inputArray=(foo foobar)
		local outputArray=(foo... foobar)
		local result=($(ArrayUtil appendArrayEntry inputArray))

		${assertEquals} result outputArray
	}

	@test
	testBisect[false](){
		local inputArray=({1..6})
		local outputArray=(4 5 6)
		local result=($(ArrayUtil bisect false inputArray))

		${assertEquals} result outputArray
	}

	@test
	testBisect[true](){
		local inputArray=({1..6})
		local outputArray=({1..3})
		local result=($(ArrayUtil bisect true inputArray))

		${assertEquals} result outputArray
	}

	@test
	testPartition[1-of-3](){
		local inputArray=({1..6})
		local outputArray=(1 2)
		local result=($(ArrayUtil partition 3 1 inputArray))

		${assertEquals} result outputArray
	}

	@test
	testPartition[2-of-3](){
		local inputArray=({1..6})
		local outputArray=(3 4)
		local result=($(ArrayUtil partition 3 2 inputArray))

		${assertEquals} result outputArray
	}

	@test
	testPartition[3-of-3](){
		local inputArray=({1..6})
		local outputArray=(5 6)
		local result=($(ArrayUtil partition 3 3 inputArray))

		${assertEquals} result outputArray
	}

	@test
	testReturnMaxLength(){
		local inputArray=(foo foobar)
		local maxLength=6

		${assertEquals} $(ArrayUtil returnMaxLength inputArray) ${maxLength}
	}

	@test
	testReturnMaxLength[greater-than-10](){
		local inputArray=(foo foobar foofoobarbar)
		local maxLength=12

		${assertEquals} $(ArrayUtil returnMaxLength inputArray) ${maxLength}
	}

	@test
	testReturnUniqueArray(){
		local inputArray=(foo foo bar foobar)
		local outputArray=(foo bar foobar)
		local result=($(ArrayUtil returnUniqueArray inputArray))

		${assertEquals} result outputArray
	}

	@test
	testReverse(){
		local inputArray=(foo bar)
		local outputArray=(bar foo)
		local result=($(ArrayUtil reverse inputArray))

		${assertEquals} result outputArray
	}

	@test
	testStrip(){
		local inputArray=(foo foo bar bar)
		local outputArray=(bar bar)
		local result=($(ArrayUtil strip inputArray foo))

		${assertEquals} result outputArray
	}

	@test
	testTrim[1](){
		local inputArray=({1..7})
		local outputArray=({1..6})
		local result=($(ArrayUtil trim inputArray 1))

		${assertEquals} result outputArray
	}

	@test
	testTrim[multiple](){
		local inputArray=({1..7})
		local outputArray=({1..4})
		local result=($(ArrayUtil trim inputArray 3))

		${assertEquals} result outputArray
	}

	local assertEquals="TestUtil assertEquals"

	$@
}