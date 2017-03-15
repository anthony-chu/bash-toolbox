include calendar.util.CalendarUtil

include logger.Logger

System(){
	extendAntOpts(){
		if [[ ${1} =~ 6. ]]; then
			Logger logProgressMsg "configuring_ANT_OPTS_JVM"
			export ANT_OPTS="${ANT_OPTS} -XX:MaxPermSize=1024m"
			Logger logCompletedMsg
		fi
	}

	getOS(){
		uname
	}

	setJavaHome(){
		if [[ ${1} =~ 6. ]]; then
			Logger logProgressMsg "configuring_Liferay_to_use_JDK7"
			export JAVA_HOME="C:\Program Files\Java\jdk1.7.0_80"
			Logger logCompletedMsg
		fi
	}

	$@
}