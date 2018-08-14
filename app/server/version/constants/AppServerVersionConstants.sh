include string.util.StringUtil

@class
AppServerVersionConstants(){
	GLASSFISH_VERSION(){
		echo "3.1.2.2"
	}

	JBOSS_VERSION(){
		echo "eap-7.0.0"
	}

	JETTY_VERSION(){
		echo "8.1.10"
	}

	JONAS_VERSION(){
		echo "5.2.3"
	}

	RESIN_VERSION(){
		echo "4.0.44"
	}

	TCAT_VERSION(){
		echo "7.0.2"
	}

	TCSERVER_VERSION(){
		echo "3.2.5"
	}

	TOMCAT_VERSION(){
		echo "9.0.10"
	}

	WEBLOGIC_VERSION(){
		echo "12.2.1"
	}

	WEBSPHERE_VERSION(){
		echo "9.0.0.0"
	}

	WILDFLY_VERSION(){
		echo "11.0.0"
	}

	if [[ ${1} == *Version ]]; then
		$(StringUtil toUpperCase ${1//Version/}_VERSION)

		shift
	fi

	$@
}