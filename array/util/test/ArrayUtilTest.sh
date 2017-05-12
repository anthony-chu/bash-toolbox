include array.util.ArrayUtil

include test.executor.TestExecutor
include test.util.TestUtil

ArrayUtilTest(){
	run(){
		TestExecutor executeTest ArrayUtilTest
	}

	test_trim(){
		local inputArray=({1..7})
		local outputArray=({1..6})
		local result=($(ArrayUtil _trim inputArray))

		${assertEquals} result outputArray
	}

	testAppendArrayEntry(){
		local inputArray=(foo foobar)
		local outputArray=(foo... foobar)
		local result=($(ArrayUtil appendArrayEntry inputArray))

		${assertEquals} result outputArray
	}

	testBisect[false](){
		local inputArray=({1..6})
		local outputArray=(4 5 6)
		local result=($(ArrayUtil bisect false inputArray))

		${assertEquals} result outputArray
	}

	testBisect[true](){
		local inputArray=({1..6})
		local outputArray=({1..3})
		local result=($(ArrayUtil bisect true inputArray))

		${assertEquals} result outputArray
	}

	testFlipArray(){
		local inputArray=(foo bar)
		local outputArray=(bar foo)
		local result=($(ArrayUtil flipArray inputArray))

		${assertEquals} result outputArray
	}

	testImport(){
		local inputArray=({a..e})
		local outputArray=({a..e})
		local result=($(ArrayUtil import inputArray))

		${assertEquals} result outputArray
	}

	testPartition[1-of-3](){
		local inputArray=({1..6})
		local outputArray=(1 2)
		local result=($(ArrayUtil partition 3 1 inputArray))

		${assertEquals} result outputArray
	}

	testPartition[2-of-3](){
		local inputArray=({1..6})
		local outputArray=(3 4)
		local result=($(ArrayUtil partition 3 2 inputArray))

		${assertEquals} result outputArray
	}

	testPartition[3-of-3](){
		local inputArray=({1..6})
		local outputArray=(5 6)
		local result=($(ArrayUtil partition 3 3 inputArray))

		${assertEquals} result outputArray
	}

	testReturnMaxLength(){
		local inputArray=(foo foobar)
		local maxLength=6

		${assertEquals} $(ArrayUtil returnMaxLength inputArray) ${maxLength}
	}

	testStrip(){
		local inputArray=(foo foo bar bar)
		local outputArray=(bar bar)
		local result=($(ArrayUtil strip inputArray foo))

		${assertEquals} result outputArray
	}

	testTrim[1](){
		local inputArray=({1..7})
		local outputArray=({1..6})
		local result=($(ArrayUtil trim inputArray 1))

		${assertEquals} result outputArray
	}

	testTrim[multiple](){
		local inputArray=({1..7})
		local outputArray=({1..4})
		local result=($(ArrayUtil trim inputArray 3))

		${assertEquals} result outputArray
	}

	local assertEquals="TestUtil assertEquals"

	$@
}