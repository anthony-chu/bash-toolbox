PropsWriterUtil(){
	local packages=(
		file.util.FileUtil
		file.writer.FileWriter

		props.util.PropsUtil

		string.validator.StringValidator
	)

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

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}