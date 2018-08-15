include app.server.version.override.AppServerVersionOverride

include test.util.TestUtil

@class
AppServerVersionOverrideTest(){
	@test
	testGetTomcatVersion[6.1.x](){
		${assertEquals} $(${getTomcatVersion} 6.1.x) 7.0.40
	}

	@test
	testGetTomcatVersion[6.2.x](){
		${assertEquals} $(${getTomcatVersion} 6.2.x) 7.0.90
	}

	@test
	testGetTomcatVersion[7.0.x](){
		${assertEquals} $(${getTomcatVersion} 7.0.x) 8.0.53
	}

	@test
	testGetTomcatVersion[ee-6.1.30](){
		${assertEquals} $(${getTomcatVersion} ee-6.1.30) 7.0.40
	}

	@test
	testGetTomcatVersion[ee-6.2.10](){
		${assertEquals} $(${getTomcatVersion} ee-6.2.10) 7.0.90
	}

	@test
	testGetTomcatVersion[ee-6.2.x](){
		${assertEquals} $(${getTomcatVersion} ee-6.2.x) 7.0.90
	}

	@test
	testGetTomcatVersion[null](){
		${assertEquals} $(${getTomcatVersion}) 9.0.10
	}

	local assertEquals="TestUtil assertEquals"
	local getTomcatVersion="AppServerVersionOverride getTomcatVersion"

	$@
}