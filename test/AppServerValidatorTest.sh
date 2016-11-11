include app.server.validator.AppServerValidator
include test.executor.TestExecutor

AppServerValidatorTest(){
	run(){
		local tests=(
			isGlassfish
			isJboss
			isJetty
			isJonas
			isResin
			isTcat
			isTCserver
			isTomcat
			isWeblogic
			isWebsphere
			isWildfly
		)

		TestExecutor executeTest AppServerValidatorTest ${tests[@]}
	}

	testIsGlassfish(){
		if [[ $(AppServerValidator isGlassfish glassfish) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsJboss(){
		if [[ $(AppServerValidator isJboss jboss) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsJetty(){
		if [[ $(AppServerValidator isJetty jetty) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsJonas(){
		if [[ $(AppServerValidator isJonas jonas) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsResin(){
		if [[ $(AppServerValidator isResin resin) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsTcat(){
		if [[ $(AppServerValidator isTcat tcat) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsTCserver(){
		if [[ $(AppServerValidator isTCServer tc-server) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsTomcat(){
		if [[ $(AppServerValidator isTomcat tomcat) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsWeblogic(){
		if [[ $(AppServerValidator isWeblogic weblogic) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsWebsphere(){
		if [[ $(AppServerValidator isWebsphere websphere) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	testIsWildfly(){
		if [[ $(AppServerValidator isWildfly wildfly) ]]; then
			echo PASS
		else
			echo FAIL
		fi
	}

	$@
}