include base.vars.BaseVars

include git.util.GitUtil

include language.util.LanguageUtil

include logger.Logger

include string.util.StringUtil

@class
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

		local curBranch=$(GitUtil getCurBranch)

		Logger logProgressMsg "rebasing_${curBranch}_against_${branch}_HEAD"

		git pull --rebase upstream ${branch}

		Logger logCompletedMsg
	}

	start(){
		local value=$(StringUtil returnOption ${1})

		local _message=(
			rebasing_the_last
			$(LanguageUtil togglePlurality ${value} commit commits)
		)

		Logger logProgressMsg "$(StringUtil join _message _)"

		cd ${buildDir}

		git rebase -i head~${value}

		Logger logCompletedMsg
	}

	local branch=$(BaseVars getBranch ${@})
	local buildDir=$(BaseVars getBuildDir ${branch})

	$@
}