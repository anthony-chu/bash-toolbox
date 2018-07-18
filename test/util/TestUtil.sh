include base.comparator.BaseComparator

include file.util.FileUtil
include file.validator.FileValidator

include logger.Logger

include string.validator.StringValidator

@class
TestUtil(){
	assertContains(){
		if [[ $(readvar ${1}) =~ $(readvar ${2}) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	assertDoesNotContain(){
		if [[ $(readvar ${1}) != *$(readvar ${2})* ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	assertDoesNotExist(){
		local path=$(readvar ${1})

		if [[ $(FileValidator isFile path) ]]; then
			if [[ ! -e ${path} ]]; then
				echo PASS
			else
				echo FAIL
			fi
		elif [[ $(FileValidator isPath path) ]]; then
			if [[ ! -d ${path} ]]; then
				echo PASS
			else
				echo FAIL
			fi
		fi
	}

	assertEquals(){
		if [[ $(readvar ${1}) == $(readvar ${2}) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	assertExists(){
		local path=$(readvar ${1})

		if [[ $(FileValidator isFile path) ]]; then
			if [[ -e ${path} ]]; then
				echo PASS
			else
				echo FAIL
			fi
		elif [[ $(FileValidator isPath path) ]]; then
			if [[ -d ${path} ]]; then
				echo PASS
			else
				echo FAIL
			fi
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

		_log info "${message}"
	}

	setupTestDir(){
		FileUtil construct $(pwd)/bash-toolbox/test/dependencies
	}

	tearDown(){
		rm -rf $(pwd)/bash-toolbox/test/dependencies
	}

	local _log="Logger log"

	$@
}