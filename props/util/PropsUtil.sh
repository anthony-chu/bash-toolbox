@class
PropsUtil(){
	getProperty(){
		cat ${1} | grep ${2}=.*
	}

	$@
}