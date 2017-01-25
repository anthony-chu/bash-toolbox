include base.comparator.BaseComparator
include base.vars.BaseVars

include logger.Logger

include math.util.MathUtil

GitUtil(){
	cleanSource(){
		Logger logProgressMsg "resetting_the_source_directory"

		local buildDir=$(BaseVars returnBuildDir ${@})

		cd ${buildDir}

		git reset --hard -q

		if [[ $(MathUtil isEven $(BaseUtil getDate -d)) || $(
			BaseComparator isEqual ${1} true) ]] ; then

			git clean -fdqx -e "*.${HOSTNAME}.properties"
		fi

		Logger logCompletedMsg
	}

	getCurBranch(){
		git rev-parse --abbrev-ref HEAD
	}

	listBranches(){
		git branch | sed s/\*/\ /g
	}

	$@
}