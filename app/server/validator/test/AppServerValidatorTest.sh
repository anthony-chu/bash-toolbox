include app.server.validator.AppServerValidator

include test.executor.TestExecutor
include test.util.TestUtil

AppServerValidatorTest(){
	run(){
		TestExecutor executeTest app.server.validator.test
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
		${asserTrue} $(AppServerValidator isJonas appServers)
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

	$@
}