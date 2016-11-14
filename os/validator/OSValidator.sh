include os.util.OSUtil

OSValidator(){
	isLinux(){
		if [[ $(OSUtil getOS) =~ Linux ]]; then
			echo true
		fi
	}

	isWindows(){
		if [[ $(OSUtil getOS) =~ NT ]]; then
			echo true
		fi
	}

	$@
}