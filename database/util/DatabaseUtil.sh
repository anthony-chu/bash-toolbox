DatabaseUtil(){
	getMysqlCmd(){
		eval "mysql -e \"${@}\""
	}

	${@}
}