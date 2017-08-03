include app.server.version.constants.AppServerVersionConstants

include test.executor.Testexecutor
include test.util.TestUtil

AppServerVersionConstantsTest(){
	run(){
		TestExecutor executeTest AppServerVersionConstantsTest
	}

	testGlassfishVersion(){
		${assertEquals} $(AppServerVersionConstants glassfishVersion) 3.1.2.2
	}

	testJbossVersion(){
		${assertEquals} $(AppServerVersionConstants jbossVersion) eap-7.0.0
	}

	testJettyVersion(){
		${assertEquals} $(AppServerVersionConstants jettyVersion) 8.1.10
	}

	testJonasVersion(){
		${assertEquals} $(AppServerVersionConstants jonasVersion) 5.2.3
	}

	testResinVersion(){
		${assertEquals} $(AppServerVersionConstants resinVersion) 4.0.44
	}

	testTcatVersion(){
		${assertEquals} $(AppServerVersionConstants tcatVersion) 7.0.2
	}

	testTcserverVersion(){
		${assertEquals} $(AppServerVersionConstants tcserverVersion) 3.2.5
	}

	testTomcatVersion(){
		${assertEquals} $(AppServerVersionConstants tomcatVersion) 8.5.16
	}

	testWeblogicVersion(){
		${assertEquals} $(AppServerVersionConstants weblogicVersion) 12.2.1
	}

	testWebsphereVersion(){
		${assertEquals} $(AppServerVersionConstants websphereVersion) 8.5.5.0
	}

	testWildflyVersion(){
		${assertEquals} $(AppServerVersionConstants wildflyVersion) 10.0.0
	}

	local assertEquals="TestUtil assertEquals"

	$@
}