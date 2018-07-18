include logger.Logger

@class
GitException(){
	curBranchException(){
		_log error "cannot_${1}_${2}_because_${2}_is_the_current_branch"
	}

	existingBranchException(){
		_log error "cannot_${1}_${2}_because_${2}_already_exists"
	}

	noSuchBranchException(){
		_log error "cannot_${1}_${2}_because_${2}_does_not_exist"
	}

	local _log="Logger log"

	$@
}