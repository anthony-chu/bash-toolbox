include system.System

include test.util.TestUtil

@class
SystemTest(){
	tearDown(){
		export ANT_OPTS=${ant_opts}
	}

	@test
	testExtendAntOpts[6.x](){
		nullify System setJavaHome ee-6.1.x

		nullify System extendAntOpts

		${assertContains} ANT_OPTS -XX:MaxPermSize=1024m
	}

	@test
	testExtendAntOpts[7.x](){
		nullify System extendAntOpts 7.x

		${assertDoesNotContain} ANT_OPTS -XX:MaxPermSize=1024m
	}

	local ant_opts=${ANT_OPTS}
	local assertContains="TestUtil assertContains"
	local assertDoesNotContain="TestUtil assertDoesNotContain"
	local java_home=${JAVA_HOME}

	$@

	tearDown
}