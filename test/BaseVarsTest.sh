include base.vars.BaseVars

include file.name.util.FileNameUtil

include system.validator.SystemValidator

include test.executor.TestExecutor

BaseVarsTest(){
	run(){
		TestExecutor executeTest BaseVarsTest
	}

	test_returnPrivacyTest[private](){
		if [[ $(BaseVars _returnPrivacy ee-) == private ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	test_returnPrivacyTest[public](){
		if [[ $(BaseVars _returnPrivacy) == public ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBranch[6.1.x](){
		if [[ $(BaseVars returnBranch 6.1.x) == 6.1.x ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBranch[6.2.x](){
		if [[ $(BaseVars returnBranch 6.2.x) == 6.2.x ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBranch[ee-6.1.x](){
		if [[ $(BaseVars returnBranch ee-6.1.x) == ee-6.1.x ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBranch[ee-6.2.x](){
		if [[ $(BaseVars returnBranch ee-6.2.x) == ee-6.2.x ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBranch[ee-6.2.10](){
		if [[ $(BaseVars returnBranch ee-6.2.10) == ee-6.2.10 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBranch[ee-7.0.x](){
		if [[ $(BaseVars returnBranch ee-7.0.x) == ee-7.0.x ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBranch[default](){
		if [[ $(BaseVars returnBranch default) == master ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBranch[master](){
		if [[ $(BaseVars returnBranch master) == master ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[6.1.x](){
		local _expectedDir=/d/public/6.1.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBuildDir 6.1.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[6.2.x](){
		local _expectedDir=/d/public/6.2.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBuildDir 6.2.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[7.0.x](){
		local _expectedDir=/d/public/7.0.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBuildDir 7.0.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[default](){
		local _expectedDir=/d/public/master-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBuildDir default) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[ee-6.1.x](){
		local _expectedDir=/d/private/ee-6.1.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBuildDir ee-6.1.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[ee-6.2.x](){
		local _expectedDir=/d/private/ee-6.2.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBuildDir ee-6.2.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[ee-6.2.10](){
		local _expectedDir=/d/private/ee-6.2.10-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBuildDir ee-6.2.10) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[ee-7.0.x](){
		local _expectedDir=/d/private/ee-7.0.x-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBuildDir ee-7.0.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[master](){
		local _expectedDir=/d/public/master-portal
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBuildDir master) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[6.1.x](){
		local _expectedDir=/d/public/6.1.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBundleDir 6.1.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[6.2.x](){
		local _expectedDir=/d/public/6.2.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBundleDir 6.2.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[7.0.x](){
		local _expectedDir=/d/public/7.0.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBundleDir 7.0.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[default](){
		local _expectedDir=/d/public/master-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBundleDir default) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[ee-6.1.x](){
		local _expectedDir=/d/private/ee-6.1.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBundleDir ee-6.1.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[ee-6.2.x](){
		local _expectedDir=/d/private/ee-6.2.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBundleDir ee-6.2.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[ee-6.2.10](){
		local _expectedDir=/d/private/ee-6.2.10-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBundleDir ee-6.2.10) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[ee-7.0.x](){
		local _expectedDir=/d/private/ee-7.0.x-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBundleDir ee-7.0.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[master](){
		local _expectedDir=/d/public/master-bundles
		local expectedDir=$(FileNameUtil getPath ${_env} ${_expectedDir})

		if [[ $(BaseVars returnBundleDir master) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	if [[ $(SystemValidator isWindows) ]]; then
		local _env="win"
	else
		local _env="nix"
	fi

	$@
}