include props.reader.util.PropsReaderUtil
include props.test.util.PropsTestUtil

include string.util.StringUtil

include test.executor.TestExecutor
include test.util.TestUtil

PropsReaderUtilTest(){
	run(){
		TestExecutor executeTest PropsReaderUtilTest
	}

	setUp(){
		PropsTestUtil writePropsFile
	}

	tearDown(){
		rm -rf ${propsDir}
	}

	@test
	testGetPropsFileName(){
		local propsFileMap=($(PropsReaderUtil getPropsFileName ${propsFile}))

		local isPropsDir=$(${assertEquals} ${propsFileMap[0]} propsDir)
		local isPropsFile=$(
			${assertEquals} ${propsFileMap[1]} ${propsFile/*\//})

		if [[ ${isPropsDir} == PASS && ${isPropsFile} == PASS ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	@test
	testGetValue(){
		${assertEquals} $(
			PropsReaderUtil getValue ${propsFile} test.enabled) true
	}

	@test
	testReadPropsFileDoesNotExist(){
		local _propsDir=$(StringUtil strip propsDir dependencies)test.properties
		local message=$(PropsReaderUtil readProps ${_propsDir})

		${assertContains} message ERROR
	}

	@test
	testReadProps(){
		${assertEquals} $(PropsReaderUtil
			readProps ${propsFile} test.enabled) true
	}

	@test
	testReadPropsPropertyDoesNotExist(){
		local _propsDir=$(StringUtil strip propsDir dependencies)test.properties
		local message=$(PropsReaderUtil readProps ${_propsDir} some.prop)

		${assertContains} message ERROR
	}

	local assertContains="TestUtil assertContains"
	local assertEquals="TestUtil assertEquals"
	local propsDir=$(pwd)/bash-toolbox/test/dependencies
	local propsFile=${propsDir}/test.properties

	setUp

	$@

	tearDown
}