include array.validator.ArrayValidator

include test.executor.TestExecutor
include test.util.TestUtil

ArrayValidatorTest(){
	run(){
		TestExecutor executeTest ArrayValidatorTest
	}

	testHasEntry[false](){
		local inputArray=(foo foo)

		${assertNull} $(ArrayValidator hasEntry inputArray bar)
	}

	testHasEntry[true](){
		local inputArray=(foo bar)

		${assertTrue} $(ArrayValidator hasEntry inputArray foo)
	}

	testHasUniqueEntry[false](){
		local inputArray=(foo foo bar)

		${assertNull} $(ArrayValidator hasUniqueEntry inputArray foo)
	}

	testHasUniqueEntry[true](){
		local inputArray=(foo foo bar)

		${assertTrue} $(ArrayValidator hasUniqueEntry inputArray bar)
	}

	local assertNull="TestUtil assertNull"
	local assertTrue="TestUtil assertTrue"

	$@
}