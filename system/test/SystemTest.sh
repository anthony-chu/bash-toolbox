include system.System

include test.executor.TestExecutor
include test.util.TestUtil

SystemTest(){
	run(){
		TestExecutor executeTest SystemTest
	}

	tearDown(){
		export ANT_OPTS=${ant_opts}
	}

	testExtendAntOpts[6.x](){
		System extendAntOpts 6.x > /dev/null

		${assertContains} ANT_OPTS -XX:MaxPermSize=1024m
	}

	testExtendAntOpts[7.x](){
		System extendAntOpts 7.x > /dev/null

		${assertDoesNotContain} ANT_OPTS -XX:MaxPermSize=1024m
	}

	local ant_opts=${ANT_OPTS}
	local assertContains="TestUtil assertContains"
	local assertDoesNotContain="TestUtil assertDoesNotContain"
	local java_home=${JAVA_HOME}

	$@

	tearDown
}