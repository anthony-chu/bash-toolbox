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

	@deprecated
	logCompletedMsg(){
		log completed ${1}
	}

	@deprecated
	logDebugMsg(){
		log debug ${1}
	}

	@deprecated
	logErrorMsg(){
		log error ${1}
	}

	@deprecated
	logInfoMsg(){
		log info ${1}
	}

	@deprecated
	logProgressMsg(){
		log info ${1}...
	}

	@deprecated
	logRequestMsg(){
		log info ${1}:
	}

	@deprecated
	logSuccessMsg(){
		log success ${1}
	}

	${@}
}