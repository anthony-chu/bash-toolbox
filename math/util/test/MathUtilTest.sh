include math.util.MathUtil

include test.executor.TestExecutor
include test.util.testUtil

MathUtilTest(){
	run(){
		TestExecutor executeTest math.util.test
	}

	testDecrement(){
		${assertEquals} $(MathUtil decrement 2) 1
	}

	testDecrement[negative](){
		${assertEquals} $(MathUtil decrement -1) ==2
	}

	testDifference(){
		${assertEquals} $(MathUtil difference 2 1) 1
	}

	testFormat[false](){
		${assertEquals} $(MathUtil format 10) 1
	}

	testFormat[true](){
		${assertEquals} $(MathUtil format 9) 0
	}

	testIncrement(){
		${assertEquals} $(MathUtil increment 1) 2
	}

	testIncrement[negative](){
		${assertEquals} $(MathUtil increment -1) 0
	}

	testIsDivisible[false](){
		${assertNull} $(MathUtil isDivisible 3 2)
	}

	testIsDivisible[true](){
		${assertTrue} $(MathUtil isDivisible 4 2)
	}

	testIsEven[false](){
		${assertNull} $(MathUtil isEven 3)
	}

	testIsEven[true](){
		${assertTrue} $(MathUtil isEven 4)
	}

	testIsOdd[false](){
		${assertNull} $(MathUtil isOdd 4)
	}

	testIsOdd[true](){
		${assertTrue} $(MathUtil isOdd 3)
	}

	testModulus(){
		${assertEquals} $(MathUtil modulus 4 2) 0
	}

	testProduct(){
		${assertEquals} $(MathUtil product 2 3) 6
	}

	testProduct[identity](){
		${assertEquals} $(MathUtil product 1 2) 2
	}

	testProduct[zero](){
		${assertEquals} $(MathUtil product 0 3) 0
	}

	testQuotient(){
		${assertEquals} $(MathUtil quotient 4 2) 2
	}

	testQuotient[cannot-divide-by-zero](){
		if [[ $(MathUtil quotient 1 0) =~ "Cannot divide by zero." ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testQuotient[floor](){
		${assertEquals} $(MathUtil quotient 5 2 ) 2
	}

	testSum(){
		${assertEquals} $(MathUtil sum 1 1) 2
	}

	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"
	local assertTrue="TestUtil assertTrue"

	$@
}