Logger(){
	local packages=(
		logger.util.LoggerUtil
	)

	logCompletedMsg(){
		logInfoMsg completed
	}

	logErrorMsg(){
		LoggerUtil getLogMsg error ${1}.
	}

	logInfoMsg(){
		LoggerUtil getLogMsg info ${1}.
	}

	logProgressMsg(){
		logInfoMsg ${1}..
	}

	logRequestMsg(){
		LoggerUtil getLogMsg info ${1}:
	}

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}