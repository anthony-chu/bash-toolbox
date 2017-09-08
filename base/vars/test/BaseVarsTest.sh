BaseVarsTest(){
	local packages=(
		base.vars.BaseVars

		file.name.util.FileNameUtil

		system.validator.SystemValidator

		test.executor.TestExecutor
		test.util.TestUtil
	)

	run(){
		TestExecutor executeTest BaseVarsTest
	}

	test_returnPrivacyTest[ee-private](){
		${assertEquals} $(BaseVars _returnPrivacy ee-) private
	}

	test_returnPrivacyTest[private-private](){
		${assertEquals} $(BaseVars _returnPrivacy -private) private
	}

	test_returnPrivacyTest[public](){
		${assertEquals} $(BaseVars _returnPrivacy) public
	}

	testReturnBranch[6.1.x](){
		${assertEquals} $(BaseVars returnBranch 6.1.x) 6.1.x
	}

	testReturnBranch[6.2.x](){
		${assertEquals} $(BaseVars returnBranch 6.2.x) 6.2.x
	}

	testReturnBranch[ee-6.1.x](){
		${assertEquals} $(BaseVars returnBranch ee-6.1.x) ee-6.1.x
	}

	testReturnBranch[ee-6.2.x](){
		${assertEquals} $(BaseVars returnBranch ee-6.2.x) ee-6.2.x
	}

	testReturnBranch[ee-6.2.10](){
		${assertEquals} $(BaseVars returnBranch ee-6.2.10) ee-6.2.10
	}

	testReturnBranch[default](){
		${assertEquals} $(BaseVars returnBranch default) master
	}

	testReturnBranch[master](){
		${assertEquals} $(BaseVars returnBranch master) master
	}

	testReturnBranch[master-private](){
		${assertEquals} $(BaseVars returnBranch master-private) master-private
	}

	testReturnBuildDir[6.1.x](){
		${assertEquals} $(BaseVars returnBuildDir 6.1.x) $(FileNameUtil
			getPath ${_env} /d/public/6.1.x/portal)
	}

	testReturnBuildDir[6.2.x](){
		${assertEquals} $(BaseVars returnBuildDir 6.2.x) $(FileNameUtil
			getPath ${_env} /d/public/6.2.x/portal)
	}

	testReturnBuildDir[7.0.x](){
		${assertEquals} $(BaseVars returnBuildDir 7.0.x) $(FileNameUtil
			getPath ${_env} /d/private/7.0.x/portal)
	}

	testReturnBuildDir[7.0.x-private](){
		${assertEquals} $(BaseVars returnBuildDir 7.0.x-private) $(FileNameUtil
			getPath ${_env} /d/private/7.0.x-private/portal)
	}

	testReturnBuildDir[default](){
		${assertEquals} $(BaseVars returnBuildDir default) $(FileNameUtil
			getPath ${_env} /d/public/master/portal)
	}

	testReturnBuildDir[ee-6.1.x](){
		${assertEquals} $(BaseVars returnBuildDir ee-6.1.x) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.1.x/portal)
	}

	testReturnBuildDir[ee-6.2.x](){
		${assertEquals} $(BaseVars returnBuildDir ee-6.2.x) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.2.x/portal)
	}

	testReturnBuildDir[ee-6.2.10](){
		${assertEquals} $(BaseVars returnBuildDir ee-6.2.10) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.2.10/portal)
	}

	testReturnBuildDir[master](){
		${assertEquals} $(BaseVars returnBuildDir master) $(FileNameUtil
			getPath ${_env} /d/public/master/portal)
	}

	testReturnBundleDir[6.1.x](){
		${assertEquals} $(BaseVars returnBundleDir 6.1.x) $(FileNameUtil
			getPath ${_env} /d/public/6.1.x/bundles)
	}

	testReturnBundleDir[6.2.x](){
		${assertEquals} $(BaseVars returnBundleDir 6.2.x) $(FileNameUtil
			getPath ${_env} /d/public/6.2.x/bundles)
	}

	testReturnBundleDir[7.0.x](){
		${assertEquals} $(BaseVars returnBundleDir 7.0.x) $(FileNameUtil
			getPath ${_env} /d/private/7.0.x/bundles)
	}

	testReturnBundleDir[7.0.x-private](){
		${assertEquals} $(BaseVars returnBundleDir 7.0.x-private) $(FileNameUtil
			getPath ${_env} /d/private/7.0.x-private/bundles)
	}

	testReturnBundleDir[default](){
		${assertEquals} $(BaseVars returnBundleDir default) $(FileNameUtil
			getPath ${_env} /d/public/master/bundles)
	}

	testReturnBundleDir[ee-6.1.x](){
		${assertEquals} $(BaseVars returnBundleDir ee-6.1.x) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.1.x/bundles)
	}

	testReturnBundleDir[ee-6.2.x](){
		${assertEquals} $(BaseVars returnBundleDir ee-6.2.x) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.2.x/bundles)
	}

	testReturnBundleDir[ee-6.2.10](){
		${assertEquals} $(BaseVars returnBundleDir ee-6.2.10) $(FileNameUtil
			getPath ${_env} /d/private/ee-6.2.10/bundles)
	}

	testReturnBundleDir[master](){
		${assertEquals} $(BaseVars returnBundleDir master) $(FileNameUtil
			getPath ${_env} /d/public/master/bundles)
	}

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

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}