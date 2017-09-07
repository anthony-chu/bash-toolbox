include app.server.version.AppServerVersion
include app.server.version.constants.AppServerVersionConstants

include test.executor.TestExecutor
include test.util.TestUtil

AppServerVersionTest(){
	run(){
		TestExecutor executeTest AppServerVersionTest
	}

	test_overrideTomcatVersion[6.1.x](){
		${assertEquals} $(AppServerVersion _overrideTomcatVersion 6.1.x) 7.0.40
	}

	test_overrideTomcatVersion[6.2.x](){
		${assertEquals} $(AppServerVersion _overrideTomcatVersion 6.2.x) 7.0.42
	}

	test_overrideTomcatVersion[ee-6.1.30](){
		${assertEquals} $(AppServerVersion _overrideTomcatVersion 6.1.30) 7.0.40
	}

	test_overrideTomcatVersion[ee-6.2.10](){
		${assertEquals} $(AppServerVersion
			_overrideTomcatVersion ee-6.2.10) 7.0.42
	}

	test_overrideTomcatVersion[ee-6.2.x](){
		${assertEquals} $(AppServerVersion
			_overrideTomcatVersion ee-6.2.x) 7.0.62
	}

	test_overrideTomcatVersion[null](){
		${assertEquals} $(AppServerVersion _overrideTomcatVersion) 8.0.32
	}

	testReturnAppServerVersion[glassfish](){
		${assertEquals} $(AppServerVersion returnAppServerVersion glassfish) $(
			AppServerVersionConstants glassfishVersion)
	}

	testReturnAppServerVersion[jboss](){
		${assertEquals} $(AppServerVersion returnAppServerVersion jboss) $(
			AppServerVersionConstants jbossVersion)
	}

	testReturnAppServerVersion[jetty](){
		${assertEquals} $(AppServerVersion returnAppServerVersion jetty) $(
			AppServerVersionConstants jettyVersion)
	}

	testReturnAppServerVersion[jonas](){
		${assertEquals} $(AppServerVersion returnAppServerVersion jonas) $(
			AppServerVersionConstants jonasVersion)
	}

	testReturnAppServerVersion[null](){
		${assertNull} $(AppServerVersion returnAppServerVersion)
	}

	testReturnAppServerVersion[resin](){
		${assertEquals} $(AppServerVersion returnAppServerVersion resin) $(
			AppServerVersionConstants resinVersion)
	}

	testReturnAppServerVersion[tcat](){
		${assertEquals} $(AppServerVersion returnAppServerVersion tcat) $(
			AppServerVersionConstants tcatVersion)
	}

	testReturnAppServerVersion[tcserver](){
		${assertEquals} $(AppServerVersion returnAppServerVersion tcserver) $(
			AppServerVersionConstants tcserverVersion)
	}

	testReturnAppServerVersion[tomcat,6.0.6](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat 6.0.6) 6.0.29
	}

	testReturnAppServerVersion[tomcat,6.0.12](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat 6.0.12) 6.0.32
	}

	testReturnAppServerVersion[tomcat,6.1.x](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat 6.1.x) 7.0.40
	}

	testReturnAppServerVersion[tomcat,6.2.x](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat 6.2.x) 7.0.42
	}

	testReturnAppServerVersion[tomcat,7.0.x](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat 7.0.x) $(
				AppServerVersionConstants tomcatVersion)
	}

	testReturnAppServerVersion[tomcat,ee-6.1.x](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat ee-6.1.x) 7.0.40
	}

	testReturnAppServerVersion[tomcat,ee-6.1.30](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat ee-6.1.30) 7.0.40
	}

	testReturnAppServerVersion[tomcat,ee-6.2.10](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat ee-6.2.10) 7.0.42
	}

	testReturnAppServerVersion[tomcat,ee-6.2.x](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat ee-6.2.x) 7.0.62
	}

	testReturnAppServerVersion[tomcat,master](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion tomcat master) $(AppServerVersionConstants
				tomcatVersion)
	}

	testReturnAppServerVersion[weblogic](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion weblogic) $(AppServerVersionConstants
				weblogicVersion)
	}

	testReturnAppServerVersion[websphere](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion websphere) $(AppServerVersionConstants
				websphereVersion)
	}

	testReturnAppServerVersion[wildfly](){
		${assertEquals} $(AppServerVersion
			returnAppServerVersion wildfly) $(AppServerVersionConstants
				wildflyVersion)
	}

	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"

	$@
}