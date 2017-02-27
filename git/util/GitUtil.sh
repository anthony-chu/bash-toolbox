include logger.Logger

include math.util.MathUtil

include string.util.StringUtil

package base

GitUtil(){
	cleanSource(){
		Logger logProgressMsg "resetting_the_source_directory"

		local buildDir=$(BaseVars returnBuildDir ${@})

		cd ${buildDir}

		git reset --hard -q

		if [[ $(MathUtil isEven $(BaseUtil getDate -d)) || $(
			BaseComparator isEqual ${1} true) ]] ; then

			git clean -fdqx
		fi

		Logger logCompletedMsg
	}

	clearIndexLock(){
		local lockFile=$(BaseVars returnBuildDir ${1})/.git/index.lock

		if [ -e ${lockFile} ]; then
			Logger logProgressMsg "clearing_index_lock"

			rm -rf ${lockFile}

			Logger logCompletedMsg
		fi
	}

	getCurBranch(){
		git rev-parse --abbrev-ref HEAD
	}

	getOriginSHA(){
		local branch=${2}
		local projectDir=${1}

		cd ${projectDir}

		git --git-dir=${projectDir}/.git rev-parse origin/$(StringUtil
			toLowerCase ${branch})
	}

	getSHA(){
		local length=${2}
		local projectDir=${1}

		cd ${projectDir}

		if [[ $(BaseComparator isEqual ${length} long) ]]; then
			git log --oneline --pretty=format:%H -1
		elif [[ $(BaseComparator isEqual ${length} short) ]]; then
			git log --oneline --pretty=format:%h -1
		fi
	}

	listBranches(){
		git branch | sed s/\*/\ /g
	}

	$@
}