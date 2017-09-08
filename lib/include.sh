include(){
	for path in ${@}; do
		source ${projectDir}bash-toolbox/${path//\./\/}.sh
	done
}

exclude(){
	for path in ${@}; do
		unset ${string/*./}
	done
}