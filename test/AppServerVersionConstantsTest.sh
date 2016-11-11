include app.server.version.constants.AppServerVersionConstants
include test.executor.Testexecutor

AppServerVersionConstantsTest(){
	run(){
		local tests=(
			glassfishVersion
			jettyVersion
			jbossVersion
			jonasVersion
			resinVersion
			tcatVersion
			tcserverVersion
			tomcatVersion
			weblogicVersion
			websphereVersion
			wildflyVersion
		)

		TestExecutor executeTest AppServerVersionConstantsTest ${tests[@]}
	}

	testGlassfishVersion(){
		if [[ $(AppServerVersionConstants glassfishVersion) == 3.1.2.2 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testJbossVersion(){
		if [[ $(AppServerVersionConstants jbossVersion) == eap-7.0.0 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testJettyVersion(){
		if [[ $(AppServerVersionConstants jettyVersion) == 8.1.10 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testJonasVersion(){
		if [[ $(AppServerVersionConstants jonasVersion) == 5.2.3 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testResinVersion(){
		if [[ $(AppServerVersionConstants resinVersion) == 4.0.44 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testTcatVersion(){
		if [[ $(AppServerVersionConstants tcatVersion) == 7.0.2 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testTcserverVersion(){
		if [[ $(AppServerVersionConstants tcserverVersion) == 3.1.2 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testTomcatVersion(){
		if [[ $(AppServerVersionConstants tomcatVersion) == 8.0.32 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testWeblogicVersion(){
		if [[ $(AppServerVersionConstants weblogicVersion) == 12.2.1 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testWebsphereVersion(){
		if [[ $(AppServerVersionConstants websphereVersion) == 8.5.5.0 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testWildflyVersion(){
		if [[ $(AppServerVersionConstants wildflyVersion) == 10.0.0 ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	$@
}