# Created by Cesar Villalobos on 01/07/2016
# Working as of May 31st 2016

@advancedsearch @condition_check
Feature: Advanced Search - Condition Check
	Creating a Condition Check record and searching for it based on various terms

    Scenario: Advanced Search Fields
	    # Given user is on the "Create New" page
        # And selects the "Condition Check" radio button on the Create New page
        Given user is on a blank "Condition Check" record
        And enters "CQA73.1" in the "Condition Check" "Condition Check/Assessment Reference Number" field
        And selects "Low" from the "Condition Check" "Object Audit Category" dropdown
        And selects "Needs no work" from the "Condition Check" "Condition" dropdown
        And selects "Low" from the "Condition Check" "Conservation Treatment Priority" dropdown
        And enters "2016-01-01" in the "Condition Check" "Next Condition Check/Assessment Date" field
        And enters "2016-02-02" in the "Condition Check" "Condition Check/Assessment Date" field
		And enters "textbook" in the "Condition Check" "Condition Check/Assessment Note" field
        And clicks the "Save" button

        # "Condition Check"

        And clicks the "Advanced Search" button
        And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And enters "CQA73.1" in the "Condition Check" "Condition Check/Assessment Reference Number" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.1"

		# Object Audit Category
        And clicks the "Advanced Search" button
        And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And selects "Low" from the "Condition Check" "Object Audit Category" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.1"

		# Condition
        And clicks the "Advanced Search" button
        And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And selects "Needs no work" from the "Condition Check" "Condition" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.1"

		# Conservation Treatment Priority
        And clicks the "Advanced Search" button
        And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And selects "Low" from the "Condition Check" "Object Audit Category" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.1"

		# Next Condition Check/Assessment Date
        And clicks the "Advanced Search" button
        And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And enters "2016-01-01" in the "Condition Check" "Earliest Next Condition Check/Assessment Date" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.1"

		# Condition Check/Assessment Date
        And clicks the "Advanced Search" button
        And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And enters "2016-02-02" in the "Condition Check" "Earliest Condition Check/Assessment Date" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.1"

		# Last edited
        And clicks the "Advanced Search" button
        And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And enters today's date in the "AdvancedSearch" "Earliest Modified Date" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.1"

        And clicks the "Advanced Search" button
        And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And enters "admin@core.collectionspace.org" in the "AdvancedSearch" "Record last modified by" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.1"

	    Then close the browser

	Scenario: Boolean field­-based search
        # Given user is on the "Create New" page
        # And selects the "Condition Check" radio button on the Create New page
        Given user is on a blank "Condition Check" record
        And enters "CQA73.2" in the "Condition Check" "Condition Check/Assessment Reference Number" field
        And selects "Low" from the "Condition Check" "Object Audit Category" dropdown
        And selects "Needs no work" from the "Condition Check" "Condition" dropdown
        And enters "testtest" in the "Condition Check" "Condition Check/Assessment Note" field
        And clicks the "Save" button

        # And navigates to the "Create New" page
 	    # And selects the "Condition Check" radio button on the Create New page
        Given user is on a blank "Condition Check" record
        And enters "CQA73.3" in the "Condition Check" "Condition Check/Assessment Reference Number" field
        And selects "Low" from the "Condition Check" "Object Audit Category" dropdown
        And selects "Needs no work" from the "Condition Check" "Condition" dropdown
        And enters "testtest" in the "Condition Check" "Display Recommendations" field
        And clicks the "Save" button

        # And navigates to the "Create New" page
 	    # And selects the "Condition Check" radio button on the Create New page
        Given user is on a blank "Condition Check" record
        And enters "CQA73.4" in the "Condition Check" "Condition Check/Assessment Reference Number" field
        And selects "Low" from the "Condition Check" "Object Audit Category" dropdown
        And selects "In jeopardy" from the "Condition Check" "Condition" dropdown
        And enters "testtest" in the "Condition Check" "Handling Recommendations" field
        And clicks the "Save" button

        And clicks the "Advanced Search" button
        And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown

        And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
        And selects "Low" from the "Condition Check" "Object Audit Category" dropdown
        And selects "Needs no work" from the "Condition Check" "Condition" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.2"
        Then the search results should contain "CQA73.3"
        Then the search results should contain "CQA73.4"

        And clicks the "Advanced Search" button
        And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
        And selects "Low" from the "Condition Check" "Object Audit Category" dropdown
        And selects "Needs no work" from the "Condition Check" "Condition" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.2"
        Then the search results should contain "CQA73.3"
        Then the search results should not contain "CQA73.4"
        Then close the browser

	Scenario: Boolean and Keyword Search
        Given user is on the "My CollectionSpace" page
        And clicks the "Advanced Search" button
        # Press the confirm button
        # Given user is on a blank "Condition Check" record
		And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
        And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
        And selects "Low" from the "Condition Check" "Object Audit Category" dropdown
        And selects "Needs no work" from the "Condition Check" "Condition" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.2"
        Then the search results should contain "CQA73.3"
        Then the search results should contain "CQA73.4"

        And clicks the "Advanced Search" button
		And selects "Condition Check" from the "AdvancedSearch" "record type" dropdown
        And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
        And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
        And selects "Low" from the "Condition Check" "Object Audit Category" dropdown
        And selects "Needs no work" from the "Condition Check" "Condition" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA73.2"
        Then the search results should contain "CQA73.3"
        Then the search results should not contain "CQA73.4"
        Then close the browser

    Scenario: Record deletion
		Given user is on the "My CollectionSpace" page
        And navigates to the record with identification number "CQA73.1"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Condition Check" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA73.2"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Condition Check" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA73.3"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Condition Check" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA73.4"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Condition Check" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        Then close the browser
