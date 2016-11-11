include base.vars.BaseVars
include test.executor.TestExecutor

BaseVarsTest(){
	run(){
		local tests=(
			_returnPrivacyTest[private]
			_returnPrivacyTest[public]
			returnBranch[6.1.x]
			returnBranch[6.2.x]
			returnBranch[ee-6.1.x]
			returnBranch[ee-6.2.x]
			returnBranch[ee-6.2.10]
			returnBranch[ee-7.0.x]
			returnBranch[default]
			returnBranch[master]
			returnBuildDir[6.1.x]
			returnBuildDir[6.2.x]
			returnBuildDir[7.0.x]
			returnBuildDir[default]
			returnBuildDir[ee-6.1.x]
			returnBuildDir[ee-6.2.x]
			returnBuildDir[ee-6.2.10]
			returnBuildDir[ee-7.0.x]
			returnBuildDir[master]
			returnBundleDir[6.1.x]
			returnBundleDir[6.2.x]
			returnBundleDir[7.0.x]
			returnBundleDir[default]
			returnBundleDir[ee-6.1.x]
			returnBundleDir[ee-6.2.x]
			returnBundleDir[ee-6.2.10]
			returnBundleDir[ee-7.0.x]
			returnBundleDir[master]
		)

		TestExecutor executeTest BaseVarsTest ${tests[@]}
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
		local expectedDir=d:/public/6.1.x-portal

		if [[ $(BaseVars returnBuildDir 6.1.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[6.2.x](){
		local expectedDir=d:/public/6.2.x-portal

		if [[ $(BaseVars returnBuildDir 6.2.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[7.0.x](){
		local expectedDir=d:/public/7.0.x-portal

		if [[ $(BaseVars returnBuildDir 7.0.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[default](){
		local expectedDir=d:/public/master-portal

		if [[ $(BaseVars returnBuildDir default) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[ee-6.1.x](){
		local expectedDir=d:/private/ee-6.1.x-portal

		if [[ $(BaseVars returnBuildDir ee-6.1.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[ee-6.2.x](){
		local expectedDir=d:/private/ee-6.2.x-portal

		if [[ $(BaseVars returnBuildDir ee-6.2.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[ee-6.2.10](){
		local expectedDir=d:/private/ee-6.2.10-portal

		if [[ $(BaseVars returnBuildDir ee-6.2.10) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[ee-7.0.x](){
		local expectedDir=d:/private/ee-7.0.x-portal

		if [[ $(BaseVars returnBuildDir ee-7.0.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBuildDir[master](){
		local expectedDir=d:/public/master-portal

		if [[ $(BaseVars returnBuildDir master) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[6.1.x](){
		local expectedDir=d:/public/6.1.x-bundles

		if [[ $(BaseVars returnBundleDir 6.1.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[6.2.x](){
		local expectedDir=d:/public/6.2.x-bundles

		if [[ $(BaseVars returnBundleDir 6.2.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[7.0.x](){
		local expectedDir=d:/public/7.0.x-bundles

		if [[ $(BaseVars returnBundleDir 7.0.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[default](){
		local expectedDir=d:/public/master-bundles

		if [[ $(BaseVars returnBundleDir default) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[ee-6.1.x](){
		local expectedDir=d:/private/ee-6.1.x-bundles

		if [[ $(BaseVars returnBundleDir ee-6.1.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[ee-6.2.x](){
		local expectedDir=d:/private/ee-6.2.x-bundles

		if [[ $(BaseVars returnBundleDir ee-6.2.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[ee-6.2.10](){
		local expectedDir=d:/private/ee-6.2.10-bundles

		if [[ $(BaseVars returnBundleDir ee-6.2.10) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[ee-7.0.x](){
		local expectedDir=d:/private/ee-7.0.x-bundles

		if [[ $(BaseVars returnBundleDir ee-7.0.x) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnBundleDir[master](){
		local expectedDir=d:/public/master-bundles

		if [[ $(BaseVars returnBundleDir master) == ${expectedDir} ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	$@
}