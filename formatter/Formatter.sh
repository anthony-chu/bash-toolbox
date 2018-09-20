include base.comparator.BaseComparator

include file.util.FileUtil
include file.writer.FileWriter

include logger.Logger

include math.util.MathUtil

include string.util.StringUtil
include string.validator.StringValidator

@class
Formatter(){
	applyUnixLineEndings(){
		FileWriter replace ${1} "\r\n" "\n"
	}

	convertSpacesToTabs(){
		sed -i "s/[ ][ ]/\t/g" ${1}
		sed -i "s/[ ][ ][ ][ ]/\t/g" ${1}
	}

	enforceLocalVariables(){
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
						set_variable_scope_to_local:
						${1}:${n}
					)

					${_log} error "$(StringUtil join _message _)"
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

					${_log} error "unquoted_log_message:_${1}:${n}"
				fi
			fi

			local lineNumber=$(MathUtil increment ${lineNumber})
		done < ${1}
	}

	verifyBashToolboxClassAnnotation(){
		if [[ $(StringValidator isSubstring ${1} bash-toolbox) &&
			! $(StringValidator isSubstring ${1} init.sh) &&
			! $(StringValidator isSubstring ${1} lib) ]]; then

			if [[ $(cat ${1}) != include* && $(cat ${1}) != @class* ]]; then
				${_log} error "missing_@class_anootation:_${1}"
			fi
		fi
	}

	verifyCharacterLimitPerLine(){
		local lineNumber=1

		if [[ ! $(StringValidator isSubstring ${1} lib) ]]; then
			while read line; do
				local length=$(
					MathUtil format $(
						StringUtil length ${line}
					)
				)

				if [[ ${length} > 80 && ${line} != *gitpr* ]]; then
					local n=${lineNumber}

					${_log} error "character_limit_exceeded:_${1}:${n}"
				fi

				local lineNumber=$(MathUtil increment ${lineNumber})
			done < ${1}
		fi
	}

	verifyNoIncludesInBase(){
		if [[ $(StringValidator isSubstring ${1} Base) &&
			! $(StringValidator isSubstring ${1} Test) ]]; then

			if [[ $(FileUtil getContent ${1}) =~ include ]]; then
				${_log} error "illegal_include:_${1}"
			fi
		fi
	}

	verifyNoUnusedDependencies(){
		local includes=()

		while read line; do
			local isInclude=$(StringValidator isNull ${line//[a-zA-Z.]/})

			if [[ ${line} == include* && ${isInclude} ]]; then
				includes+=(${line//*./})
			fi
		done < ${1}

		for include in ${includes[@]}; do
			local count=$(grep -o ${include} ${1} | wc -w)

			if [[ $(BaseComparator isEqual ${count} 1) ]]; then
				${_log} error "unused_include_'${include}':_${1}"
			fi
		done
	}

	local _log="Logger log"

	$@
}