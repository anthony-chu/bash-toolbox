readvar(){
	if [[ ${1//[[:word:]]/} ]]; then
		echo "${@}"
	else
		local var=${1}[@]

		echo ${!var}
	fi
}