include array.util.ArrayUtil

include base.comparator.BaseComparator
include base.util.BaseUtil

include string.util.StringUtil

LoggerUtil(){
	_formatLogLevel(){
		local logLevel=${1}
		local validLogLevels=(info error)

		local maxLength=$(ArrayUtil returnMaxLength ${validLogLevels[@]})

		while [[ $(BaseComparator isLessThan $(StringUtil
			length ${logLevel}) ${maxLength}) ]]; do

			local logLevel=$(StringUtil append ${logLevel} _)
		done

		StringUtil toUpperCase ${logLevel}
	}

	getLogMsg(){
		local time=$(BaseUtil timestamp log)

		if [[ $(BaseComparator isEqualIgnoreCase ${1} error) ]]; then
			local message=$(colorme red $(StringUtil replace $(StringUtil
				capitalize ${2}) _ space))
		else
			local message=$(StringUtil parseMessage $(StringUtil
				capitalize ${2}))
		fi

		echo -e "${time} [ $(_formatLogLevel ${1}) ] ${message}"
	}

	$@
}