include logger.Logger

include string.validator.StringValidator

@class
System(){
	extendAntOpts(){
		if [[ $(StringValidator beginsWith 6 ${1}) ]]; then
			Logger logProgressMsg "configuring_ANT_OPTS_JVM"
			export ANT_OPTS="${ANT_OPTS} -XX:MaxPermSize=1024m"
			Logger logCompletedMsg
		fi
	}

	getOS(){
		uname
	}

	setJavaHome(){
		if [[ $(StringValidator beginsWith 6 ${1}) ]]; then
			Logger logProgressMsg "configuring_Liferay_to_use_JDK7"

			if [[ $(getOS) =~ NT ]]; then
				export JAVA_HOME="C:\Program Files\Java\jdk1.7.0_80"
			else
				export JAVA_HOME="/usr/java/jdk1.7.0_80"
			fi

			Logger logCompletedMsg
		fi
	}

	$@
}