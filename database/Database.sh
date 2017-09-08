Database(){
	local packages=(
		base.comparator.BaseComparator

		database.util.DatabaseUtil

		logger.Logger

		string.validator.StringValidator
	)

	create(){
		if [[ $(StringValidator isNull ${2}) ]]; then
			local cmd="create database ${1};"
		elif [[ $(BaseComparator isEqual ${2} utf8) ]]; then
			local cmd="create database ${1} char set ${2};"
		fi

		Logger logProgressMsg "creating_database_${1}"

		DatabaseUtil getMysqlCmd ${cmd}

		Logger logCompletedMsg
	}

	drop(){
		local cmd="drop database if exists ${1};"

		Logger logProgressMsg "deleting_database_${1}"

		DatabaseUtil getMysqlCmd ${cmd}

		Logger logCompletedMsg
	}

	rebuild(){
		drop ${1}
		create ${1} ${2}
	}

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}