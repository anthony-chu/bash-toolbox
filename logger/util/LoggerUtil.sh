include array.util.ArrayUtil

include base.comparator.BaseComparator
include base.util.BaseUtil

include string.util.StringUtil

LoggerUtil(){
	_formatLogLevel(){
		local logLevel=${1}
		local validLogLevels=(info error)

		local maxLength=$(ArrayUtil returnMaxLength validLogLevels)

		while [[ $(BaseComparator isLessThan $(StringUtil
			length ${logLevel}) ${maxLength}) ]]; do

			local logLevel=$(StringUtil append ${logLevel} _)
		done

		StringUtil toUpperCase ${logLevel}
	}

	getLogMsg(){
		local _message=$(StringUtil capitalize ${2})
		local time=$(BaseUtil timestamp log)

		if [[ $(BaseComparator isEqualIgnoreCase ${1} error) ]]; then
			local message=$(colorme red $(StringUtil parseMessage _message))
		else
			local message=$(StringUtil parseMessage _message)
		fi

		echo -e "${time} [ $(_formatLogLevel ${1}) ] ${message}"
	}

	$@
}