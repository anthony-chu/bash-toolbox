include math.util.MathUtil

include string.util.StringUtil
include string.validator.StringValidator

@class
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

	returnYesterdayTimestamp(){
		if [[ ${1} ]]; then
			local this_day=${1:6:2}
			local this_month=${1:4:2}
			local this_year=${1:0:4}
		else
			local this_day=$(getDate -d)
			local this_month=$(getDate -m)
			local this_year=$(getDate -y)
		fi

		local prev_day=${this_day}
		local prev_month=${this_month}
		local prev_year=${this_year}

		if [[ ${this_day} == 01 ]]; then
			if [[ "01 02 04 06 08 09 11" =~ ${this_month} ]]; then
				local prev_day=31
			elif [[ ${this_month} == 03 ]]; then
				if [[ $(MathUtil isDivisible ${this_year} 4) ]]; then
					local prev_day=29
				else
					local prev_day=28
				fi
			else
				local prev_day=30
			fi

			if [[ ${this_month} == 01 ]]; then
				local prev_month=12

				local prev_year=$(MathUtil decrement ${this_year})
			elif [[ $(StringValidator beginsWith 0 ${this_month}) ]]; then
				local prev_month=$(
					MathUtil decrement $(
						StringUtil strip this_month 0
					)
				)
			else
				local prev_month=$(MathUtil decrement ${this_month})
			fi

			if [[ ${#prev_month} == 1 ]]; then
				local prev_month=0${prev_month}
			fi
		elif [[ $(StringValidator beginsWith 0 ${this_day}) ]]; then
			local prev_day=$(
				MathUtil decrement $(
					StringUtil strip this_day 0
				)
			)
		else
			local prev_day=$(MathUtil decrement ${this_day})
		fi

		if [[ ${#prev_day} == 1 ]]; then
			local prev_day=0${prev_day}
		fi

		echo ${prev_year}${prev_month}${prev_day}
	}

	$@
}