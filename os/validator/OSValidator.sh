include os.util.OSUtil

OSValidator(){
	isLinux(){
		if [[ $(OSUtil getOS) =~ Linux ]]; then
			echo true
		else
			return
		fi
	}

	isWindows(){
		if [[ $(OSUtil getOS) =~ NT ]]; then
			echo true
		else
			return
		fi
	}

	$@
}