@class
BaseVars(){

	@private
	_getBaseDir(){
		local propsFile=$(pwd)/base.properties

		local _baseDir=$(_getProperty ${propsFile} base.dir)

		if [[ ! ${_baseDir} ]]; then
			echo "/d"
		else
			echo ${_baseDir//*=/}
		fi
	}

	@private
	_getPath(){
		local path=${1}

		if [[ $(uname) =~ NT ]]; then
			local _drive=${path:1:1}
			local headlessPath=${path/\/[a-z]/}

			local path=${_drive^^}:${headlessPath}
		fi

		echo ${path}
	}

	@private
	_getProperty(){
		if [[ -e ${1} ]]; then
			cat ${1} | grep ${2}=.*
		fi
	}

	@private
	_getPrivacy(){
		if [[ $(isPrivate $@) ]]; then
			echo private
		else
			echo public
		fi
	}

	isPrivate(){
		case $@ in
			*ee-* | *-private* | *7.*.x* ) echo true ;;
		esac
	}

	getBranch(){
		local branches=(
			ee-6.1.30 ee-6.1.x ee-6.2.x ee-6.2.10 6.1.x 6.2.x
			master-private master 7.0.x-private 7.0.x 7.1.x-private 7.1.x
		)

		for branch in ${branches[@]}; do
			if [[ $@ == *${branch}* ]]; then
				echo ${branch}

				return
			fi
		done

		echo master
	}

	getBuildDir(){
		_getPath $(_getBaseDir)/$(_getPrivacy $@)/$(getBranch $@)/portal
	}

	getBundleDir(){
		_getPath $(_getBaseDir)/$(_getPrivacy $@)/$(getBranch $@)/bundles
	}

	$@
}