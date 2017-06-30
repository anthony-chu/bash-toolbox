include base.comparator.BaseComparator

include calendar.util.CalendarUtil

include string.util.StringUtil

LoggerUtil(){
	_formatLogLevel(){
		local logLevel=${1}
		local validLogLevels=(info error)

		local maxLength=$(_returnArrayMaxLength validLogLevels)

		while [[ $(BaseComparator isLessThan $(StringUtil
			length ${logLevel}) ${maxLength}) ]]; do

			local logLevel=$(StringUtil append ${logLevel} _)
		done

		StringUtil toUpperCase ${logLevel}
	}

	_returnArrayMaxLength(){
		local array=$(import ${1})
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
		local time=$(CalendarUtil getTimestamp log)

		if [[ $(BaseComparator isEqualIgnoreCase ${1} error) ]]; then
			local message=$(colorme red $(StringUtil parseMessage _message))
		else
			local message=$(StringUtil parseMessage _message)
		fi

		echo -e "${time} [ $(_formatLogLevel ${1}) ] ${message}"
	}

	$@
}