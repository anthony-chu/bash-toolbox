include app.server.validator.AppServerValidator

include test.executor.TestExecutor

AppServerValidatorTest(){
	run(){
		TestExecutor executeTest AppServerValidatorTest
	}

	local appServers=(
		glassfish
		jboss
		jetty
		jonas
		resin
		tcat
		tc-server
		tomcat
		weblogic
		websphere
		wildfly
	)

	testIsGlassfish(){
		if [[ $(AppServerValidator isGlassfish appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsJboss(){
		if [[ $(AppServerValidator isJboss appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsJetty(){
		if [[ $(AppServerValidator isJetty appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsJonas(){
		if [[ $(AppServerValidator isJonas appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsResin(){
		if [[ $(AppServerValidator isResin appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsTcat(){
		if [[ $(AppServerValidator isTcat appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsTCserver(){
		if [[ $(AppServerValidator isTCServer appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsTomcat(){
		if [[ $(AppServerValidator isTomcat appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsWeblogic(){
		if [[ $(AppServerValidator isWeblogic appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsWebsphere(){
		if [[ $(AppServerValidator isWebsphere appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsWildfly(){
		if [[ $(AppServerValidator isWildfly appServers) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	$@
}