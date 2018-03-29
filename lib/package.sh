package(){
	if [[ ${1} ]]; then
		local files=($(find ${projectDir}bash-toolbox/${1//./\/} -type f -iname "*.sh"))

		if [ ${#files[@]} -lt 3 ]; then
			echo -e "[ _ERROR_ ] \033[0;31m"The package \"${1}\" is not large enough to import using package."\033[0m"
			echo -e "[ _ERROR_ ] \033[0;31m"Please use \"include\" instead on files from ${1}."\033[0m"
			exit
		fi

		if [[ ${files[@]} =~ ${BASH_SOURCE[1]} ]]; then
			echo -e "[ _ERROR_ ]] \033[0;31m"The package \"${1}\" contains the current file."\033[0m"
			echo -e "[ _ERROR_ ]] \033\0;31m"Please use \"include\" instead to import the desired files."\033[0m"
			exit
		fi

		for file in ${files[@]}; do
			if [[ ${file} != *lib* ]]; then
				if [[ ${file} == *test* && ${file} == *Test* ]]; then
					if [[ ${1} == *test* ]]; then
						source ${file}
					fi
				fi

				source ${file}
			fi
		done
	else
		echo -e "[ _ERROR_ ] \033[0;31m"Cannot import an empty package."\033[0m"
		exit
	fi
}