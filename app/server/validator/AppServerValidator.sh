include array.validator.ArrayValidator
include string.validator.StringValidator

AppServerValidator(){
	isGlassfish(){
		if [[ $(ArrayValidator hasEntry ${@} glassfish) ]]; then
			echo true
		fi
	}

	isJboss(){
		if [[ $(ArrayValidator hasEntry ${@} jboss) ]]; then
			echo true
		fi
	}

	isJetty(){
		if [[ $(ArrayValidator hasEntry ${@} jetty) ]]; then
			echo true
		fi
	}

	isJonas(){
		if [[ $(ArrayValidator hasEntry ${@} jonas) ]]; then
			echo true
		fi
	}

	isResin(){
		if [[ $(ArrayValidator hasEntry ${@} resin) ]]; then
			echo true
		fi
	}

	isTcat(){
		if [[ $(ArrayValidator hasEntry ${@} tcat) ]]; then
			echo true
		fi
	}

	isTCServer(){
		if [[ $(ArrayValidator hasEntry ${@} tc*server) ]]; then
			echo true
		fi
	}

	isTomcat(){
		if [[ $(ArrayValidator hasEntry ${@} tomcat) ]]; then
			echo true
		fi
	}

	isWeblogic(){
		if [[ $(ArrayValidator hasEntry ${@} weblogic) ]]; then
			echo true
		fi
	}

	isWebsphere(){
		if [[ $(ArrayValidator hasEntry ${@} websphere) ]]; then
			echo true
		fi
	}

	isWildfly(){
		if [[ $(ArrayValidator hasEntry ${@} wildfly) ]]; then
			echo true
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
		local validAppServer=(
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