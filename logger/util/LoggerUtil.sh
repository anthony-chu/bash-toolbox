include array.util.ArrayUtil

include base.comparator.BaseComparator

include calendar.util.CalendarUtil

include math.util.MathUtil

include string.util.StringUtil

@class
LoggerUtil(){
	@private
	_formatLogLevel(){
		local logLevel=${1}
		local validLogLevels=(debug error info success)

		local maxLength=$(ArrayUtil returnMaxLength validLogLevels)

		while [[ $(BaseComparator isLessThan $(StringUtil
			length ${logLevel}) ${maxLength}) ]]; do

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
		local message=$(StringUtil capitalize ${2})

		if [[ $(BaseComparator isEqualIgnoreCase ${1} error) ]]; then
			local color=red
		elif [[ $(BaseComparator isEqualIgnoreCase ${1} debug) ]]; then
			local color=yellow
		elif [[ $(BaseComparator isEqualIgnoreCase ${1} success) ]]; then
			local color=green
		fi

		echo -e "$(CalendarUtil getTimestamp log) [ $(_formatLogLevel ${1}) ] $(
			colorme ${color} $(
				StringUtil parseMessage message
			)
		)"
	}

	$@
}