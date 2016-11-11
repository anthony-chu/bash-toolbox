include base.comparator.BaseComparator
include database.util.DatabaseUtil
include logger.Logger
include string.validator.StringValidator

Database(){
	create(){
		if [[ $(StringValidator isNull ${2}) ]]; then
			cmd="create database ${1};"
		elif [[ $(BaseComparator isEqual ${2} utf8) ]]; then
			cmd="create database ${1} char set ${2};"
		fi

		Logger logProgressMsg "creating_database_${1}"

		DatabaseUtil getMysqlCmd ${cmd}

		Logger logCompletedMsg
	}

	drop(){
		cmd="drop database if exists ${1};"

		Logger logProgressMsg "deleting_database_${1}"

		DatabaseUtil getMysqlCmd ${cmd}

		Logger logCompletedMsg
	}

	rebuild(){
		drop ${1}
		create ${1} ${2}
	}

	$@
}