include array.util.ArrayUtil

include calendar.util.CalendarUtil

include math.util.MathUtil

include string.util.StringUtil

@class
LoggerUtil(){
	@deprecated @private
	_formatLogLevel(){
		local logLevel=${1}
		local validLogLevels=(debug error info success)

		local maxLength=$(ArrayUtil returnMaxLength validLogLevels)

		while [[ $(StringUtil length ${logLevel}) -lt ${maxLength} ]]; do

			if [[ $(MathUtil isEven $(StringUtil length ${logLevel})) ]]; then
				local logLevel=$(StringUtil append _ ${logLevel})
			else
				local logLevel=$(StringUtil append ${logLevel} _)
			fi
		done

		StringUtil toUpperCase ${logLevel}
	}

	getLogMsg(){
		local color=null
		local logLevel=$(StringUtil toUpperCase ${1})
		local message=$(StringUtil capitalize ${2})

		if [[ ${logLevel,,} == error ]]; then
			local color=red
		elif [[ $logLevel,,} == debug ]]; then
			local color=yellow
		elif [[ $logLevel,,} == success ]]; then
			local color=green
		fi

		echo -e "$(CalendarUtil getTimestamp log) [ ${logLevel} ] $(
			colorme ${color} $(
				StringUtil parseMessage message
			)
		)"
	}

	$@
}