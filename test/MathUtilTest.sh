include math.util.MathUtil
include test.executor.TestExecutor

MathUtilTest(){
	run(){
		local tests=(
			decrement
			decrement[negative]
			increment
			increment[negative]
		)

		TestExecutor executeTest MathUtilTest ${tests[@]}
	}

	testDecrement(){
		if [[ $(MathUtil decrement 2) == 1 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testDecrement[negative](){
		if [[ $(MathUtil decrement -1) == -2 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIncrement(){
		if [[ $(MathUtil increment 1) == 2 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIncrement[negative](){
		if [[ $(MathUtil increment -1) == 0 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	$@
}