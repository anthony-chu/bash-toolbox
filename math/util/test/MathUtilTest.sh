include math.util.MathUtil

include test.util.TestUtil

@class
MathUtilTest(){
	@test
	testDecrement(){
		${assertEquals} $(MathUtil decrement 2) 1
	}

	@test
	testDecrement[negative](){
		${assertEquals} $(MathUtil decrement -1) -2
	}

	@test
	testDifference(){
		${assertEquals} $(MathUtil difference 2 1) 1
	}

	@test
	testExpBaseTwoExponentThree(){
		${assertEquals} $(MathUtil exp 2 3) 8
	}

	@test
	testExpExponentZero(){
		${assertEquals} $(MathUtil exp 2 0) 1
	}

	@test
	testExpIdentity(){
		${assertEquals} $(MathUtil exp 2 1) 2
	}

	@test
	testFormat[false](){
		${assertEquals} $(MathUtil format 10) 10
	}

	@test
	testFormat[true](){
		${assertEquals} $(MathUtil format 9) 09
	}

	@test
	testIncrement(){
		${assertEquals} $(MathUtil increment 1) 2
	}

	@test
	testIncrement[negative](){
		${assertEquals} $(MathUtil increment -1) 0
	}

	@test
	testIsDivisible[false](){
		${assertNull} $(MathUtil isDivisible 3 2)
	}

	@test
	testIsDivisible[true](){
		${assertTrue} $(MathUtil isDivisible 4 2)
	}

	@test
	testIsEven[false](){
		${assertNull} $(MathUtil isEven 3)
	}

	@test
	testIsEven[true](){
		${assertTrue} $(MathUtil isEven 4)
	}

	@test
	testIsOdd[false](){
		${assertNull} $(MathUtil isOdd 4)
	}

	@test
	testIsOdd[true](){
		${assertTrue} $(MathUtil isOdd 3)
	}

	@test
	testModulus(){
		${assertEquals} $(MathUtil modulus 4 2) 0
	}

	@test
	testProduct(){
		${assertEquals} $(MathUtil product 2 3) 6
	}

	@test
	testProduct[identity](){
		${assertEquals} $(MathUtil product 1 2) 2
	}

	@test
	testProduct[multiple](){
		${assertEquals} $(MathUtil product 1 2 3 4 5) 120
	}

	@test
	testProduct[zero](){
		${assertEquals} $(MathUtil product 0 3) 0
	}

	@test
	testQuotient(){
		${assertEquals} $(MathUtil quotient 4 2) 2
	}

	@test
	testQuotient[floor](){
		${assertEquals} $(MathUtil quotient 5 2 ) 2
	}

	@test
	testSum(){
		${assertEquals} $(MathUtil sum 1 1) 2
	}

	@test
	testSum[multiple](){
		${assertEquals} $(MathUtil sum 1 2 3 4) 10
	}

	local assertContains="TestUtil assertContains"
	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"
	local assertTrue="TestUtil assertTrue"

	$@
}