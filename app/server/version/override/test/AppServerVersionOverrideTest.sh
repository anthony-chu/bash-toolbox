include app.server.version.override.AppServerVersionOverride

include test.util.TestUtil

@class
AppServerVersionOverrideTest(){
	@test
	testGetJbossVersion[6.1](){
		${assertEquals} $(${getJbossVersion} 6.1) eap-6.0.1
	}

	@test
	testGetJbossVersion[6.2](){
		${assertEquals} $(${getJbossVersion} 6.2) eap-6.4.0
	}

	@test
	testGetJbossVersion[7.0](){
		${assertEquals} $(${getJbossVersion} 7.0) eap-7.0.0
	}

	@test
	testGetJbossVersion[null](){
		${assertEquals} $(${getJbossVersion}) eap-7.1.0
	}

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
		${assertEquals} $(${getTomcatVersion}) 9.0.17
	}

	@test
	testGetWebsphereVersion[7.0](){
		${assertEquals} $(${getWebsphereVersion} 7.0) 8.5.5.0
	}

	@test
	testGetWebsphereVersion[7.1](){
		${assertEquals} $(${getWebsphereVersion} 7.1) 9.0.0.0
	}

	@test
	testGetWebsphereVersion[master](){
		${assertEquals} $(${getWebsphereVersion} master) 9.0.0.0
	}

	@test
	testGetWildflyVersion[7.0](){
		${assertEquals} $(${getWildflyVersion} 7.0) 10.0.0
	}

	@test
	testGetWildflyVersion[7.1](){
		${assertEquals} $(${getWildflyVersion} 7.1) 11.0.0
	}

	@test
	testGetWildflyVersion[master](){
		${assertEquals} $(${getWildflyVersion} master) 11.0.0
	}

	local assertEquals="TestUtil assertEquals"
	local getJbossVersion="AppServerVersionOverride getJbossVersion"
	local getTomcatVersion="AppServerVersionOverride getTomcatVersion"
	local getWebsphereVersion="AppServerVersionOverride getWebsphereVersion"
	local getWildflyVersion="AppServerVersionOverride getWildflyVersion"

	$@
}