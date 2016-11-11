include logger.Logger

GitException(){
	curBranchException(){
		Logger logErrorMsg "cannot_${1}_${2}_because_${2}_is_the_current_branch"
	}

	existingBranchException(){
		Logger logErrorMsg "cannot_${1}_${2}_because_${2}_already_exists"
	}

	$@
}