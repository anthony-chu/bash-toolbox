include props.reader.util.PropsReaderUtil
include props.test.util.PropsTestUtil

include string.util.StringUtil

include test.executor.TestExecutor
include test.util.TestUtil

@class
PropsReaderUtilTest(){
	run(){
		TestExecutor executeTest PropsReaderUtilTest
	}

	setUp(){
		PropsTestUtil writePropsFile ${testFile}
	}

	@test
	testGetPropsFileName(){
		local propsFileMap=($(PropsReaderUtil getPropsFileName ${testFile}))

		local isPropsDir=$(${assertEquals} ${propsFileMap[0]} testDir)
		local isPropsFile=$(
			${assertEquals} ${propsFileMap[1]} ${testFile/*\//})

		if [[ ${isPropsDir} == PASS && ${isPropsFile} == PASS ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	@test
	testGetValue(){
		${assertEquals} $(
			PropsReaderUtil getValue ${testFile} test.enabled) true
	}

	@test
	testReadPropsFileDoesNotExist(){
		local _propsDir=$(StringUtil strip testDir dependencies)test.properties
		local message=$(PropsReaderUtil readProps ${_propsDir})

		${assertContains} message ERROR
	}

	@test
	testReadProps(){
		${assertEquals} $(PropsReaderUtil
			readProps ${testFile} test.enabled) true
	}

	@test
	testReadPropsPropertyDoesNotExist(){
		local _propsDir=$(StringUtil strip testDir dependencies)test.properties
		local message=$(PropsReaderUtil readProps ${_propsDir} some.prop)

		${assertContains} message ERROR
	}

	local assertContains="TestUtil assertContains"
	local assertEquals="TestUtil assertEquals"
	local testDir=$(TestUtil setupTestDir)
	local testFile=${testDir}/test.properties

	setUp

	$@

	TestUtil tearDown
}