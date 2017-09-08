Formatter(){
	local packages=(
		base.comparator.BaseComparator

		file.util.FileUtil
		file.writer.FileWriter

		logger.Logger

		math.util.MathUtil

		string.util.StringUtil
		string.validator.StringValidator
	)

	applyUnixLineEndings(){
		FileWriter replace ${1} "\r\n" "\n"
	}

	convertSpacesToTabs(){
		sed -i "s/[ ][ ]/\t/g" ${1}
		sed -i "s/[ ][ ][ ][ ]/\t/g" ${1}
	}

	enforceBashToolboxLocalVariables(){
		local n=1

		local localVariableExceptions=(
			"assert"
			"export"
			"for"
			"git"
			"grep"
			"local"
			"Writer"
			"+"
		)

		while read line; do
			if [[ ${line} =~ [a-zA-Z]+= ]]; then
				local doIgnore=""

				for exception in ${localVariableExceptions[@]}; do
					if [[ ${line} == *${exception}* ]]; then
						local doIgnore=true
						break
					fi
				done

				if [[ ! ${doIgnore} ]]; then
					local _message=(
						set_variable_scope_to_local:_
						${1}:${n}
					)

					Logger logErrorMsg "$(StringUtil join _message)"
				fi
			fi

			local n=$(MathUtil increment ${n})
		done < ${1}
	}

	enforceLoggerMessageQuotes(){
		local lineNumber=1

		while read line; do
			if [[ ${line} =~ Logger && ${line} != *Completed* ]]; then

				if [[ ${line} != *\"* && ${line} == *log*Msg* ]]; then
					local n=${lineNumber}

					Logger logErrorMsg "unquoted_log_message:_${1}:${n}"
				fi
			fi

			local lineNumber=$(MathUtil increment ${lineNumber})
		done < ${1}
	}

	verifyCharacterLimitPerLine(){
		local lineNumber=1

		if [[ ! $(StringValidator isSubstring ${1} lib) ]]; then
			while read line; do
				local length=$(MathUtil format $(StringUtil length ${line}))

				if [[ ${length} > 80 && ${line} != *gitpr* ]]; then
					local n=${lineNumber}

					Logger logErrorMsg "character_limit_exceeded:_${1}:${n}"
				fi

				local lineNumber=$(MathUtil increment ${lineNumber})
			done < ${1}
		fi
	}

	verifyNopackagesInBase(){
		if [[ $(StringValidator isSubstring ${1} Base) &&
			! $(StringValidator isSubstring ${1} Test) ]]; then

			if [[ $(FileUtil getContent ${1}) =~ ]]; then
				Logger logErrorMsg "illegal_include:_${1}"
			fi
		fi
	}

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}