readvar(){
	if [[ ${1} != *[-.]* && ${!1} ]]; then
		local var=${1}[@]

		echo ${!var}

		return
	fi

	echo "${@}"
}