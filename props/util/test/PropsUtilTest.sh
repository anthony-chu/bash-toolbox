include props.test.util.PropsTestUtil
include props.util.PropsUtil

include test.executor.TestExecutor
include test.util.TestUtil

@class
PropsUtilTest(){
	setUp(){
		PropsTestUtil writePropsFile ${testFile}
	}

	@test
	testGetProperty(){
		${assertEquals} $(PropsUtil
			getProperty ${testFile} test.enabled) test.enabled=true
	}

	local assertEquals="TestUtil assertEquals"
	local testDir=$(TestUtil setupTestDir)
	local testFile=${testDir}/test.properties

	setUp

	$@

	TestUtil tearDown
}