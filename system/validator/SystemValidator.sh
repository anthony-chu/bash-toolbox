include system.System

@class
SystemValidator(){
	isLinux(){
		if [[ $(System getOS) =~ Linux ]]; then
			echo true
		fi
	}

	isWindows(){
		if [[ $(System getOS) =~ NT ]]; then
			echo true
		fi
	}

	$@
}