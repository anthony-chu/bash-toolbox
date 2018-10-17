include base.vars.BaseVars

include file.name.util.FileNameUtil

include test.util.TestUtil

@class
BaseVarsTest(){
	@test
	test_getPrivacyTest[ee-private](){
		${assertEquals} $(BaseVars _getPrivacy ee-) private
	}

	@test
	test_getPrivacyTest[private-private](){
		${assertEquals} $(BaseVars _getPrivacy -private) private
	}

	@test
	test_getPrivacyTest[public](){
		${assertEquals} $(BaseVars _getPrivacy) public
	}

	@test
	testGetBranch[6.1.x](){
		${assertEquals} $(BaseVars getBranch 6.1.x) 6.1.x
	}

	@test
	testGetBranch[6.2.x](){
		${assertEquals} $(BaseVars getBranch 6.2.x) 6.2.x
	}

	@test
	testGetBranch[7.0.x](){
		${assertEquals} $(BaseVars getBranch 7.0.x) 7.0.x
	}

	@test
	testGetBranch[7.0.x-private](){
		${assertEquals} $(BaseVars getBranch 7.0.x-private) 7.0.x-private
	}

	@test
	testGetBranch[7.1.x](){
		${assertEquals} $(BaseVars getBranch 7.1.x) 7.1.x
	}

	@test
	testGetBranch[7.1.x-private](){
		${assertEquals} $(BaseVars getBranch 7.1.x-private) 7.1.x-private
	}

	@test
	testGetBranch[ee-6.1.x](){
		${assertEquals} $(BaseVars getBranch ee-6.1.x) ee-6.1.x
	}

	@test
	testGetBranch[ee-6.2.x](){
		${assertEquals} $(BaseVars getBranch ee-6.2.x) ee-6.2.x
	}

	@test
	testGetBranch[ee-6.2.10](){
		${assertEquals} $(BaseVars getBranch ee-6.2.10) ee-6.2.10
	}

	@test
	testGetBranch[default](){
		${assertEquals} $(BaseVars getBranch default) master
	}

	@test
	testGetBranch[master](){
		${assertEquals} $(BaseVars getBranch master) master
	}

	@test
	testGetBranch[master-private](){
		${assertEquals} $(BaseVars getBranch master-private) master-private
	}

	@test
	testGetBuildDir[6.1.x](){
		${assertEquals} $(BaseVars getBuildDir 6.1.x) $(FileNameUtil
			getPath /d/public/6.1.x/portal)
	}

	@test
	testGetBuildDir[6.2.x](){
		${assertEquals} $(BaseVars getBuildDir 6.2.x) $(FileNameUtil
			getPath /d/public/6.2.x/portal)
	}

	@test
	testGetBuildDir[7.0.x](){
		${assertEquals} $(BaseVars getBuildDir 7.0.x) $(FileNameUtil
			getPath /d/private/7.0.x/portal)
	}

	@test
	testGetBuildDir[7.0.x-private](){
		${assertEquals} $(BaseVars getBuildDir 7.0.x-private) $(FileNameUtil
			getPath /d/private/7.0.x-private/portal)
	}

	@test
	testGetBuildDir[7.1.x](){
		${assertEquals} $(BaseVars getBuildDir 7.1.x) $(FileNameUtil
			getPath /d/private/7.1.x/portal)
	}

	@test
	testGetBuildDir[7.1.x-private](){
		${assertEquals} $(BaseVars getBuildDir 7.1.x-private) $(FileNameUtil
			getPath /d/private/7.1.x-private/portal)
	}

	@test
	testGetBuildDir[default](){
		${assertEquals} $(BaseVars getBuildDir default) $(FileNameUtil
			getPath /d/public/master/portal)
	}

	@test
	testGetBuildDir[ee-6.1.x](){
		${assertEquals} $(BaseVars getBuildDir ee-6.1.x) $(FileNameUtil
			getPath /d/private/ee-6.1.x/portal)
	}

	@test
	testGetBuildDir[ee-6.2.x](){
		${assertEquals} $(BaseVars getBuildDir ee-6.2.x) $(FileNameUtil
			getPath /d/private/ee-6.2.x/portal)
	}

	@test
	testGetBuildDir[ee-6.2.10](){
		${assertEquals} $(BaseVars getBuildDir ee-6.2.10) $(FileNameUtil
			getPath /d/private/ee-6.2.10/portal)
	}

	@test
	testGetBuildDir[master](){
		${assertEquals} $(BaseVars getBuildDir master) $(FileNameUtil
			getPath /d/public/master/portal)
	}

	@test
	testGetBundleDir[6.1.x](){
		${assertEquals} $(BaseVars getBundleDir 6.1.x) $(FileNameUtil
			getPath /d/public/6.1.x/bundles)
	}

	@test
	testGetBundleDir[6.2.x](){
		${assertEquals} $(BaseVars getBundleDir 6.2.x) $(FileNameUtil
			getPath /d/public/6.2.x/bundles)
	}

	@test
	testGetBundleDir[7.0.x](){
		${assertEquals} $(BaseVars getBundleDir 7.0.x) $(FileNameUtil
			getPath /d/private/7.0.x/bundles)
	}

	@test
	testGetBundleDir[7.0.x-private](){
		${assertEquals} $(BaseVars getBundleDir 7.0.x-private) $(FileNameUtil
			getPath /d/private/7.0.x-private/bundles)
	}

	@test
	testGetBundleDir[7.1.x](){
		${assertEquals} $(BaseVars getBundleDir 7.1.x) $(FileNameUtil
			getPath /d/private/7.1.x/bundles)
	}

	@test
	testGetBundleDir[7.1.x-private](){
		${assertEquals} $(BaseVars getBundleDir 7.1.x-private) $(FileNameUtil
			getPath /d/private/7.1.x-private/bundles)
	}

	@test
	testGetBundleDir[default](){
		${assertEquals} $(BaseVars getBundleDir default) $(FileNameUtil
			getPath /d/public/master/bundles)
	}

	@test
	testGetBundleDir[ee-6.1.x](){
		${assertEquals} $(BaseVars getBundleDir ee-6.1.x) $(FileNameUtil
			getPath /d/private/ee-6.1.x/bundles)
	}

	@test
	testGetBundleDir[ee-6.2.x](){
		${assertEquals} $(BaseVars getBundleDir ee-6.2.x) $(FileNameUtil
			getPath /d/private/ee-6.2.x/bundles)
	}

	@test
	testGetBundleDir[ee-6.2.10](){
		${assertEquals} $(BaseVars getBundleDir ee-6.2.10) $(FileNameUtil
			getPath /d/private/ee-6.2.10/bundles)
	}

	@test
	testGetBundleDir[master](){
		${assertEquals} $(BaseVars getBundleDir master) $(FileNameUtil
			getPath /d/public/master/bundles)
	}

	@test
	testGetBundleDir[master-private](){
		${assertEquals} $(BaseVars getBundleDir master-private) $(
			FileNameUtil getPath /d/private/master-private/bundles)
	}

	local assertEquals="TestUtil assertEquals"

	$@
}