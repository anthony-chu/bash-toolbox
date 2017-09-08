LoggerUtilTest(){
	local packages=(
		logger.util.LoggerUtil

		test.executor.TestExecutor
		test.util.TestUtil
	)

	run(){
		TestExecutor executeTest LoggerUtilTest
	}

	test_formatLogLevel[error](){
		${assertEquals} $(LoggerUtil _formatLogLevel error) ERROR
	}

	test_formatLogLevel[info](){
		${assertEquals} $(LoggerUtil _formatLogLevel info) INFO_
	}

	local assertEquals="TestUtil assertEquals"

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}