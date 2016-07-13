# Created by Cesar Villalobos on 01/07/2016
# Working as of June 1 2016

@advancedsearch @exhibition_planning
Feature: Advanced Search ­– Exhibition Planning
        Searching for records based on certain criteria on the advanced search page

    Scenario: Advanced Search Fields
        # Given user is on the "Create New" page
        # And selects the "Exhibition" radio button on the Create New page
        # Click confirm
        Given user is on a blank "Exhibition" record
        And enters "CQA74.1" in the "Exhibition" "Exhibition Number" field
        And enters "CQA74 Test" in the "Exhibition" "Exhibition Title" field
        And selects "Permanent" from the "Exhibition" "Exhibition Type" dropdown
        And enters "CQA74 Venue" in the "Exhibition" "Venue" autocomplete field
        # And selects "CQA74 Venue" from autocomplete options
        And enters "2016-01-01" in the "Exhibition" "Venue Opening Date" field
        And enters "textbook" in the "Exhibition" "Planning Notes" field
        And clicks the "Save" button

        # Record Title
        And clicks the "Advanced Search" button
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And enters "CQA74 Test" in the "Exhibition" "Exhibition Title" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.1"

        # Record ID number
        And clicks the "Advanced Search" button
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And enters "CQA74.1" in the "Exhibition" "Exhibition Number" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.1"

        # Exhibition Type
        And clicks the "Advanced Search" button
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And selects "Permanent" from the "Exhibition" "Exhibition Type" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.1"

        # Venue
        And clicks the "Advanced Search" button
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And enters "CQA74 Venue" in the "Exhibition" "Venues" autocomplete field
        # And selects "CQA74 Venue" from autocomplete options
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.1"

        # Venue
        And clicks the "Advanced Search" button
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And enters "2016-01-01" in the "Exhibition" "Earliest Venue Opening Date" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.1"

        #Earliest Modified
        And clicks the "Advanced Search" button
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And enters today's date in the "AdvancedSearch" "Earliest Modified Date" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.1"

        #Earliest Modified
        And clicks the "Advanced Search" button
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And enters "admin@core.collectionspace.org" in the "Exhibition" "Record last modified by" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.1"

        Then close the browser

    Scenario: Boolean field­-based search
        # Given user is on the "Create New" page
        # And selects the "Exhibition" radio button on the Create New page
        Given user is on a blank "Exhibition" record
        And enters "CQA74.2" in the "Exhibition" "Exhibition Number" field
        And selects "Permanent" from the "Exhibition" "Exhibition Type" dropdown
        And enters "Globex Corporation" in the "Exhibition" "Sponsor" autocomplete field
        # And selects "Globex Corporation" from autocomplete options
        And enters "testtest" in the "Exhibition" "Boilerplate Text" field
        And clicks the "Save" button

        # And navigates to the "Create New" page
        # And selects the "Exhibition" radio button on the Create New page
        And user is on a blank "Exhibition" record
        And enters "CQA74.3" in the "Exhibition" "Exhibition Number" field
        And selects "Permanent" from the "Exhibition" "Exhibition Type" dropdown
        And enters "Globex Corporation" in the "Exhibition" "Sponsor" autocomplete field
        # And selects "Globex Corporation" from autocomplete options
        And enters "testtest" in the "Exhibition" "Planning Notes" field
        And clicks the "Save" button
        #
        # And navigates to the "Create New" page
        # And selects the "Exhibition" radio button on the Create New page
        And user is on a blank "Exhibition" record
        And enters "CQA74.4" in the "Exhibition" "Exhibition Number" field
        And selects "Permanent" from the "Exhibition" "Exhibition Type" dropdown
        And enters "Osato Chemicals" in the "Exhibition" "Sponsor" autocomplete field
        # And selects "Osato Chemicals" from autocomplete options
        And enters "testtest" in the "Exhibition" "Curatorial Notes" field
        And clicks the "Save" button

        And clicks the "Advanced Search" button
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And enters "Globex Corporation" in the "Exhibition" "Sponsor Search" autocomplete field
        # And selects "Globex Corporation" from autocomplete options
        And selects "Permanent" from the "Exhibition" "Exhibition Type" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.2"
        Then the search results should contain "CQA74.3"
        Then the search results should contain "CQA74.4"


        And clicks the "Advanced Search" button
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
        And selects "Permanent" from the "Exhibition" "Exhibition Type" dropdown
        And enters "Globex Corporation" in the "Exhibition" "Sponsor Search" autocomplete field
        # And selects "Globex Corporation" from autocomplete options
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.2"
        Then the search results should contain "CQA74.3"
        Then the search results should not contain "CQA74.4"

        Then close the browser


    Scenario: Boolean and Keyword Search
        Given user is on the "My CollectionSpace" page
        And clicks the "Advanced Search" button
        And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And enters "Globex Corporation" in the "Exhibition" "Sponsor Search" autocomplete field
        And selects "Permanent" from the "Exhibition" "Exhibition Type" dropdown
        # And selects "Globex Corporation" from autocomplete options
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.2"
        Then the search results should contain "CQA74.3"
        Then the search results should contain "CQA74.4"

        And clicks the "Advanced Search" button
        And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
        And selects "Exhibition" from the "AdvancedSearch" "record type" dropdown
        And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
        And enters "Globex Corporation" in the "Exhibition" "Sponsor Search" autocomplete field
        # And selects "Globex Corporation" from autocomplete options
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA74.2"
        Then the search results should contain "CQA74.3"
        Then the search results should not contain "CQA74.4"
        Then close the browser

    Scenario: Record Deletion
        Given user is on the "My CollectionSpace" page
        And navigates to the record with identification number "CQA74.1"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Exhibition" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA74.2"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Exhibition" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA74.3"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Exhibition" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA74.4"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Exhibition" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button
        Then close the browser
