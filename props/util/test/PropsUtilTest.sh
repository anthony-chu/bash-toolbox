PropsUtilTest(){
	local packages=(
		props.test.util.PropsTestUtil
		props.util.PropsUtil

		test.executor.TestExecutor
		test.util.TestUtil
	)

	run(){
		TestExecutor executeTest PropsUtilTest
	}

	setUp(){
		PropsTestUtil writePropsFile
	}

	tearDown(){
		rm -rf ${propsDir}
	}

	testGetProperty(){
		${assertEquals} $(PropsUtil
			getProperty ${propsFile} test.enabled) test.enabled=true
	}

	local assertEquals="TestUtil assertEquals"
	local propsDir=$(pwd)/bash-toolbox/test/dependencies
	local propsFile=${propsDir}/test.properties

	include ${packages[@]}

	setUp

	$@

	tearDown

	exclude ${packages[@]}
}