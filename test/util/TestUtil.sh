include base.util.BaseUtil
include logger.util.LoggerUtil
include string.util.StringUtil
include string.Validator.StringValidator

TestUtil(){
	_getLogMsg(){
		local time=$(BaseUtil timestamp log)

		if [[ $(StringValidator isSubstring ${2} PASSED) ]]; then
			message=$(colorme green $(StringUtil replace $(StringUtil
				capitalize ${2}) _ space))

		else
			message=$(StringUtil replace $(StringUtil capitalize ${2}) _ space)
		fi

		echo -e "${time} [ $(LoggerUtil _formatLogLevel ${1}) ] ${message}"
	}

	logSuccessMsg(){
		_getLogMsg info ${1}
	}

	$@
}