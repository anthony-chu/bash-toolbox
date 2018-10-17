include database.util.DatabaseUtil

include logger.Logger

@class
Database(){
	create(){
		if [[ ! ${2} ]]; then
			local cmd="create database ${1};"
		elif [[ ${2} == utf8 ]]; then
			local cmd="create database ${1} char set ${2};"
		fi

		${_log} info "creating_database_${1}..."

		DatabaseUtil getMysqlCmd ${cmd}

		${_log} info "completed"
	}

	drop(){
		local cmd="drop database if exists ${1};"

		${_log} info "deleting_database_${1}..."

		DatabaseUtil getMysqlCmd ${cmd}

		${_log} info "completed"
	}

	rebuild(){
		drop ${1}
		create ${1} ${2}
	}

	local _log="Logger log"

	$@
}