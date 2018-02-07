include command.validator.CommandValidator
include command.validator.test.util.CommandValidatorTestUtil

include test.util.TestUtil

@class
CommandValidatorTest(){
	setUp(){
		CommandValidatorTestUtil writeBashFile ${testFile}
	}

	@test
	testGetCommandsByAnnotation[@class](){
		${assertEquals} $(CommandValidator
			getCommandsByAnnotation ${testFile} @class) Test
	}

	@test
	testGetCommandsByAnnotation[@description](){
		${assertEquals} $(CommandValidatorTest
			getCommandsByAnnotation ${testFile} @description) alpha
	}

	@test
	testGetCommandsByAnnotation[@ignore](){
		${assertEquals} $(CommandValidator
			getCommandsByAnnotation ${testFile} @ignore) beta
	}

	@test
	testGetCommandsByAnnotation[null](){
		local output=$(CommandValidator getCommandsByAnnotation ${testFile})
		local result=(Test alpha beta kappa delta)

		${assertEquals} output result
	}

	@test
	testGetCommandsByAnnotation[@private](){
		${assertEquals} $(CommandValidator
			getCommandsByAnnotation ${testFile} @private) kappa
	}

	@test
	testGetCommandsByAnnotation[@test](){
		${assertEquals} $(CommandValidator
			getCommandsByAnnotation ${testFile} @test) delta
	}

	@test
	testGetValidFunctions(){
		local output=($(CommandValidator getValidFunctions ${testFile}))
		local result=(alpha delta)

		${assertEquals} output result
	}

	local assertEquals="TestUtil assertEquals"
	local testDir=$(TestUtil setupTestDir)
	local testFile=${testDir}/Test.sh

	setUp

	$@

	TestUtil tearDown
}