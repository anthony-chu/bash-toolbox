package(){
	if [[ ${1} ]]; then
		local files=($(find bash-toolbox/${1//./\/} -type f -iname "*.sh"))

		for file in ${files[@]}; do
			if [[ ${file} != *lib* ]]; then
				source ${file}
			fi
		done
	else
		echo -e "[ ERROR ] \033[0;31m"Cannot import an empty package."\033[0m"
		exit
	fi
}