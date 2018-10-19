include system.System

@class
SystemValidator(){
	isLinux(){
		if [[ $(System getOS) =~ Linux ]]; then
			echo true
		fi
	}

	isShell(){
		case $TERM in
			xterm|cygwin|rxvt) echo true ;;
		esac
	}

	isWindows(){
		if [[ $(System getOS) =~ NT ]]; then
			echo true
		fi
	}

	$@
}