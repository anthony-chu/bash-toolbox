readvar(){
	if [[ ${1} == \W ]]; then
		echo "${@}"
	elif [[ ${!1} && ${1} != [0-9]* ]]; then
		local var=${1}[@]

		echo ${!var}
	else
		echo "${@}"
	fi
}