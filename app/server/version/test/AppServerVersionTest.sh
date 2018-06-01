include app.server.version.AppServerVersion
include app.server.version.constants.AppServerVersionConstants

include test.util.TestUtil

@class
AppServerVersionTest(){
	@test
	testGetAppServerVersion[glassfish](){
		${assertEquals} $(${getAppServerVersion} glassfish) $(
			AppServerVersionConstants GLASSFISH_VERSION)
	}

	@test
	testGetAppServerVersion[jboss](){
		${assertEquals} $(${getAppServerVersion} jboss) $(
			AppServerVersionConstants JBOSS_VERSION)
	}

	@test
	testGetAppServerVersion[jetty](){
		${assertEquals} $(${getAppServerVersion} jetty) $(
			AppServerVersionConstants JETTY_VERSION)
	}

	@test
	testGetAppServerVersion[jonas](){
		${assertEquals} $(${getAppServerVersion} jonas) $(
			AppServerVersionConstants JONAS_VERSION)
	}

	@test
	testGetAppServerVersion[null](){
		${assertNull} $(${getAppServerVersion})
	}

	@test
	testGetAppServerVersion[resin](){
		${assertEquals} $(${getAppServerVersion} resin) $(
			AppServerVersionConstants RESIN_VERSION)
	}

	@test
	testGetAppServerVersion[tcat](){
		${assertEquals} $(${getAppServerVersion} tcat) $(
			AppServerVersionConstants TCAT_VERSION)
	}

	@test
	testGetAppServerVersion[tcserver](){
		${assertEquals} $(${getAppServerVersion} tcserver) $(
			AppServerVersionConstants TCSERVER_VERSION)
	}

	@test
	testGetAppServerVersion[tomcat,6.0.6](){
		${assertEquals} $(${getAppServerVersion} tomcat 6.0.6) 6.0.29
	}

	@test
	testGetAppServerVersion[tomcat,6.0.12](){
		${assertEquals} $(${getAppServerVersion} tomcat 6.0.12) 6.0.32
	}

	@test
	testGetAppServerVersion[tomcat,6.1.x](){
		${assertEquals} $(${getAppServerVersion} tomcat 6.1.x) 7.0.40
	}

	@test
	testGetAppServerVersion[tomcat,6.2.x](){
		${assertEquals} $(${getAppServerVersion} tomcat 6.2.x) 7.0.42
	}

	@test
	testGetAppServerVersion[tomcat,7.0.x](){
		${assertEquals} $(${getAppServerVersion} tomcat 7.0.x) 8.0.32
	}

	@test
	testGetAppServerVersion[tomcat,ee-6.1.x](){
		${assertEquals} $(${getAppServerVersion} tomcat ee-6.1.x) 7.0.40
	}

	@test
	testGetAppServerVersion[tomcat,ee-6.1.30](){
		${assertEquals} $(${getAppServerVersion} tomcat ee-6.1.30) 7.0.40
	}

	@test
	testGetAppServerVersion[tomcat,ee-6.2.10](){
		${assertEquals} $(${getAppServerVersion} tomcat ee-6.2.10) 7.0.42
	}

	@test
	testGetAppServerVersion[tomcat,ee-6.2.x](){
		${assertEquals} $(${getAppServerVersion} tomcat ee-6.2.x) 7.0.62
	}

	@test
	testGetAppServerVersion[tomcat,master](){
		${assertEquals} $(${getAppServerVersion} tomcat master) $(
			AppServerVersionConstants TOMCAT_VERSION)
	}

	@test
	testGetAppServerVersion[weblogic](){
		${assertEquals} $(${getAppServerVersion} weblogic) $(
			AppServerVersionConstants WEBLOGIC_VERSION)
	}

	@test
	testGetAppServerVersion[websphere](){
		${assertEquals} $(${getAppServerVersion} websphere) $(
			AppServerVersionConstants WEBSPHERE_VERSION)
	}

	@test
	testGetAppServerVersion[wildfly](){
		${assertEquals} $(${getAppServerVersion} wildfly) $(
			AppServerVersionConstants WILDFLY_VERSION)
	}

	@test
	testGetAppServerVersion[wildfly,7.0.x](){
		${assertEquals} $(${getAppServerVersion} wildfly 7.0.x) 10.0.0
	}

	@test
	testGetAppServerVersion[wildfly,master](){
		${assertEquals} $(${getAppServerVersion} wildfly master) $(
			AppServerVersionConstants WILDFLY_VERSION)
	}

	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"
	local getAppServerVersion="AppServerVersion getAppServerVersion"

	$@
}