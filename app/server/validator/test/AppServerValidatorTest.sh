AppServerValidatorTest(){
	local packages=(
		app.server.validator.AppServerValidator

		test.executor.TestExecutor
		test.util.TestUtil
	)

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
		${assertTrue} $(AppServerValidator isGlassfish appServers)
	}

	testIsJboss(){
		${assertTrue} $(AppServerValidator isJboss appServers)
	}

	testIsJetty(){
		${assertTrue} $(AppServerValidator isJetty appServers)
	}

	testIsJonas(){
		${assertTrue} $(AppServerValidator isJonas appServers)
	}

	testIsResin(){
		${assertTrue} $(AppServerValidator isResin appServers)
	}

	testIsTcat(){
		${assertTrue} $(AppServerValidator isTcat appServers)
	}

	testIsTCserver(){
		${assertTrue} $(AppServerValidator isTCServer appServers)
	}

	testIsTomcat(){
		${assertTrue} $(AppServerValidator isTomcat appServers)
	}

	testIsWeblogic(){
		${assertTrue} $(AppServerValidator isWeblogic appServers)
	}

	testIsWebsphere(){
		${assertTrue} $(AppServerValidator isWebsphere appServers)
	}

	testIsWildfly(){
		${assertTrue} $(AppServerValidator isWildfly appServers)
	}

	local assertTrue="TestUtil assertTrue"

	include ${packages[@]}

	$@

	exclude ${packages[@]}
}