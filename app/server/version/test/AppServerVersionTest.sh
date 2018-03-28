include app.server.version.AppServerVersion
include app.server.version.constants.AppServerVersionConstants

include test.util.TestUtil

@class
AppServerVersionTest(){
	@test
	testReturnAppServerVersion[glassfish](){
		${assertEquals} $(${returnAppServerVersion} glassfish) $(
			AppServerVersionConstants GLASSFISH_VERSION)
	}

	@test
	testReturnAppServerVersion[jboss](){
		${assertEquals} $(${returnAppServerVersion} jboss) $(
			AppServerVersionConstants JBOSS_VERSION)
	}

	@test
	testReturnAppServerVersion[jetty](){
		${assertEquals} $(${returnAppServerVersion} jetty) $(
			AppServerVersionConstants JETTY_VERSION)
	}

	@test
	testReturnAppServerVersion[jonas](){
		${assertEquals} $(${returnAppServerVersion} jonas) $(
			AppServerVersionConstants JONAS_VERSION)
	}

	@test
	testReturnAppServerVersion[null](){
		${assertNull} $(${returnAppServerVersion})
	}

	@test
	testReturnAppServerVersion[resin](){
		${assertEquals} $(${returnAppServerVersion} resin) $(
			AppServerVersionConstants RESIN_VERSION)
	}

	@test
	testReturnAppServerVersion[tcat](){
		${assertEquals} $(${returnAppServerVersion} tcat) $(
			AppServerVersionConstants TCAT_VERSION)
	}

	@test
	testReturnAppServerVersion[tcserver](){
		${assertEquals} $(${returnAppServerVersion} tcserver) $(
			AppServerVersionConstants TCSERVER_VERSION)
	}

	@test
	testReturnAppServerVersion[tomcat,6.0.6](){
		${assertEquals} $(${returnAppServerVersion} tomcat 6.0.6) 6.0.29
	}

	@test
	testReturnAppServerVersion[tomcat,6.0.12](){
		${assertEquals} $(${returnAppServerVersion} tomcat 6.0.12) 6.0.32
	}

	@test
	testReturnAppServerVersion[tomcat,6.1.x](){
		${assertEquals} $(${returnAppServerVersion} tomcat 6.1.x) 7.0.40
	}

	@test
	testReturnAppServerVersion[tomcat,6.2.x](){
		${assertEquals} $(${returnAppServerVersion} tomcat 6.2.x) 7.0.42
	}

	@test
	testReturnAppServerVersion[tomcat,7.0.x](){
		${assertEquals} $(${returnAppServerVersion} tomcat 7.0.x) 8.0.32
	}

	@test
	testReturnAppServerVersion[tomcat,ee-6.1.x](){
		${assertEquals} $(${returnAppServerVersion} tomcat ee-6.1.x) 7.0.40
	}

	@test
	testReturnAppServerVersion[tomcat,ee-6.1.30](){
		${assertEquals} $(${returnAppServerVersion} tomcat ee-6.1.30) 7.0.40
	}

	@test
	testReturnAppServerVersion[tomcat,ee-6.2.10](){
		${assertEquals} $(${returnAppServerVersion} tomcat ee-6.2.10) 7.0.42
	}

	@test
	testReturnAppServerVersion[tomcat,ee-6.2.x](){
		${assertEquals} $(${returnAppServerVersion} tomcat ee-6.2.x) 7.0.62
	}

	@test
	testReturnAppServerVersion[tomcat,master](){
		${assertEquals} $(${returnAppServerVersion} tomcat master) $(
			AppServerVersionConstants TOMCAT_VERSION)
	}

	@test
	testReturnAppServerVersion[weblogic](){
		${assertEquals} $(${returnAppServerVersion} weblogic) $(
			AppServerVersionConstants WEBLOGIC_VERSION)
	}

	@test
	testReturnAppServerVersion[websphere](){
		${assertEquals} $(${returnAppServerVersion} websphere) $(
			AppServerVersionConstants WEBSPHERE_VERSION)
	}

	@test
	testReturnAppServerVersion[wildfly](){
		${assertEquals} $(${returnAppServerVersion} wildfly) $(
			AppServerVersionConstants WILDFLY_VERSION)
	}

	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"
	local returnAppServerVersion="AppServerVersion getAppServerVersion"

	$@
}