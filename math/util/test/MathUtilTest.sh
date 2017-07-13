include math.util.MathUtil

include test.executor.TestExecutor
include test.util.testUtil

MathUtilTest(){
	run(){
		TestExecutor executeTest MathUtilTest
	}

	testDecrement(){
		${assertEquals} $(MathUtil decrement 2) 1
	}

	testDecrement[negative](){
		${assertEquals} $(MathUtil decrement -1) -2
	}

	testDifference(){
		${assertEquals} $(MathUtil difference 2 1) 1
	}

	testFormat[false](){
		${assertEquals} $(MathUtil format 10) 10
	}

	testFormat[true](){
		${assertEquals} $(MathUtil format 9) 09
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

	testPowerBaseTwoExponentThree(){
		${assertEquals} $(MathUtil power 2 3) 8
	}

	testPowerExponentZero(){
		${assertEquals} $(MathUtil power 2 0) 1
	}

	testPowerIdentity(){
		${assertEquals} $(MathUtil power 2 1) 2
	}

	testProduct[zero](){
		${assertEquals} $(MathUtil product 0 3) 0
	}

	testQuotient(){
		${assertEquals} $(MathUtil quotient 4 2) 2
	}

	testQuotient[floor](){
		${assertEquals} $(MathUtil quotient 5 2 ) 2
	}

	testSum(){
		${assertEquals} $(MathUtil sum 1 1) 2
	}

	local assertContains="TestUtil assertContains"
	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"
	local assertTrue="TestUtil assertTrue"

	$@
}