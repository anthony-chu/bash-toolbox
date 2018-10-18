include logger.Logger

@class
System(){
	extendAntOpts(){
		if [[ ${JAVA_HOME} =~ 1.7 ]]; then
			${_log} info "configuring_ANT_OPTS_JVM..."
			export ANT_OPTS="${ANT_OPTS} -XX:MaxPermSize=1024m"
			${_log} info "completed"
		fi
	}

	getOS(){
		uname
	}

	setJavaHome(){
		local version=${1}

		if [[ ${version} =~ 6.1 ]]; then
			${_log} info "configuring_Liferay_to_use_JDK7..."

			if [[ $(getOS) =~ NT ]]; then
				export JAVA_HOME="C:\Program Files\Java\jdk1.7.0_80"
			else
				export JAVA_HOME="/usr/java/jdk1.7.0_80"
			fi

			export PATH="${JAVA_HOME}:${JAVA_HOME}/bin:${PATH}"

			${_log} info "completed"
		fi
	}

	local _log="Logger log"

	$@
}