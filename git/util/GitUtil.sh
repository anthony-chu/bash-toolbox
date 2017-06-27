include base.comparator.BaseComparator
include base.vars.BaseVars

include calendar.util.CalendarUtil

include logger.Logger

include math.util.MathUtil

include string.util.StringUtil

GitUtil(){
	cleanSource(){
		Logger logProgressMsg "resetting_the_${branch}_source_directory"

		cd ${buildDir}

		git reset --hard -q

		if [[ $(MathUtil isOdd $(CalendarUtil getDayOfWeek num)) || $(
			BaseComparator isEqual ${1} true) ]] ; then

			git clean -fdqx
		fi

		Logger logCompletedMsg
	}

	clearIndexLock(){
		local lockFile=${buildDir}/.git/index.lock

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
		cd ${buildDir}

		git --git-dir=${buildDir}/.git rev-parse origin/$(StringUtil
			toLowerCase ${branch})
	}

	getSHA(){
		cd ${buildDir}

		local length=${2}

		if [[ $(BaseComparator isEqual ${length} long) ]]; then
			git log --oneline --pretty=format:%H -1
		elif [[ $(BaseComparator isEqual ${length} short) ]]; then
			git log --oneline --pretty=format:%h -1
		fi
	}

	listBranches(){
		git branch | sed s/\*/\ /g
	}

	pr(){
		source /d/git-tools/git-pull-request/git-pull-request.sh
	}

	local branch=$(BaseVars returnBranch ${@})
	local buildDir=$(BaseVars returnBuildDir ${branch})

	$@
}