include array.util.ArrayUtil

include string.util.StringUtil

HelpMessage(){
	_printHelpMessage(){
		local funcList=($(ArrayUtil appendArrayEntry ${1}))
		local helpList=($(ArrayUtil import ${2}))

		echo "Commands:"
		for (( i=0; i<${#funcList[@]}; i++ )); do
			local helpMessage=$(StringUtil capitalize ${helpList[i]})

			local helpListEntry=$(StringUtil parseMessage helpMessage)

			echo -e "\t${funcList[i]}................${helpListEntry}"
		done
	}

	branchHelpMessage(){
		local funcList=(
			changes
			current
			delete
			dev
			jira
			list
			log
			new
			rebase
			rename
			reset
			switch
		)

		local helpList=(
			displays_all_changes_made_to_the_current_branch
			displays_the_current_branch
			deletes_the_branch
			fetches_a_developer\'s_branch
			prints_a_formatted_jira_message
			displays_all_local_branches
			shows_the_log_for_the_current_branch
			creates_and_switches_to_a_new_branch
			provides_options_for_interactive_rebase
			renames_the_current_branch
			restores_source_to_designated_commit
			changes_to_a_different_local_branch
		)

		_printHelpMessage funcList helpList
	}

	buildHelpMessage(){
		local funcList=(
			build
			clean
			pull
			push
			run
		)

		local helpList=(
			builds_bundle_on_specified_app_server
			rebuilds_database_and_prepares_bundle
			pulls_from_upstream_master
			pushes_current_branch_to_origin
			runs_a_bundle_on_specified_app_server
		)

		_printHelpMessage funcList helpList
	}

	buildTestHelpMessage(){
		local funcList=(run-unit-tests)

		local helpList=(runs_all_unit_tests_in_/test_directory)

		_printHelpMessage funcList helpList
	}

	formatHelpMessage(){
		local funcList=([empty])

		local helpList=(validates_all_script_files_using_formatting_rules)

		_printHelpMessage funcList helpList
	}

	testHelpMessage(){
		local funcList=(
			pr
			sf
			validate
			test
		)

		local helpList=(
			submits_a_pull_request
			formats_source_files
			runs_poshi_validation
			executes_a_frontend_test
		)

		_printHelpMessage funcList helpList
	}

	$@
}