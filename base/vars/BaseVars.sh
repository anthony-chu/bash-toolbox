BaseVars(){
	_getPath(){
		local path=${1}

		if [[ $(uname) =~ NT ]]; then
			local _drive=${path:1:1}
			local drive=${_drive^}
			local headlessPath=${path/\/[a-z]/}

			echo ${drive}:${headlessPath}
		else
			echo ${path}
		fi
	}

	_returnPrivacy(){
		if [[ $(isPrivate $@) ]]; then
			echo private
		else
			echo public
		fi
	}

	isPrivate(){
		if [[ $@ == *ee-* ]]; then
			echo true
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
		local dir=/d/$(_returnPrivacy $@)/$(returnBranch $@)-portal

		_getPath ${dir}
	}

	returnBundleDir(){
		 local dir=/d/$(_returnPrivacy $@)/$(returnBranch $@)-bundles

		 _getPath ${dir}
	}

	$@
}