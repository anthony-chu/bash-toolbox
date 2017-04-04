include string.util.StringUtil

CalendarUtil(){
	getDate(){
		if [[ ${1} == -d ]]; then
			date +%d
		elif [[ ${1} == -m ]]; then
			date +%m
		elif [[ ${1} == -y ]]; then
			date +%Y
		fi
	}

	getDayOfWeek(){
		if [[ ${1} == num ]]; then
			date +%u
		elif [[ ${1} == name ]]; then
			date +%A
		fi
	}

	getTimestamp(){
		if [[ ${1} == clock ]]; then
			local t=$(date +%T%s)
			StringUtil strip t [:]
		elif [[ ${1} == date ]]; then
			echo $(getDate -y)$(getDate -m)$(getDate -d)
		elif [[ ${1} == log ]]; then
			echo $(getDate -y)-$(getDate -m)-$(getDate -d) $(date +%H:%M:%S)
		else
			local ms=$(date +%S%N)
			date +%H:%M:${ms:0:3}
		fi
	}

	$@
}