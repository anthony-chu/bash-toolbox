include array.util.ArrayUtil
include base.comparator.BaseComparator
include base.util.BaseUtil
include string.util.StringUtil

LoggerUtil(){
	_formatLogLevel(){
		logLevel=${1}
		validLogLevels=(info error)

		maxLength=$(ArrayUtil returnMaxLength ${validLogLevels[@]})

		while [[ $(BaseComparator isLessThan $(StringUtil
			length ${logLevel}) ${maxLength}) ]]; do

			logLevel=$(StringUtil append ${logLevel} _)
		done

		StringUtil toUpperCase ${logLevel}
	}

	getLogMsg(){
		local time=$(BaseUtil timestamp log)

		if [[ $(BaseComparator isEqualIgnoreCase ${1} error) ]]; then
			message=$(colorme red $(StringUtil replace $(StringUtil
				capitalize ${2}) _ space))
		else
			message=$(StringUtil replace $(StringUtil capitalize ${2}) _ space)
		fi

		echo -e "${time} [ $(_formatLogLevel ${1}) ] ${message}"
	}

	$@
}