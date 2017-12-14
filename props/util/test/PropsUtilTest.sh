include props.test.util.PropsTestUtil
include props.util.PropsUtil

include test.executor.TestExecutor
include test.util.TestUtil

@class
PropsUtilTest(){
	run(){
		TestExecutor executeTest PropsUtilTest
	}

	setUp(){
		PropsTestUtil writePropsFile ${testFile}
	}

	@test
	testGetProperty(){
		${assertEquals} $(PropsUtil
			getProperty ${propsFile} test.enabled) test.enabled=true
	}

	local assertEquals="TestUtil assertEquals"
	local testDir=$(TestUtil setupTestDir)
	local propsFile=${propsDir}/test.properties

	setUp

	$@

	TestUtil tearDown
}