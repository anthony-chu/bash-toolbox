include app.server.version.constants.AppServerVersionConstants

@class
AppServerVersionOverride(){
	getJbossVersion(){
		if [[ ${version} =~ 7.0 ]]; then
			echo "eap-7.0.0"
		elif [[ ${version} =~ 6.2 ]]; then
			echo "eap-6.4.0"
		elif [[ ${version} =~ 6.1 ]]; then
			echo "eap-6.0.1"
		else
			AppServerVersionConstants JBOSS_VERSION
		fi
	}

	getTomcatVersion(){
		if [[ ${version} =~ 7.1.10 ]]; then
			echo 9.0.6
		elif [[ ${version} =~ 7.0.10 ]]; then
			echo 8.0.32
		elif [[ ${version} =~ 7.0) ]]; then
			echo 8.0.53
		elif [[ ${version} =~ 6.2.10 ]]; then
			echo 7.0.62
		elif [[ ${version} =~ 6.2 ]]; then
			echo 7.0.90
		elif [[ ${version} =~ 6.1 ]]; then
			echo 7.0.40
		elif [[ ${version} =~ 6.0.12 ]]; then
			echo 6.0.32
		elif [[ ${version} =~ 6.0.6 ]]; then
			echo 6.0.29
		else
			AppServerVersionConstants TOMCAT_VERSION
		fi
	}

	getWebsphereVersion(){
		if [[ ${version} =~ 7.0 ]]; then
			echo 8.5.5.0
		elif [[ ${version} =~ 7.1 || ${version} =~ master ]]; then

			AppServerVersionConstants WEBSPHERE_VERSION
		fi
	}

	getWildflyVersion(){
		if [[ ${version} =~ 7.0 ]]; then
			echo 10.0.0
		elif [[ ${version} =~ master || ${version} =~ 7.1 ]]; then
			AppServerVersionConstants WILDFLY_VERSION
		fi
	}

	local version=${2}

	$@
}