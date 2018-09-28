include array.util.ArrayUtil

include base.comparator.BaseComparator
include base.vars.BaseVars

include logger.Logger

include string.util.StringUtil
include string.validator.StringValidator

@class
GitUtil(){
	@private
	_getChangeLog(){
		cd ${buildDir}

		local commits=(
			$(git log --oneline upstream/${branch}..HEAD)
		)

		local changeLog=()

		for string in ${commits[@]}; do
			if [[ $(StringValidator isSubstring string LRQA) ||
					$(StringValidator isSubstring string LPS) ]]; then

				changeLog+=(${string})
			fi
		done

		ArrayUtil returnUniqueArray changeLog
	}

	cleanSource(){
		${_log} info "resetting_the_${branch}_source_directory..."

		cd ${buildDir}

		git reset --hard -q

		git clean -fdqx

		${_log} info "completed"
	}

	clearIndexLock(){
		local lockFile=${buildDir}/.git/index.lock

		if [ -e ${lockFile} ]; then
			${_log} info "clearing_index_lock..."

			rm -rf ${lockFile}

			${_log} info "completed"
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

	local branch=$(BaseVars getBranch ${@})
	local buildDir=$(BaseVars getBuildDir ${branch})

	local _log="Logger log"

	$@
}