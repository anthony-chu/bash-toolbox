include command.validator.CommandValidator
include command.validator.test.util.CommandValidatorTestUtil

include test.executor.TestExecutor
include test.util.TestUtil

CommandValidatorTest(){
	run(){
		TestExecutor executeTest CommandValidatorTest
	}

	setUp(){
		CommandValidatorTestUtil writeBashFile ${testFile}
	}

	tearDown(){
		rm -rf ${testDir}
	}

	@test
	testGetCommandsByAnnotation[@ignore](){
		${assertEquals} $(CommandValidator
			getCommandsByAnnotation ${testFile} @ignore) alpha
	}

	@test
	testGetCommandsByAnnotation[null](){
		local output=$(CommandValidator getCommandsByAnnotation ${testFile})
		local result=(Test alpha beta kappa)

		${assertEquals} output result
	}

	@test
	testGetCommandsByAnnotation[@private](){
		${assertEquals} $(CommandValidator
			getCommandsByAnnotation ${testFile} @private) beta
	}

	@test
	testGetCommandsByAnnotation[@test](){
		${assertEquals} $(CommandValidator
			getCommandsByAnnotation ${testFile} @test) kappa
	}

	local assertEquals="TestUtil assertEquals"
	local testDir=$(pwd)/bash-toolbox/test/dependencies
	local testFile=${testDir}/Test.sh

	setUp

	$@

	tearDown
}