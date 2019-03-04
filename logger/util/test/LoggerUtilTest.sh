include logger.util.LoggerUtil

include test.util.TestUtil

@class
LoggerUtilTest(){
	@test
	test_formatLogLevel[debug](){
		${assertEquals} $(LoggerUtil _formatLogLevel debug) DEBUG
	}

	@test
	test_formatLogLevel[error](){
		${assertEquals} $(LoggerUtil _formatLogLevel error) ERROR
	}

	@test
	test_formatLogLevel[info](){
		${assertEquals} $(LoggerUtil _formatLogLevel info) INFO
	}

	@test
	test_formatLogLevel[success](){
		${assertEquals} $(LoggerUtil _formatLogLevel success) SUCCESS
	}

	local assertEquals="TestUtil assertEquals"

	$@
}