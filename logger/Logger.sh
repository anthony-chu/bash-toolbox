include logger.util.LoggerUtil

Logger(){
	logCompletedMsg(){
		logInfoMsg completed
	}

	logErrorMsg(){
		LoggerUtil getLogMsg error ${1}.
	}

	logInfoMsg(){
		LoggerUtil getLogMsg info ${1}.
	}

	logProgressMsg(){
		logInfoMsg ${1}..
	}

	${@}
}