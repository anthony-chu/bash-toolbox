include logger.util.LoggerUtil

include test.executor.TestExecutor

LoggerUtilTest(){
	run(){
		TestExecutor executeTest logger.util.test
	}

	test_formatLogLevel[error](){
		if [[ $(LoggerUtil _formatLogLevel error) == ERROR ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	test_formatLogLevel[info](){
		if [[ $(LoggerUtil _formatLogLevel info) == INFO_ ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	$@
}