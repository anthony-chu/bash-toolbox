include array.util.ArrayUtil

include test.executor.TestExecutor
include test.util.TestUtil

ArrayUtilTest(){
	run(){
		TestExecutor executeTest array.util.test
	}

	test_trim(){
		local inputArray=({1..7})
		local outputArray=({1..6})
		local result=($(ArrayUtil _trim inputArray))

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	testAppendArrayEntry(){
		local inputArray=(foo foobar)
		local outputArray=(foo... foobar)
		local result=($(ArrayUtil appendArrayEntry inputArray))

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	testBisect[false](){
		local inputArray=({1..6})
		local outputArray=(4 5 6)
		local result=($(ArrayUtil bisect false inputArray))

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	testBisect[true](){
		local inputArray=({1..6})
		local outputArray=({1..3})
		local result=($(ArrayUtil bisect true inputArray))

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	testFlipArray(){
		local inputArray=(foo bar)
		local outputArray=(bar foo)
		local result=($(ArrayUtil flipArray inputArray))

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	testImport(){
		local inputArray=({a..e})
		local outputArray=({a..e})

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	testPartition[1-of-3](){
		local inputArray=({1..6})
		local outputArray=(1 2)
		local result=($(ArrayUtil partition 3 1 inputArray))

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	testPartition[2-of-3](){
		local inputArray=({1..6})
		local outputArray=(3 4)
		local result=($(ArrayUtil partition 3 2 inputArray))

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	testPartition[3-of-3](){
		local inputArray=({1..6})
		local outputArray=(5 6)
		local result=($(ArrayUtil partition 3 3 inputArray))

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
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

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	testTrim[1](){
		local inputArray=({1..7})
		local outputArray=({1..6})
		local result=($(ArrayUtil trim inputArray 1))

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	testTrim[multiple](){
		local inputArray=({1..7})
		local outputArray=({1..4})
		local result=($(ArrayUtil trim inputArray 3))

		for (( i=0; i < ${#outputArray[@]}; i++ )); do
			${assertEquals} ${result[i]} ${outputArray[i]}
		done
	}

	local assertEquals="TestUtil assertEquals"

	$@
}