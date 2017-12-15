@class
DatabaseUtil(){
	getMysqlCmd(){
		eval "mysql -e \"${@}\""
	}

	${@}
}