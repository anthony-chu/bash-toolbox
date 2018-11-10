include file.util.FileUtil
include file.validator.FileValidator

include logger.Logger

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

		if [[ ! $(FileValidator isFilePath path) ]]; then
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

	assertExists(){
		local path=$(readvar ${1})

		if [[ $(FileValidator isFilePath path) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	assertNotNull(){
		if [[ ${1} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	assertNull(){
		if [[ ! ${1} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	assertTrue(){
		if [[ ${1} == true ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	logSuccessMsg(){
		if [[ ${1} =~ PASSED ]]; then
			local message=$(colorme green ${1})
		else
			local message=${1}
		fi

		${_log} info "${message}"
	}

	setupTestDir(){
		local testDir=${testDirectory}

		mkdir -p ${testDir}

		echo ${testDir}
	}

	tearDown(){
		rm -rf ${testDirectory}
	}

	local _log="Logger log"

	local testDirectory=$(pwd)/bash-toolbox/test/dependencies

	$@
}