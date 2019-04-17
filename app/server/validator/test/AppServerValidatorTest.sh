include app.server.validator.AppServerValidator

include test.util.TestUtil

@class
AppServerValidatorTest(){
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

	@test
	testIsGlassfish(){
		${assertTrue} $(AppServerValidator isGlassfish appServers)
	}

	@test
	testIsJboss(){
		${assertTrue} $(AppServerValidator isJboss appServers)
	}

	@test
	testIsJetty(){
		${assertTrue} $(AppServerValidator isJetty appServers)
	}

	@test
	testIsJonas(){
		${assertTrue} $(AppServerValidator isJonas appServers)
	}

	@test
	testIsResin(){
		${assertTrue} $(AppServerValidator isResin appServers)
	}

	@test
	testIsTcat(){
		${assertTrue} $(AppServerValidator isTcat appServers)
	}

	@deprecated
	@test
	testIsTCserver(){
		${assertTrue} $(AppServerValidator isTCServer appServers)
	}

	@test
	testIsTomcat(){
		${assertTrue} $(AppServerValidator isTomcat appServers)
	}

	@test
	testIsWeblogic(){
		${assertTrue} $(AppServerValidator isWeblogic appServers)
	}

	@test
	testIsWebsphere(){
		${assertTrue} $(AppServerValidator isWebsphere appServers)
	}

	@test
	testIsWildfly(){
		${assertTrue} $(AppServerValidator isWildfly appServers)
	}

	local assertTrue="TestUtil assertTrue"

	$@
}