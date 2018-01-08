include app.server.version.AppServerVersion
include app.server.version.constants.AppServerVersionConstants

include test.executor.TestExecutor
include test.util.TestUtil

@class
AppServerVersionTest(){
	run(){
		TestExecutor executeTest AppServerVersionTest
	}

	@test
	test_overrideTomcatVersion[6.1.x](){
		${assertEquals} $(AppServerVersion _overrideTomcatVersion 6.1.x) 7.0.40
	}

	@test
	test_overrideTomcatVersion[6.2.x](){
		${assertEquals} $(AppServerVersion _overrideTomcatVersion 6.2.x) 7.0.42
	}

	@test
	test_overrideTomcatVersion[ee-6.1.30](){
		${assertEquals} $(AppServerVersion _overrideTomcatVersion 6.1.30) 7.0.40
	}

	@test
	test_overrideTomcatVersion[ee-6.2.10](){
		${assertEquals} $(AppServerVersion
			_overrideTomcatVersion ee-6.2.10) 7.0.62
	}

	@test
	test_overrideTomcatVersion[ee-6.2.x](){
		${assertEquals} $(AppServerVersion
			_overrideTomcatVersion ee-6.2.x) 7.0.62
	}

	@test
	test_overrideTomcatVersion[null](){
		${assertEquals} $(AppServerVersion _overrideTomcatVersion) 8.0.32
	}

	@test
	testReturnAppServerVersion[glassfish](){
		${assertEquals} $(AppServerVersion returnAppServerVersion glassfish) $(
			AppServerVersionConstants glassfishVersion)
	}

	@test
	testReturnAppServerVersion[jboss](){
		${assertEquals} $(AppServerVersion returnAppServerVersion jboss) $(
			AppServerVersionConstants jbossVersion)
	}

	@test
	testReturnAppServerVersion[jetty](){
		${assertEquals} $(AppServerVersion returnAppServerVersion jetty) $(
			AppServerVersionConstants jettyVersion)
	}

	@test
	testReturnAppServerVersion[jonas](){
		${assertEquals} $(AppServerVersion returnAppServerVersion jonas) $(
			AppServerVersionConstants jonasVersion)
	}

	@test
	testReturnAppServerVersion[null](){
		${assertNull} $(AppServerVersion returnAppServerVersion)
	}

	@test
	testReturnAppServerVersion[resin](){
		${assertEquals} $(AppServerVersion returnAppServerVersion resin) $(
			AppServerVersionConstants resinVersion)
	}

	@test
	testReturnAppServerVersion[tcat](){
		${assertEquals} $(AppServerVersion returnAppServerVersion tcat) $(
			AppServerVersionConstants tcatVersion)
	}

	@test
	testReturnAppServerVersion[tcserver](){
		${assertEquals} $(AppServerVersion returnAppServerVersion tcserver) $(
			AppServerVersionConstants tcserverVersion)
	}

	@test
	testReturnAppServerVersion[tomcat,6.0.6](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat 6.0.6) 6.0.29
	}

	@test
	testReturnAppServerVersion[tomcat,6.0.12](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat 6.0.12) 6.0.32
	}

	@test
	testReturnAppServerVersion[tomcat,6.1.x](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat 6.1.x) 7.0.40
	}

	@test
	testReturnAppServerVersion[tomcat,6.2.x](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat 6.2.x) 7.0.42
	}

	@test
	testReturnAppServerVersion[tomcat,7.0.x](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat 7.0.x) $(
				AppServerVersionConstants tomcatVersion)
	}

	@test
	testReturnAppServerVersion[tomcat,ee-6.1.x](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat ee-6.1.x) 7.0.40
	}

	@test
	testReturnAppServerVersion[tomcat,ee-6.1.30](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat ee-6.1.30) 7.0.40
	}

	@test
	testReturnAppServerVersion[tomcat,ee-6.2.10](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat ee-6.2.10) 7.0.42
	}

	@test
	testReturnAppServerVersion[tomcat,ee-6.2.x](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat ee-6.2.x) 7.0.62
	}

	@test
	testReturnAppServerVersion[tomcat,master](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat master) $(AppServerVersionConstants
				tomcatVersion)
	}

	@test
	testReturnAppServerVersion[weblogic](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion weblogic) $(AppServerVersionConstants
				weblogicVersion)
	}

	@test
	testReturnAppServerVersion[websphere](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion websphere) $(AppServerVersionConstants
				websphereVersion)
	}

	@test
	testReturnAppServerVersion[wildfly](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion wildfly) $(AppServerVersionConstants
				wildflyVersion)
	}

	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"

	$@
}