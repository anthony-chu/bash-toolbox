include array.validator.ArrayValidator

include string.validator.StringValidator

AppServerValidator(){
	getAppServers(){
		local appServers=(
			glassfish
			jboss
			jetty
			jonas
			resin
			tcat
			tcserver
			tomcat
			weblobic
			websphere
			wildfly
		)

		echo ${appServers[@]}
	}

	isGlassfish(){
		if [[ $(ArrayValidator hasEntry ${1} glassfish) ]]; then
			echo true
		fi
	}

	isJboss(){
		if [[ $(ArrayValidator hasEntry ${1} jboss) ]]; then
			echo true
		fi
	}

	isJetty(){
		if [[ $(ArrayValidator hasEntry ${1} jetty) ]]; then
			echo true
		fi
	}

	isJonas(){
		if [[ $(ArrayValidator hasEntry ${1} jonas) ]]; then
			echo true
		fi
	}

	isResin(){
		if [[ $(ArrayValidator hasEntry ${1} resin) ]]; then
			echo true
		fi
	}

	isTcat(){
		if [[ $(ArrayValidator hasEntry ${1} tcat) ]]; then
			echo true
		fi
	}

	isTCServer(){
		if [[ $(ArrayValidator hasEntry ${1} tc*server) ]]; then
			echo true
		fi
	}

	isTomcat(){
		if [[ $(ArrayValidator hasEntry ${1} tomcat) ]]; then
			echo true
		fi
	}

	isWeblogic(){
		if [[ $(ArrayValidator hasEntry ${1} weblogic) ]]; then
			echo true
		fi
	}

	isWebsphere(){
		if [[ $(ArrayValidator hasEntry ${1} websphere) ]]; then
			echo true
		fi
	}

	isWildfly(){
		if [[ $(ArrayValidator hasEntry ${1} wildfly) ]]; then
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
		for v in $(getAppServers); do
			if [[ $(ArrayValidator hasEntry ${1} ${v}) ]]; then
				echo ${v}
				break
			fi
		done
	}

	$@
}