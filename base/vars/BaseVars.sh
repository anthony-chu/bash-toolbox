BaseVars(){
	_returnPrivacy(){
		if [[ $@ == *ee-* ]]; then
			echo private
		else
			echo public
		fi
	}

	returnBranch(){
		case $@ in
			*ee-6.1.x*) echo ee-6.1.x;;
			*ee-6.2.x*) echo ee-6.2.x;;
			*ee-6.2.10*) echo ee-6.2.10;;
			*ee-7.0.x*) echo ee-7.0.x;;
			*6.1.x*) echo 6.1.x;;
			*6.2.x*) echo 6.2.x;;
			*master*) echo master;;
			*7.0.x*) echo 7.0.x;;
			*) echo master;;
		esac
	}

	returnBuildDir(){
		echo d:/$(_returnPrivacy $@)/$(returnBranch $@)-portal
	}

	returnBundleDir(){
		echo d:/$(_returnPrivacy $@)/$(returnBranch $@)-bundles
	}

	$@
}