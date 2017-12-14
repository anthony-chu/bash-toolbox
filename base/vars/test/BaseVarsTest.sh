include base.vars.BaseVars

include file.name.util.FileNameUtil

include system.validator.SystemValidator

include test.executor.TestExecutor
include test.util.TestUtil

@class
BaseVarsTest(){
	run(){
		TestExecutor executeTest BaseVarsTest
	}

	@test
	test_returnPrivacyTest[ee-private](){
		${assertEquals} $(BaseVars _returnPrivacy ee-) private
	}

	@test
	test_returnPrivacyTest[private-private](){
		${assertEquals} $(BaseVars _returnPrivacy -private) private
	}

	@test
	test_returnPrivacyTest[public](){
		${assertEquals} $(BaseVars _returnPrivacy) public
	}

	@test
	testReturnBranch[6.1.x](){
		${assertEquals} $(BaseVars returnBranch 6.1.x) 6.1.x
	}

	@test
	testReturnBranch[6.2.x](){
		${assertEquals} $(BaseVars returnBranch 6.2.x) 6.2.x
	}

	@test
	testReturnBranch[ee-6.1.x](){
		${assertEquals} $(BaseVars returnBranch ee-6.1.x) ee-6.1.x
	}

	@test
	testReturnBranch[ee-6.2.x](){
		${assertEquals} $(BaseVars returnBranch ee-6.2.x) ee-6.2.x
	}

	@test
	testReturnBranch[ee-6.2.10](){
		${assertEquals} $(BaseVars returnBranch ee-6.2.10) ee-6.2.10
	}

	@test
	testReturnBranch[default](){
		${assertEquals} $(BaseVars returnBranch default) master
	}

	@test
	testReturnBranch[master](){
		${assertEquals} $(BaseVars returnBranch master) master
	}

	@test
	testReturnBranch[master-private](){
		${assertEquals} $(BaseVars returnBranch master-private) master-private
	}

	@test
	testReturnBuildDir[6.1.x](){
		${assertEquals} $(BaseVars returnBuildDir 6.1.x) $(FileNameUtil
			getPath ${_env} /d/public/6.1.x/portal)
	}

	@test
	testReturnBuildDir[6.2.x](){
		${assertEquals} $(BaseVars returnBuildDir 6.2.x) $(FileNameUtil
			getPath ${_env} /d/public/6.2.x/portal)
	}

	@test
	testReturnBuildDir[7.0.x](){
		${assertEquals} $(BaseVars returnBuildDir 7.0.x) $(FileNameUtil
			getPath ${_env} /d/private/7.0.x/portal)
	}

	@test
	testReturnBuildDir[7.0.x-private](){
		${assertEquals} $(BaseVars returnBuildDir 7.0.x-private) $(FileNameUtil
			getPath ${_env} /d/private/7.0.x-private/portal)
	}

	@test
	testReturnBuildDir[default](){
		${assertEquals} $(BaseVars returnBuildDir default) $(FileNameUtil
			getPath ${_env} /d/public/master/portal)
	}

	@test
	testReturnBuildDir[ee-6.1.x](){
		${assertEquals} $(BaseVars returnBuildDir ee-6.1.x) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.1.x/portal)
	}

	@test
	testReturnBuildDir[ee-6.2.x](){
		${assertEquals} $(BaseVars returnBuildDir ee-6.2.x) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.2.x/portal)
	}

	@test
	testReturnBuildDir[ee-6.2.10](){
		${assertEquals} $(BaseVars returnBuildDir ee-6.2.10) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.2.10/portal)
	}

	@test
	testReturnBuildDir[master](){
		${assertEquals} $(BaseVars returnBuildDir master) $(FileNameUtil
			getPath ${_env} /d/public/master/portal)
	}

	@test
	testReturnBundleDir[6.1.x](){
		${assertEquals} $(BaseVars returnBundleDir 6.1.x) $(FileNameUtil
			getPath ${_env} /d/public/6.1.x/bundles)
	}

	@test
	testReturnBundleDir[6.2.x](){
		${assertEquals} $(BaseVars returnBundleDir 6.2.x) $(FileNameUtil
			getPath ${_env} /d/public/6.2.x/bundles)
	}

	@test
	testReturnBundleDir[7.0.x](){
		${assertEquals} $(BaseVars returnBundleDir 7.0.x) $(FileNameUtil
			getPath ${_env} /d/private/7.0.x/bundles)
	}

	@test
	testReturnBundleDir[7.0.x-private](){
		${assertEquals} $(BaseVars returnBundleDir 7.0.x-private) $(FileNameUtil
			getPath ${_env} /d/private/7.0.x-private/bundles)
	}

	@test
	testReturnBundleDir[default](){
		${assertEquals} $(BaseVars returnBundleDir default) $(FileNameUtil
			getPath ${_env} /d/public/master/bundles)
	}

	@test
	testReturnBundleDir[ee-6.1.x](){
		${assertEquals} $(BaseVars returnBundleDir ee-6.1.x) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.1.x/bundles)
	}

	@test
	testReturnBundleDir[ee-6.2.x](){
		${assertEquals} $(BaseVars returnBundleDir ee-6.2.x) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.2.x/bundles)
	}

	@test
	testReturnBundleDir[ee-6.2.10](){
		${assertEquals} $(BaseVars returnBundleDir ee-6.2.10) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.2.10/bundles)
	}

	@test
	testReturnBundleDir[master](){
		${assertEquals} $(BaseVars returnBundleDir master) $(FileNameUtil
			getPath ${_env} /d/public/master/bundles)
	}

	@test
	testReturnBundleDir[master-private](){
		${assertEquals} $(BaseVars returnBundleDir master-private) $(
			FileNameUtil getPath ${_env} /d/private/master-private/bundles)
	}

	local assertEquals="TestUtil assertEquals"

	if [[ $(SystemValidator isWindows) ]]; then
		local _env="win"
	else
		local _env="nix"
	fi

	$@
}