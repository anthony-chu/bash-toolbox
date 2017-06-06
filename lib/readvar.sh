readvar(){
	if [[ ${1} == *[-.]* ]]; then
		echo "${@}"
	elif [[ ${!1} ]]; then
		local var=${1}[@]

		echo ${!var}
	fi
}