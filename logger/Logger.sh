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
		log completed ${1}
	}

	logDebugMsg(){
		log debug ${1}
	}

	logErrorMsg(){
		log error ${1}
	}

	logInfoMsg(){
		log info ${1}
	}

	logProgressMsg(){
		log info ${1}...
	}

	logRequestMsg(){
		log info ${1}:
	}

	logSuccessMsg(){
		log success ${1}
	}

	${@}
}