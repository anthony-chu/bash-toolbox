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

	${@}
}