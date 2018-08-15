include app.server.version.constants.AppServerVersionConstants

include test.util.TestUtil

@class
AppServerVersionConstantsTest(){
	@test
	testGlassfishVersion(){
		${assertEquals} $(AppServerVersionConstants GLASSFISH_VERSION) 3.1.2.2
	}

	@test
	testJbossVersion(){
		${assertEquals} $(AppServerVersionConstants JBOSS_VERSION) eap-7.0.0
	}

	@test
	testJettyVersion(){
		${assertEquals} $(AppServerVersionConstants JETTY_VERSION) 8.1.10
	}

	@test
	testJonasVersion(){
		${assertEquals} $(AppServerVersionConstants JONAS_VERSION) 5.2.3
	}

	@test
	testResinVersion(){
		${assertEquals} $(AppServerVersionConstants RESIN_VERSION) 4.0.44
	}

	@test
	testTcatVersion(){
		${assertEquals} $(AppServerVersionConstants TCAT_VERSION) 7.0.2
	}

	@test
	testTcserverVersion(){
		${assertEquals} $(AppServerVersionConstants TCSERVER_VERSION) 3.2.5
	}

	@test
	testTomcatVersion(){
		${assertEquals} $(AppServerVersionConstants TOMCAT_VERSION) 9.0.10
	}

	@test
	testWeblogicVersion(){
		${assertEquals} $(AppServerVersionConstants WEBLOGIC_VERSION) 12.2.1
	}

	@test
	testWebsphereVersion(){
		${assertEquals} $(AppServerVersionConstants WEBSPHERE_VERSION) 8.5.5.0
	}

	@test
	testWildflyVersion(){
		${assertEquals} $(AppServerVersionConstants WILDFLY_VERSION) 11.0.0
	}

	local assertEquals="TestUtil assertEquals"

	$@
}