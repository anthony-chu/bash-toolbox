readvar(){
	if [[ ${1} != [a-zA-Z0-9_]\+ ]]; then
		echo "${@}"
	elif [[ ${!1} ]]; then
		local var=${1}[@]

		echo ${!var}
	fi
}