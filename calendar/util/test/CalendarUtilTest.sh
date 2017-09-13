include calendar.util.CalendarUtil

include test.executor.TestExecutor
include test.util.TestUtil

CalendarUtilTest(){
	run(){
		TestExecutor executeTest CalendarUtilTest
	}

	testReturnYesterdayTimestampGetLeapYear(){
		local prev_timestamp=20160229
		local this_timestamp=20160301

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	testReturnYesterdayTimestampGetPreviousDayBothLeadingZero(){
		local prev_timestamp=20170901
		local this_timestamp=20170902

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	testReturnYesterdayTimestampGetPreviousDayNoLeadingZero(){
		local prev_timestamp=20170911
		local this_timestamp=20170912

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	testReturnYesterdayTimestampGetPreviousDayThisLeadingZero(){
		local prev_timestamp=20170909
		local this_timestamp=20170910

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	testReturnYesterdayTimestampGetPreviousMonthBothLeadingZero(){
		local prev_timestamp=20170831
		local this_timestamp=20170901

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	testReturnYesterdayTimestampGetPreviousMonthNoLeadingZero(){
		local prev_timestamp=20170731
		local this_timestamp=20170801

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	testReturnYesterdayTimestampGetPreviousMonthPreviousLeadingZero(){
		local prev_timestamp=20170930
		local this_timestamp=20171001

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	testReturnYesterdayTimestampGetPreviousYear(){
		local prev_timestamp=20161231
		local this_timestamp=20170101

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	testReturnYesterdayTimestampIgnoreLeapYear(){
		local prev_timestamp=20170228
		local this_timestamp=20170301

		${assertEquals} $(CalendarUtil
			returnYesterdayTimestamp ${this_timestamp}) ${prev_timestamp}
	}

	local assertEquals="TestUtil assertEquals"

	$@
}