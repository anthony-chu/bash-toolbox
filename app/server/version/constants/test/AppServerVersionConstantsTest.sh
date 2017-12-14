include app.server.version.constants.AppServerVersionConstants

include test.executor.Testexecutor
include test.util.TestUtil

@class
AppServerVersionConstantsTest(){
	run(){
		TestExecutor executeTest AppServerVersionConstantsTest
	}

	@test
	testGlassfishVersion(){
		${assertEquals} $(AppServerVersionConstants glassfishVersion) 3.1.2.2
	}

	@test
	testJbossVersion(){
		${assertEquals} $(AppServerVersionConstants jbossVersion) eap-7.0.0
	}

	@test
	testJettyVersion(){
		${assertEquals} $(AppServerVersionConstants jettyVersion) 8.1.10
	}

	@test
	testJonasVersion(){
		${assertEquals} $(AppServerVersionConstants jonasVersion) 5.2.3
	}

	@test
	testResinVersion(){
		${assertEquals} $(AppServerVersionConstants resinVersion) 4.0.44
	}

	@test
	testTcatVersion(){
		${assertEquals} $(AppServerVersionConstants tcatVersion) 7.0.2
	}

	@test
	testTcserverVersion(){
		${assertEquals} $(AppServerVersionConstants tcserverVersion) 3.2.5
	}

	@test
	testTomcatVersion(){
		${assertEquals} $(AppServerVersionConstants tomcatVersion) 8.0.32
	}

	@test
	testWeblogicVersion(){
		${assertEquals} $(AppServerVersionConstants weblogicVersion) 12.2.1
	}

	@test
	testWebsphereVersion(){
		${assertEquals} $(AppServerVersionConstants websphereVersion) 8.5.5.0
	}

	@test
	testWildflyVersion(){
		${assertEquals} $(AppServerVersionConstants wildflyVersion) 10.0.0
	}

	local assertEquals="TestUtil assertEquals"

	$@
}