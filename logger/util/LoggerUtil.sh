include base.comparator.BaseComparator

include calendar.util.CalendarUtil

include string.util.StringUtil

LoggerUtil(){
	_formatLogLevel(){
		local logLevel=${1}
		local validLogLevels=(debug error info)

		local maxLength=$(_returnArrayMaxLength validLogLevels)

		while [[ $(BaseComparator isLessThan $(StringUtil
			length ${logLevel}) ${maxLength}) ]]; do

			local logLevel=$(StringUtil append ${logLevel} _)
		done

		StringUtil toUpperCase ${logLevel}
	}

	_returnArrayMaxLength(){
		local array=($(readvar ${1}))
		local maxLength=0

		for a in ${array[@]}; do
			if [[ ${#a} > ${maxLength} ]]; then
				local maxLength=${#a}
			fi
		done

		echo ${maxLength}
	}

	getLogMsg(){
		local _message=$(StringUtil capitalize ${2})
		local color=null

		if [[ $(BaseComparator isEqualIgnoreCase ${1} error) ]]; then
			local color=red
		elif [[ $(BaseComparator isEqualIgnoreCase ${1} debug) ]]; then
			local color=yellow
		fi

		echo -e "$(CalendarUtil getTimestamp log) [ $(_formatLogLevel ${1}) ] $(
			colorme ${color} $(StringUtil parseMessage _message))"
	}

	$@
}