include math.util.MathUtil
include test.executor.TestExecutor

MathUtilTest(){
	run(){
		local tests=(decrement increment)

		TestExecutor executeTest MathUtil ${tests[@]}
	}

	testDecrement(){
		if [[ $(MathUtil decrement 2) == 1 ]]; then
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

	$@
}