include props.test.util.PropsTestUtil
include props.util.PropsUtil

include test.executor.TestExecutor
include test.util.TestUtil

PropsUtilTest(){
	run(){
		TestExecutor executeTest PropsUtilTest
	}

	setUp(){
		PropsTestUtil writePropsFile
	}

	tearDown(){
		rm -rf ${propsDir}
	}

	@test
	testGetProperty(){
		${assertEquals} $(PropsUtil
			getProperty ${propsFile} test.enabled) test.enabled=true
	}

	local assertEquals="TestUtil assertEquals"
	local propsDir=$(pwd)/bash-toolbox/test/dependencies
	local propsFile=${propsDir}/test.properties

	setUp

	$@

	tearDown
}