readvar(){
	if [[ ${1//[[:word:]]/} || ${1} == [0-9]* ]]; then
		echo "${@}"
	else
		local var=${1}[@]

		echo ${!var}
	fi
}