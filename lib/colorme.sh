colorme(){
	black(){
		echo "\033[0;30m${@}\033[0m"
	}

	blue(){
		echo "\033[0;34m${@}\033[0m"
	}

	brown(){
		echo "\033[0;33m${@}\033[0m"
	}

	cyan(){
		echo "\033[0;36m${@}\033[0m"
	}

	green(){
		echo "\033[0;32m${@}\033[0m"
	}

	purple(){
		echo "\033[0;35m${@}\033[0m"
	}

	red(){
		echo "\033[0;31m${@}\033[0m"
	}

	white(){
		echo "\033[1;37m${@}\033[0m"
	}

	yellow(){
		echo "\033[1;33m${@}\033[0m"
	}

	$@
}