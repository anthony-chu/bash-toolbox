include app.server.version.AppServerVersion
include app.server.version.constants.AppServerVersionConstants

include test.util.TestUtil

@class
AppServerVersionTest(){
	@test
	testReturnAppServerVersion[glassfish](){
		${assertEquals} $(${returnAppServerVersion} glassfish) $(
			AppServerVersionConstants glassfishVersion)
	}

	@test
	testReturnAppServerVersion[jboss](){
		${assertEquals} $(${returnAppServerVersion} jboss) $(
			AppServerVersionConstants jbossVersion)
	}

	@test
	testReturnAppServerVersion[jetty](){
		${assertEquals} $(${returnAppServerVersion} jetty) $(
			AppServerVersionConstants jettyVersion)
	}

	@test
	testReturnAppServerVersion[jonas](){
		${assertEquals} $(${returnAppServerVersion} jonas) $(
			AppServerVersionConstants jonasVersion)
	}

	@test
	testReturnAppServerVersion[null](){
		${assertNull} $(${returnAppServerVersion})
	}

	@test
	testReturnAppServerVersion[resin](){
		${assertEquals} $(${returnAppServerVersion} resin) $(
			AppServerVersionConstants resinVersion)
	}

	@test
	testReturnAppServerVersion[tcat](){
		${assertEquals} $(${returnAppServerVersion} tcat) $(
			AppServerVersionConstants tcatVersion)
	}

	@test
	testReturnAppServerVersion[tcserver](){
		${assertEquals} $(${returnAppServerVersion} tcserver) $(
			AppServerVersionConstants tcserverVersion)
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
		${assertEquals} $(${returnAppServerVersion} tomcat 7.0.x) $(
				AppServerVersionConstants tomcatVersion)
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
			AppServerVersionConstants tomcatVersion)
	}

	@test
	testReturnAppServerVersion[weblogic](){
		${assertEquals} $(${returnAppServerVersion} weblogic) $(
			AppServerVersionConstants weblogicVersion)
	}

	@test
	testReturnAppServerVersion[websphere](){
		${assertEquals} $(${returnAppServerVersion} websphere) $(
			AppServerVersionConstants websphereVersion)
	}

	@test
	testReturnAppServerVersion[wildfly](){
		${assertEquals} $(${returnAppServerVersion} wildfly) $(
			AppServerVersionConstants wildflyVersion)
	}

	local assertEquals="TestUtil assertEquals"
	local assertNull="TestUtil assertNull"
	local returnAppServerVersion="AppServerVersion returnAppServerVersion"

	$@
}