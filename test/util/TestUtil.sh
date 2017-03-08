include calendar.util.CalendarUtil

include logger.util.LoggerUtil

include string.util.StringUtil
include string.Validator.StringValidator

TestUtil(){
	_getLogMsg(){
		local _message=$(StringUtil capitalize ${2})
		local time=$(CalendarUtil getTimestamp log)

		if [[ $(StringValidator isSubstring ${2} PASSED) ]]; then
			local message=$(colorme green $(StringUtil replace _message _ space))

		else
			local message=$(StringUtil parseMessage _message)
		fi

		echo -e "${time} [ $(LoggerUtil _formatLogLevel ${1}) ] ${message}"
	}

	logSuccessMsg(){
		_getLogMsg info ${1}
	}

	$@
}