include file.name.util.FileNameUtil

include repo.Repo

include test.util.TestUtil

@class
RepoTest(){
	@test
	test_getPrivacyTest[ee-private](){
		${assertEquals} $(Repo _getPrivacy ee-) private
	}

	@test
	test_getPrivacyTest[private-private](){
		${assertEquals} $(Repo _getPrivacy -private) private
	}

	@test
	test_getPrivacyTest[public](){
		${assertEquals} $(Repo _getPrivacy) public
	}

	@test
	testGetBranch[6.1.x](){
		${assertEquals} $(Repo getBranch 6.1.x) 6.1.x
	}

	@test
	testGetBranch[6.2.x](){
		${assertEquals} $(Repo getBranch 6.2.x) 6.2.x
	}

	@test
	testGetBranch[7.0.x](){
		${assertEquals} $(Repo getBranch 7.0.x) 7.0.x
	}

	@test
	testGetBranch[7.0.x-private](){
		${assertEquals} $(Repo getBranch 7.0.x-private) 7.0.x-private
	}

	@test
	testGetBranch[7.1.x](){
		${assertEquals} $(Repo getBranch 7.1.x) 7.1.x
	}

	@test
	testGetBranch[7.1.x-private](){
		${assertEquals} $(Repo getBranch 7.1.x-private) 7.1.x-private
	}

	@test
	testGetBranch[ee-6.1.x](){
		${assertEquals} $(Repo getBranch ee-6.1.x) ee-6.1.x
	}

	@test
	testGetBranch[ee-6.2.x](){
		${assertEquals} $(Repo getBranch ee-6.2.x) ee-6.2.x
	}

	@test
	testGetBranch[ee-6.2.10](){
		${assertEquals} $(Repo getBranch ee-6.2.10) ee-6.2.10
	}

	@test
	testGetBranch[default](){
		${assertEquals} $(Repo getBranch default) master
	}

	@test
	testGetBranch[master](){
		${assertEquals} $(Repo getBranch master) master
	}

	@test
	testGetBranch[master-private](){
		${assertEquals} $(Repo getBranch master-private) master-private
	}

	@test
	testGetBuildDir[6.1.x](){
		${assertEquals} $(Repo getBuildDir 6.1.x) $(FileNameUtil
			getPath /d/public/6.1.x/portal)
	}

	@test
	testGetBuildDir[6.2.x](){
		${assertEquals} $(Repo getBuildDir 6.2.x) $(FileNameUtil
			getPath /d/public/6.2.x/portal)
	}

	@test
	testGetBuildDir[7.0.x](){
		${assertEquals} $(Repo getBuildDir 7.0.x) $(FileNameUtil
			getPath /d/private/7.0.x/portal)
	}

	@test
	testGetBuildDir[7.0.x-private](){
		${assertEquals} $(Repo getBuildDir 7.0.x-private) $(FileNameUtil
			getPath /d/private/7.0.x-private/portal)
	}

	@test
	testGetBuildDir[7.1.x](){
		${assertEquals} $(Repo getBuildDir 7.1.x) $(FileNameUtil
			getPath /d/private/7.1.x/portal)
	}

	@test
	testGetBuildDir[7.1.x-private](){
		${assertEquals} $(Repo getBuildDir 7.1.x-private) $(FileNameUtil
			getPath /d/private/7.1.x-private/portal)
	}

	@test
	testGetBuildDir[default](){
		${assertEquals} $(Repo getBuildDir default) $(FileNameUtil
			getPath /d/public/master/portal)
	}

	@test
	testGetBuildDir[ee-6.1.x](){
		${assertEquals} $(Repo getBuildDir ee-6.1.x) $(FileNameUtil
			getPath /d/private/ee-6.1.x/portal)
	}

	@test
	testGetBuildDir[ee-6.2.x](){
		${assertEquals} $(Repo getBuildDir ee-6.2.x) $(FileNameUtil
			getPath /d/private/ee-6.2.x/portal)
	}

	@test
	testGetBuildDir[ee-6.2.10](){
		${assertEquals} $(Repo getBuildDir ee-6.2.10) $(FileNameUtil
			getPath /d/private/ee-6.2.10/portal)
	}

	@test
	testGetBuildDir[master](){
		${assertEquals} $(Repo getBuildDir master) $(FileNameUtil
			getPath /d/public/master/portal)
	}

	@test
	testGetBundleDir[6.1.x](){
		${assertEquals} $(Repo getBundleDir 6.1.x) $(FileNameUtil
			getPath /d/public/6.1.x/bundles)
	}

	@test
	testGetBundleDir[6.2.x](){
		${assertEquals} $(Repo getBundleDir 6.2.x) $(FileNameUtil
			getPath /d/public/6.2.x/bundles)
	}

	@test
	testGetBundleDir[7.0.x](){
		${assertEquals} $(Repo getBundleDir 7.0.x) $(FileNameUtil
			getPath /d/private/7.0.x/bundles)
	}

	@test
	testGetBundleDir[7.0.x-private](){
		${assertEquals} $(Repo getBundleDir 7.0.x-private) $(FileNameUtil
			getPath /d/private/7.0.x-private/bundles)
	}

	@test
	testGetBundleDir[7.1.x](){
		${assertEquals} $(Repo getBundleDir 7.1.x) $(FileNameUtil
			getPath /d/private/7.1.x/bundles)
	}

	@test
	testGetBundleDir[7.1.x-private](){
		${assertEquals} $(Repo getBundleDir 7.1.x-private) $(FileNameUtil
			getPath /d/private/7.1.x-private/bundles)
	}

	@test
	testGetBundleDir[default](){
		${assertEquals} $(Repo getBundleDir default) $(FileNameUtil
			getPath /d/public/master/bundles)
	}

	@test
	testGetBundleDir[ee-6.1.x](){
		${assertEquals} $(Repo getBundleDir ee-6.1.x) $(FileNameUtil
			getPath /d/private/ee-6.1.x/bundles)
	}

	@test
	testGetBundleDir[ee-6.2.x](){
		${assertEquals} $(Repo getBundleDir ee-6.2.x) $(FileNameUtil
			getPath /d/private/ee-6.2.x/bundles)
	}

	@test
	testGetBundleDir[ee-6.2.10](){
		${assertEquals} $(Repo getBundleDir ee-6.2.10) $(FileNameUtil
			getPath /d/private/ee-6.2.10/bundles)
	}

	@test
	testGetBundleDir[master](){
		${assertEquals} $(Repo getBundleDir master) $(FileNameUtil
			getPath /d/public/master/bundles)
	}

	@test
	testGetBundleDir[master-private](){
		${assertEquals} $(Repo getBundleDir master-private) $(
			FileNameUtil getPath /d/private/master-private/bundles)
	}

	local assertEquals="TestUtil assertEquals"

	$@
}