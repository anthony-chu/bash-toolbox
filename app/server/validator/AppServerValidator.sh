include array.validator.ArrayValidator
include string.validator.StringValidator

AppServerValidator(){
	isGlassfish(){
		if [[ $(ArrayValidator hasEntry ${@} glassfish) ]]; then
			echo true
		else
			return;
		fi
	}

	isJboss(){
		if [[ $(ArrayValidator hasEntry ${@} jboss) ]]; then
			echo true
		else
			return;
		fi
	}

	isJetty(){
		if [[ $(ArrayValidator hasEntry ${@} jetty) ]]; then
			echo true
		else
			return;
		fi
	}

	isJonas(){
		if [[ $(ArrayValidator hasEntry ${@} jonas) ]]; then
			echo true
		else
			return;
		fi
	}

	isResin(){
		if [[ $(ArrayValidator hasEntry ${@} resin) ]]; then
			echo true
		else
			return;
		fi
	}

	isTcat(){
		if [[ $(ArrayValidator hasEntry ${@} tcat) ]]; then
			echo true
		else
			return;
		fi
	}

	isTCServer(){
		if [[ $(ArrayValidator hasEntry ${@} tc*server) ]]; then
			echo true
		else
			return;
		fi
	}

	isTomcat(){
		if [[ $(ArrayValidator hasEntry ${@} tomcat) ]]; then
			echo true
		else
			return;
		fi
	}

	isWeblogic(){
		if [[ $(ArrayValidator hasEntry ${@} weblogic) ]]; then
			echo true
		else
			return;
		fi
	}

	isWebsphere(){
		if [[ $(ArrayValidator hasEntry ${@} websphere) ]]; then
			echo true
		else
			return;
		fi
	}

	isWildfly(){
		if [[ $(ArrayValidator hasEntry ${@} wildfly) ]]; then
			echo true
		else
			return;
		fi
	}

	returnAppServer(){
		local SV=StringValidator

		if [[ $(${SV} isNull $@) ]]; then
			echo tomcat
		else
			if [[ $(validateAppServer $@) ]]; then
				validateAppServer ${@}
			else
				echo tomcat
				exit
			fi
		fi
	}

	validateAppServer(){
		validAppServer=(
			glassfish
			jetty
			jboss
			jonas
			resin
			tcat
			tc-server
			tomcat
			weblogic
			websphere
			wildfly
		)

		for v in ${validAppServer[@]}; do
			if [[ $(ArrayValidator hasEntry ${@} ${v}) ]]; then
				echo ${v}
				break
			fi
		done
	}

	$@
}