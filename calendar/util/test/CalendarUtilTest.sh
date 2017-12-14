include calendar.util.CalendarUtil

include test.executor.TestExecutor
include test.util.TestUtil

@class
CalendarUtilTest(){
	run(){
		TestExecutor executeTest CalendarUtilTest
	}

	@test
	testReturnYesterdayTimestampGetLeapYear(){
		local prev_timestamp=20160229
		local this_timestamp=20160301

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	@test
	testReturnYesterdayTimestampGetPreviousDayBothLeadingZero(){
		local prev_timestamp=20170901
		local this_timestamp=20170902

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	@test
	testReturnYesterdayTimestampGetPreviousDayNoLeadingZero(){
		local prev_timestamp=20170911
		local this_timestamp=20170912

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	@test
	testReturnYesterdayTimestampGetPreviousDayThisLeadingZero(){
		local prev_timestamp=20170909
		local this_timestamp=20170910

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	@test
	testReturnYesterdayTimestampGetPreviousMonthBothLeadingZero(){
		local prev_timestamp=20170831
		local this_timestamp=20170901

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	@test
	testReturnYesterdayTimestampGetPreviousMonthNoLeadingZero(){
		local prev_timestamp=20170731
		local this_timestamp=20170801

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	@test
	testReturnYesterdayTimestampGetPreviousMonthPreviousLeadingZero(){
		local prev_timestamp=20170930
		local this_timestamp=20171001

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	@test
	testReturnYesterdayTimestampGetPreviousYear(){
		local prev_timestamp=20161231
		local this_timestamp=20170101

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	@test
	testReturnYesterdayTimestampIgnoreLeapYear(){
		local prev_timestamp=20170228
		local this_timestamp=20170301

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	local assertEquals="TestUtil assertEquals"

	$@
}