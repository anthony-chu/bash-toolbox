include logger.util.LoggerUtil

include test.executor.TestExecutor
include test.util.TestUtil

LoggerUtilTest(){
	run(){
		TestExecutor executeTest LoggerUtilTest
	}

	test_formatLogLevel[error](){
		${assertEquals} $(LoggerUtil _formatLogLevel error) _ERROR_
	}

	test_formatLogLevel[info](){
		${assertEquals} $(LoggerUtil _formatLogLevel info) __INFO_
	}

	local assertEquals="TestUtil assertEquals"

	$@
}