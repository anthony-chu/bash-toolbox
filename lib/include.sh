include(){
	for path in ${@}; do
		source ${projectDir}bash-toolbox/${path//\./\/}.sh
	done
}