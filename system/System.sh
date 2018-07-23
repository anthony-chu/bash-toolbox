include logger.Logger

include string.validator.StringValidator

@class
System(){
	extendAntOpts(){
		if [[ $(StringValidator beginsWith 6 ${1}) ]]; then
			${_log} info "configuring_ANT_OPTS_JVM..."
			export ANT_OPTS="${ANT_OPTS} -XX:MaxPermSize=1024m"
			${_log} info "completed"
		fi
	}

	getOS(){
		uname
	}

	setJavaHome(){
		if [[ $(StringValidator beginsWith 6 ${1}) ]]; then
			${_log} info "configuring_Liferay_to_use_JDK7..."

			if [[ $(getOS) =~ NT ]]; then
				export JAVA_HOME="C:\Program Files\Java\jdk1.7.0_80"
			else
				export JAVA_HOME="/usr/java/jdk1.7.0_80"
			fi

			${_log} info "completed"
		fi
	}

	local _log="Logger log"

	$@
}