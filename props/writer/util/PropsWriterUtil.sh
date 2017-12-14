include file.util.FileUtil
include file.writer.FileWriter

include props.util.PropsUtil

include string.validator.StringValidator

@class
PropsWriterUtil(){
	disableProps(){
		local property=$(PropsUtil getProperty ${1} ${2})

		if [[ ${property} &&
			! $(StringValidator beginsWith "#" ${property}) ]]; then

			FileWriter replace ${1} ${property} \#${property}
		fi
	}

	enableProps(){
		FileWriter replace ${1} $(PropsUtil getProperty ${1} ${2}) ${2}=${3}
	}

	setProps(){
		if [[ ! -e ${1} ]]; then
			local file=$(FileUtil makeFile ${1})
		fi

		local property=$(PropsUtil getProperty ${1} ${2})

		if [[ ${property} ]]; then
			if [[ $(StringValidator beginsWith "#" ${property}) ]]; then
				enableProps ${1} ${2} ${3}
			else
				FileWriter replace ${1} ${2}=.* ${2}=${3}
			fi
		else
			FileWriter append ${1} ${2}=${3}
		fi
	}

	$@
}