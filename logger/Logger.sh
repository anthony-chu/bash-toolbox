include logger.util.LoggerUtil

@class
Logger(){
	logCompletedMsg(){
		logInfoMsg completed
	}

	logDebugMsg(){
		LoggerUtil getLogMsg debug ${1}
	}

	logErrorMsg(){
		LoggerUtil getLogMsg error ${1}
	}

	logInfoMsg(){
		LoggerUtil getLogMsg info ${1}
	}

	logProgressMsg(){
		logInfoMsg ${1}...
	}

	logRequestMsg(){
		LoggerUtil getLogMsg info ${1}:
	}

	logSuccessMsg(){
		LoggerUtil getLogMsg success ${1}
	}

	${@}
}