include props.reader.util.PropsReaderUtil
include props.test.util.PropsTestUtil
include props.util.PropsUtil
include props.writer.util.PropsWriterUtil

include test.executor.TestExecutor
include test.util.TestUtil

@class
PropsWriterUtilTest(){
	run(){
		TestExecutor executeTest PropsWriterUtilTest
	}

	setUp(){
		PropsTestUtil writePropsFile ${testFile}
	}

	@test
	testDisableProps(){
		local isEnabled=$(${assertEquals} $(PropsUtil
			getProperty ${propsFile} test.enabled) test.enabled=true)

		PropsWriterUtil disableProps ${propsFile} test.enabled

		local isDisabled=$(${assertEquals} $(PropsUtil
			getProperty ${propsFile} test.enabled) \#test.enabled=true)

		if [[ ${isEnabled} == PASS && ${isDisabled} == PASS ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	@test
	testEnableProps(){
		PropsWriterUtil disableProps ${propsFile} test.enabled

		local isDisabled=$(${assertEquals} $(PropsUtil
			getProperty ${propsFile} test.enabled) \#test.enabled=true)

		PropsWriterUtil enableProps ${propsFile} test.enabled true

		local isEnabled=$(${assertEquals} $(PropsUtil
			getProperty ${propsFile} test.enabled) test.enabled=true)

		if [[ ${isEnabled} == PASS && ${isDisabled} == PASS ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	@test
	testSetPropsDisabledProp(){
		PropsWriterUtil disableProps ${propsFile} test.enabled

		local isDisabled=$(${assertEquals} $(PropsUtil
			getProperty ${propsFile} test.enabled) \#test.enabled=true)

		PropsWriterUtil setProps ${propsFile} test.enabled true

		local isEnabled=$(${assertEquals} $(PropsUtil
			getProperty ${propsFile} test.enabled) test.enabled=true)

		if [[ ${isEnabled} == PASS && ${isDisabled} == PASS ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	@test
	testSetPropsEditPropsValue(){
		local isTrue=$(${assertEquals} $(
			PropsReaderUtil getValue ${propsFile} test.enabled) true)

		PropsWriterUtil setProps ${propsFile} test.enabled false

		local isFalse=$(${assertEquals} $(
			PropsReaderUtil getValue ${propsFile} test.enabled) false)

		if [[ ${isTrue} == PASS && ${isFalse} == PASS ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	@test
	testSetPropsNewPropsFile(){
		local _propsFile=${propsDir}/temp.properties

		local isNotFile=$(${assertDoesNotExist} ${_propsFile})

		PropsWriterUtil setProps ${_propsFile} test.enabled true

		local isFile=$(${assertExists} ${_propsFile})
		local isProp=$(${assertEquals} $(
			PropsReaderUtil getValue ${_propsFile} test.enabled) true)

		if [[ ${isNotFile} == PASS &&
			${isFile} == PASS &&
			${isProp} == PASS ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	local assertDoesNotExist="TestUtil assertDoesNotExist"
	local assertEquals="TestUtil assertEquals"
	local assertExists="TestUtil assertExists"
	local testDir=$(TestUtil setupTestDir)
	local propsFile=${propsDir}/test.properties

	setUp

	$@

	TestUtil tearDown
}