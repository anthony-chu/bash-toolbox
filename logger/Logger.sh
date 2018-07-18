include logger.util.LoggerUtil

@class
Logger(){
	log(){
		@param the_log_level_for_the_log_message
		local logLevel=${1}

		@param the_log_message
		local logMessage=${2}

		LoggerUtil getLogMsg ${logLevel} ${logMessage}
	}

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