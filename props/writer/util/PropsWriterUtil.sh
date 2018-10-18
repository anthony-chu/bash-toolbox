include file.util.FileUtil
include file.writer.FileWriter

include props.util.PropsUtil

include string.validator.StringValidator

@class
PropsWriterUtil(){
	disableProps(){
		local property=$(${getProps} ${1} ${2})

		if [[ ${property} &&
			! $(StringValidator beginsWith "#" ${property}) ]]; then

			${replace} ${1} ${property} \#${property}
		fi
	}

	enableProps(){
		${replace} ${1} $(${getProps} ${1} ${2}) ${2}=${3}
	}

	setProps(){
		if [[ ! -e ${1} ]]; then
			nullify FileUtil makeFile ${1}
		fi

		local property=$(${getProps} ${1} ${2})

		if [[ $(StringValidator beginsWith "#" ${property}) ]]; then
			enableProps ${1} ${2} ${3}
		elif [[ ${property} ]]; then
			${replace} ${1} ${2}=.* ${2}=${3}\
		else
			FileWriter append ${1} ${2}=${3}
		fi
	}

	local getProps="PropsUtil getProperty"
	local replace="FileWriter replace"

	$@
}