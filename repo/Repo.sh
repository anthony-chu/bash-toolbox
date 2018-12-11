include file.name.util.FileNameUtil

include props.util.PropsUtil

@class
Repo(){

	@private
	_getBaseDir(){
		local _baseDir=$(PropsUtil getProperty $(pwd)/base.properties base.dir)

		if [[ ! ${_baseDir} ]]; then
			echo "/d"
		else
			echo ${_baseDir//*=/}
		fi
	}

	@private
	_getPrivacy(){
		local privacy=public

		if [[ $(isPrivate $@) ]]; then
			local privacy=private
		fi

		echo ${privacy}
	}

	isPrivate(){
		case $@ in
			*ee-* | *-private* | *7.*.x* ) echo true ;;
		esac
	}

	getBranch(){
		local branches=(
			ee-6.1.30 ee-6.1.x ee-6.2.x ee-6.2.10 6.1.x 6.2.x 7.0.x-private
			7.0.x 7.1.x-private 7.2.x-private 7.1.x 7.2.x master-private master
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
		local path=$(_getBaseDir)/$(_getPrivacy $@)/$(getBranch $@)/portal

		FileNameUtil getPath ${path}
	}

	getBundleDir(){
		local path=$(_getBaseDir)/$(_getPrivacy $@)/$(getBranch $@)/bundles

		FileNameUtil getPath ${path}
	}

	$@
}