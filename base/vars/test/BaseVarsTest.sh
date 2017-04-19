include base.vars.BaseVars

include file.name.util.FileNameUtil

include system.validator.SystemValidator

include test.executor.TestExecutor
include test.util.TestUtil

BaseVarsTest(){
	run(){
		TestExecutor executeTest base.vars.test
	}

	test_returnPrivacyTest[private](){
		${assertEquals} $(BaseVars _returnPrivacy ee-) private
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

	testReturnBranch[ee-7.0.x](){
		${assertEquals} $(BaseVars returnBranch ee-7.0.x) ee-7.0.x
	}

	testReturnBranch[default](){
		${assertEquals} $(BaseVars returnBranch default) master
	}

	testReturnBranch[master](){
		${assertEquals} $(BaseVars returnBranch master) master
	}

	testReturnBuildDir[6.1.x](){
		local _expectedDir=/d/public/6.1.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBuildDir 6.1.x) expectedDir
	}

	testReturnBuildDir[6.2.x](){
		local _expectedDir=/d/public/6.2.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBuildDir 6.2.x) expectedDir
	}

	testReturnBuildDir[7.0.x](){
		local _expectedDir=/d/public/7.0.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBuildDir 7.0.x) expectedDir
	}

	testReturnBuildDir[default](){
		local _expectedDir=/d/public/master-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBuildDir default) expectedDir
	}

	testReturnBuildDir[ee-6.1.x](){
		local _expectedDir=/d/private/ee-6.1.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBuildDir ee-6.1.x) expectedDir
	}

	testReturnBuildDir[ee-6.2.x](){
		local _expectedDir=/d/private/ee-6.2.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBuildDir ee-6.2.x) expectedDir
	}

	testReturnBuildDir[ee-6.2.10](){
		local _expectedDir=/d/private/ee-6.2.10-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBuildDir ee-6.2.10) expectedDir
	}

	testReturnBuildDir[ee-7.0.x](){
		local _expectedDir=/d/private/ee-7.0.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBuildDir ee-7.0.x) expectedDir
	}

	testReturnBuildDir[master](){
		local _expectedDir=/d/public/master-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBuildDir master) expectedDir
	}

	testReturnBundleDir[6.1.x](){
		local _expectedDir=/d/public/6.1.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBundleDir 6.1.x) expectedDir
	}

	testReturnBundleDir[6.2.x](){
		local _expectedDir=/d/public/6.2.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBundleDir 6.2.x) expectedDir
	}

	testReturnBundleDir[7.0.x](){
		local _expectedDir=/d/public/7.0.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBundleDir 7.0.x) expectedDir
	}

	testReturnBundleDir[default](){
		local _expectedDir=/d/public/master-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBundleDir default) expectedDir
	}

	testReturnBundleDir[ee-6.1.x](){
		local _expectedDir=/d/private/ee-6.1.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBundleDir ee-6.1.x) expectedDir
	}

	testReturnBundleDir[ee-6.2.x](){
		local _expectedDir=/d/private/ee-6.2.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBundleDir ee-6.2.x) expectedDir
	}

	testReturnBundleDir[ee-6.2.10](){
		local _expectedDir=/d/private/ee-6.2.10-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBundleDir ee-6.2.10) expectedDir
	}

	testReturnBundleDir[ee-7.0.x](){
		local _expectedDir=/d/private/ee-7.0.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBundleDir ee-7.0.x) expectedDir
	}

	testReturnBundleDir[master](){
		local _expectedDir=/d/public/master-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		${assertEquals} $(BaseVars returnBundleDir master) expectedDir
	}

	local assertEquals="TestUtil assertEquals"

	if [[ $(SystemValidator isWindows) ]]; then
		local _env="win"
	else
		local _env="nix"
	fi

	$@
}