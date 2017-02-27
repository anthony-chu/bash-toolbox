include base.vars.BaseVars

include git.util.GitUtil

include language.util.LanguageUtil

include logger.Logger

include string.util.StringUtil
include string.validator.StringValidator

GitRebaseUtil(){
	abort(){
		Logger logProgressMsg "terminating_previous_rebase_process"

		cd ${buildDir}

		git rebase --abort

		Logger logCompletedMsg
	}

	amend(){
		Logger logProgressMsg "amending_the_previous_commit"

		cd ${buildDir}

		git commit --amend

		Logger logCompletedMsg
	}

	cont(){
		Logger logProgressMsg "continuing_the_current_rebase_process"

		cd ${buildDir}

		git rebase --continue

		Logger logCompletedMsg
	}

	default(){
		cd ${buildDir}

		curBranch=$(GitUtil getCurBranch)

		Logger logProgressMsg "rebasing_${curBranch}_against_${branch}_HEAD"

		git pull --rebase upstream ${branch}

		Logger logCompletedMsg
	}

	start(){
		local value=$(StringUtil returnOption ${2})

		local _message=(
			rebasing_the_last_${value}_
			$(LanguageUtil togglePlurality ${value} commit commits)
		)

		Logger logProgressMsg "$(StringUtil build _message)"

		cd ${buildDir}

		git rebase -i head~${value}

		Logger logCompletedMsg
	}

	local branch=$(BaseVars returnBranch ${@})
	local buildDir=$(BaseVars returnBuildDir ${branch})

	$@
}