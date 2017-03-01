include base.comparator.BaseComparator

include file.io.util.FileIOUtil
include file.util.FileUtil

include logger.Logger

include math.util.MathUtil

include string.util.StringUtil
include string.validator.StringValidator

Formatter(){
	applyUnixLineEndings(){
		local file=${1}

		FileIOUtil replace ${file} "\r\n" "\n"
	}

	convertSpacesToTabs(){
		local file=${1}

		sed -i "s/[ ][ ]/\t/g" ${file}
		sed -i "s/[ ][ ][ ][ ]/\t/g" ${file}
	}

	enforceBashToolboxLocalVariables(){
		local file=${1}

		if [[ $(StringValidator isSubstring ${file} bash-toolbox) ]]; then
			local n=1

			while read line; do
				if [[ ${line} =~ [a-zA-Z]+= && ${line} != export* ]]; then
					if [[ ${line} != *for* && ${line} != local* ]]; then
						if [[ ${line} != *+*  && ${line} != *git* ]]; then
							local f=${file}

							local _message=(
								set_variable_scope_to_local:_
								${f}:${n}
							)

							Logger logErrorMsg "$(StringUtil build _message)"
						fi
					fi
				fi

				local n=$(MathUtil increment ${n})
			done < ${file}
		fi
	}

	enforceLoggerMessageQuotes(){
		local file=${1}

		local lineNumber=1

		while read line; do
			if [[ ${line} =~ Logger && ${line} != *Completed* ]]; then

				if [[ ${line} != *\"* && ${line} == *log*Msg* ]]; then
					local n=${lineNumber}

					Logger logErrorMsg "unquoted_log_message:_${file}:${n}"
				fi
			fi

			local lineNumber=$(MathUtil increment ${lineNumber})
		done < ${file}
	}

	verifyCharacterLimitPerLine(){
		local file=${1}

		local lineNumber=1

		if [[ ! $(BaseComparator isEqual ${file} build.sh) && ! $(StringValidator
			isSubstring ${file} lib) ]]; then

			while read line; do
				local length=$(MathUtil format $(StringUtil length ${line}))

				if [[ ${length} > 80 && ${line} != *gitpr* ]]; then
					local n=${lineNumber}

					Logger logErrorMsg "character_limit_exceeded:_${file}:${n}"
				fi

				local lineNumber=$(MathUtil increment ${lineNumber})
			done < ${file}
		fi
	}

	verifyNoIncludesInBase(){
		local file=${1}

		if [[ $(StringValidator isSubstring ${file} Base) && ! $(StringValidator
			isSubstring ${file} Test) ]]; then

			if [[ $(FileUtil getContent ${file}) =~ include ]]; then
				Logger logErrorMsg "illegal_include:_${file}"
			fi
		fi
	}

	$@
}