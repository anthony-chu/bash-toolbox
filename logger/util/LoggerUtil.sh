include array.util.ArrayUtil

include base.comparator.BaseComparator

include calendar.util.CalendarUtil

include string.util.StringUtil

LoggerUtil(){
	_formatLogLevel(){
		local logLevel=${1}
		local validLogLevels=(debug error info)

		local maxLength=$(ArrayUtil returnMaxLength validLogLevels)

		while [[ $(BaseComparator isLessThan $(StringUtil
			length ${logLevel}) ${maxLength}) ]]; do

			local logLevel=$(StringUtil append ${logLevel} _)
		done

		StringUtil toUpperCase ${logLevel}
	}

	getLogMsg(){
		local color=null
		local message=$(StringUtil capitalize ${2})

		if [[ $(BaseComparator isEqualIgnoreCase ${1} error) ]]; then
			local color=red
		elif [[ $(BaseComparator isEqualIgnoreCase ${1} debug) ]]; then
			local color=yellow
		fi

		echo -e "$(CalendarUtil getTimestamp log) [ $(_formatLogLevel ${1}) ] $(
			colorme ${color} $(StringUtil parseMessage message))"
	}

	$@
}