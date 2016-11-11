include app.server.version.AppServerVersion
include app.server.version.constants.AppServerVersionConstants
include test.executor.TestExecutor

AppServerVersionTest(){
	run(){
		local tests=(
			_overrideTomcatVersion[6.1.x]
			_overrideTomcatVersion[ee-6.2.10]
			_overrideTomcatVersion[6.2.x]
			_overrideTomcatVersion[null]
			returnAppServerVersion[glassfish]
			returnAppServerVersion[jboss]
			returnAppServerVersion[jetty]
			returnAppServerVersion[jonas]
			returnAppServerVersion[null]
			returnAppServerVersion[resin]
			returnAppServerVersion[tcat]
			returnAppServerVersion[tcserver]
			returnAppServerVersion[tomcat,6.1.x]
			returnAppServerVersion[tomcat,6.2.x]
			returnAppServerVersion[tomcat,7.0.x]
			returnAppServerVersion[tomcat,ee-6.1.x]
			returnAppServerVersion[tomcat,ee-6.2.10]
			returnAppServerVersion[tomcat,ee-6.2.x]
			returnAppServerVersion[tomcat,ee-7.0.x]
			returnAppServerVersion[tomcat,master]
			returnAppServerVersion[weblogic]
			returnAppServerVersion[websphere]
			returnAppServerVersion[wildfly]
		)

		TestExecutor executeTest AppServerVersionTest ${tests[@]}
	}

	test_overrideTomcatVersion[6.1.x](){
		if [[ $(AppServerVersion
			_overrideTomcatVersion 6.1.x) == 7.0.40 ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	test_overrideTomcatVersion[6.2.x](){
		if [[ $(AppServerVersion
			_overrideTomcatVersion 6.2.x) == 7.0.62 ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	test_overrideTomcatVersion[ee-6.2.10](){
		if [[ $(AppServerVersion
			_overrideTomcatVersion ee-6.2.10) == 7.0.42 ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	test_overrideTomcatVersion[null](){
		if [[ $(AppServerVersion _overrideTomcatVersion) == 8.0.32 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[glassfish](){
		if [[ $(AppServerVersion returnAppServerVersion glassfish) == $(
			AppServerVersionConstants glassfishVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[jboss](){
		if [[ $(AppServerVersion returnAppServerVersion jboss) == $(
			AppServerVersionConstants jbossVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[jetty](){
		if [[ $(AppServerVersion returnAppServerVersion jetty) == $(
			AppServerVersionConstants jettyVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[jonas](){
		if [[ $(AppServerVersion returnAppServerVersion jonas) == $(
			AppServerVersionConstants jonasVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[null](){
		if [[ ! $(AppServerVersion returnAppServerVersion) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[resin](){
		if [[ $(AppServerVersion returnAppServerVersion resin) == $(
			AppServerVersionConstants resinVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[tcat](){
		if [[ $(AppServerVersion returnAppServerVersion tcat) == $(
			AppServerVersionConstants tcatVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[tcserver](){
		if [[ $(AppServerVersion returnAppServerVersion tcserver) == $(
			AppServerVersionConstants tcserverVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[tomcat,6.1.x](){
		if [[ $(AppServerVersion
			returnAppServerVersion tomcat 6.1.x) == 7.0.40 ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[tomcat,6.2.x](){
		if [[ $(AppServerVersion
			returnAppServerVersion tomcat 6.2.x) == 7.0.62 ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[tomcat,7.0.x](){
		if [[ $(AppServerVersion returnAppServerVersion tomcat 7.0.x) == $(
			AppServerVersionConstants tomcatVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[tomcat,ee-6.1.x](){
		if [[ $(AppServerVersion
			returnAppServerVersion tomcat ee-6.1.x) == 7.0.40 ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[tomcat,ee-6.2.10](){
		if [[ $(AppServerVersion
			returnAppServerVersion tomcat ee-6.2.10) == 7.0.42 ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[tomcat,ee-6.2.x](){
		if [[ $(AppServerVersion
			returnAppServerVersion tomcat ee-6.2.x) == 7.0.62 ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[tomcat,ee-7.0.x](){
		if [[ $(AppServerVersion returnAppServerVersion tomcat ee-7.0.x) == $(
			AppServerVersionConstants tomcatVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[tomcat,master](){
		if [[ $(AppServerVersion returnAppServerVersion tomcat master) == $(
			AppServerVersionConstants tomcatVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[weblogic](){
		if [[ $(AppServerVersion returnAppServerVersion weblogic) == $(
			AppServerVersionConstants weblogicVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[websphere](){
		if [[ $(AppServerVersion returnAppServerVersion websphere) == $(
			AppServerVersionConstants websphereVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	testReturnAppServerVersion[wildfly](){
		if [[ $(AppServerVersion returnAppServerVersion wildfly) == $(
			AppServerVersionConstants wildflyVersion) ]]; then

			echo PASS
		else
			echo FAIL
		fi
	}

	$@
}