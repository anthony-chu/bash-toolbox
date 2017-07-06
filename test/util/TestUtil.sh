include base.comparator.BaseComparator

include calendar.util.CalendarUtil

include logger.util.LoggerUtil

include string.util.StringUtil
include string.Validator.StringValidator

TestUtil(){
	assertContains(){
		if [[ $(readvar ${1}) =~ $(readvar ${2}) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	assertEquals(){
		if [[ $(readvar ${1}) == $(readvar ${2}) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	assertNull(){
		if [[ $(StringValidator isNull ${1}) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	assertTrue(){
		if [[ $(BaseComparator isEqual ${1} true) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	logSuccessMsg(){
		if [[ $(StringValidator isSubstring ${1} PASSED) ]]; then
			local message=$(colorme green ${1})
		else
			local message=${1}
		fi

		LoggerUtil getLogMsg info ${message}
	}

	$@
}