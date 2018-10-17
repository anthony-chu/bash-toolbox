include git.util.GitUtil

include language.util.LanguageUtil

include logger.Logger

include string.util.StringUtil

include repo.Repo

@class
GitRebaseUtil(){
	abort(){
		${_log} info "terminating_previous_rebase_process..."

		cd ${buildDir}

		git rebase --abort

		${_log} info "completed"
	}

	amend(){
		${_log} info "amending_the_previous_commit..."

		cd ${buildDir}

		git commit --amend

		${_log} info "completed"
	}

	cont(){
		${_log} info "continuing_the_current_rebase_process..."

		cd ${buildDir}

		git rebase --continue

		${_log} info "completed"
	}

	default(){
		cd ${buildDir}

		local curBranch=$(GitUtil getCurBranch)

		${_log} info "rebasing_${curBranch}_against_${branch}_HEAD..."

		git pull --rebase upstream ${branch}

		${_log} info "completed"
	}

	start(){
		local value=$(StringUtil returnOption ${1})

		local _message=(
			rebasing_the_last
			$(LanguageUtil togglePlurality ${value} commit commits)
		)

		${_log} info "$(StringUtil join _message _)..."

		cd ${buildDir}

		git rebase -i head~${value}

		${_log} info "completed"
	}

	local _log="Logger log"

	local branch=$(Repo getBranch ${@})
	local buildDir=$(Repo getBuildDir ${branch})

	$@
}