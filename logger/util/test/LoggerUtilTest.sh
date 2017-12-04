include logger.util.LoggerUtil

include test.executor.TestExecutor
include test.util.TestUtil

LoggerUtilTest(){
	run(){
		TestExecutor executeTest LoggerUtilTest
	}

	test_formatLogLevel[debug](){
		${assertEquals} $(LoggerUtil _formatLogLevel debug) _DEBUG_
	}

	test_formatLogLevel[error](){
		${assertEquals} $(LoggerUtil _formatLogLevel error) _ERROR_
	}

	test_formatLogLevel[info](){
		${assertEquals} $(LoggerUtil _formatLogLevel info) __INFO_
	}

	test_formatLogLevel[success](){
		${assertEquals} $(LoggerUtil _formatLogLevel success) SUCCESS
	}

	local assertEquals="TestUtil assertEquals"

	$@
}