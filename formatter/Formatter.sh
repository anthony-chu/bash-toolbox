include base.comparator.BaseComparator

include file.io.util.FileIOUtil
include file.util.FileUtil

include logger.Logger

include math.util.MathUtil

include string.util.StringUtil
include string.validator.StringValidator

Formatter(){
	applyUnixLineEndings(){
		file=${1}

		FileIOUtil replace ${file} "\r\n" "\n"
	}

	convertSpacesToTabs(){
		file=${1}

		sed -i "s/[ ][ ]/\t/g" ${file}
		sed -i "s/[ ][ ][ ][ ]/\t/g" ${file}
	}

	enforceBashToolboxLocalVariables(){
		file=${1}

		if [[ $(StringValidator isSubstring ${file} bash-toolbox) ]]; then
			n=1

			while read line; do
				if [[ ${line} =~ [a-zA-Z]+= && ${line} != export* ]]; then
					if [[ ${line} != *for* && ${line} != local* ]]; then
						f=${file}

						local _message=(set_variable_scope_to_local_ ${f}:${n})

						for _m in ${_message[@]}; do
							local message=$(StringUtil append ${message} ${_m})
						done

						Logger logErrorMsg "${message}"

						unset message
					fi
				fi

				n=$(MathUtil increment ${n})
			done < ${file}
		fi
	}

	enforceLoggerMessageQuotes(){
		file=${1}

		lineNumber=1

		while read line; do
			if [[ ${line} =~ Logger && ${line} != *Completed* ]]; then

				if [[ ${line} != *\"* && ${line} == *log*Msg* ]]; then
					n=${lineNumber}

					Logger logErrorMsg "unquoted_log_message:_${file}:${n}"
				fi
			fi

			lineNumber=$(MathUtil increment ${lineNumber})
		done < ${file}
	}

	verifyCharacterLimitPerLine(){
		file=${1}

		lineNumber=1

		if [[ ! $(BaseComparator isEqual ${file} build.sh) ]]; then
			while read line; do
				length=$(StringUtil length ${line})

				if [[ ${length} -le 9 ]]; then
					length=$(StringUtil append 0 ${length})
				fi

				if [[ ${length} > 80 && ${line} != *gitpr* ]]; then
					n=${lineNumber}

					Logger logErrorMsg "character_limit_exceeded:_${file}:${n}"
				fi

				lineNumber=$(MathUtil increment ${lineNumber})
			done < ${file}
		fi
	}

	verifyNoIncludesInBase(){
		file=${1}

		if [[ $(StringValidator isSubstring ${file} Base) && ! $(StringValidator
			isSubstring ${file} Test) ]]; then

			if [[ $(FileUtil getContent ${file}) =~ include ]]; then
				Logger logErrorMsg "illegal_include:_${file}"
			fi
		fi
	}

	$@
}