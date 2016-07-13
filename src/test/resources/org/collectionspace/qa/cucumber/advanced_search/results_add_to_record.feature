# Created by Cesar Villalobos on 01/07/2016

@advancedsearch @results_add_to_record
Feature: Advanced Search - Results Add to Record
    Adding search results to a group

    Scenario: Creating temporary records
        Given user is on a blank "Group" record
        And enters "CQA86.1" in the "Group" "Title" field
        And clicks the "Save" button

        And user is on a blank "Group" records
        And enters "CQA86.2" in the "Group" "Title" field
        And clicks the "Save" button

        And user is on a blank "Group" record
        And enters "CQA86.3" in the "Group" "Title" field
        And clicks the "Save" button
        And clicks the "Ok" button
        Then close the browser

    Scenario: Relate cataloging records to an existing Group record.
        # Given user is on the "Create New" page
        # And selects the "Group" radio button on the Create New page
        # Click create button
        Given user is on a blank "Group" record
        And enters "CQA-86 Group" in the "Group" "Title" field
        And clicks the "Save" button
        And clicks the "Ok" button

        And clicks the "Advanced Search" button
        And enters "CQA86" in the "AdvancedSearch" "search" field # // add to mappings in Adv Search
        Then the results should contain "CQA86.1"
        Then the results should contain "CQA86.2"
        Then the results should contain "CQA86.3"


        #The fields below are completely different from those in the advanced search page
        # So we need to check that the mappings also match up to these, and change necessary things.
        And clicks the "Add to Record" button
        And selects "Group" from the "AdvancedSearch" "record type" dropdown
        And enters "CQA-86 Group" in the "AdvancedSearch" "search" field
        And selects "CQA-86 Group" # Were are we selecting this from? Results? Fix.
        And clicks the "Add search results" button # Add mapping
        Then the message "Added 3 records to test group" should appear # Does a step def exist for this?
        Then close the browser

    #Overall: Should work with given step defs and the stuff that's already there given that we do this,
    # But need to make sure the mappings work!

    Scenario: View procedure record to see related records
        # Using seach or advanced search search for "CQA-86 Group"
        Given user is in the "Find and Edit" page
        And clicks the "Advanced Search" button
        And enters "CQA-86 Group" in the "AdvancedSearch" "search" field # add to mappings
        Then the results should contain "CQA-86"

        And clicks on result with text "CQA-86 Group"
        And selects the "Cataloging" tab #AHA! Make sure tabs are clickable too

        Then "120415.1" should appear in the "Cataloging" area #Why this?
        Then "120415.2" should appear in the "Cataloging" area #Why this?

        Then "CQA86.1" should appear in the "Related Cataloging Records" area #Also new functionality.
        Then "CQA86.2" should appear in the "Related Cataloging Records" area #Also new functionality.
        Then "CQA86.3" should appear in the "Related Cataloging Records" area #Also new functionality.
        And clicks on result with text "CQA86.1"
        And clicks the "Delete this relation." button
        Then "CQA86.1" should not appear in the "Related Cataloging Records" area #Same ^

    Scenario: Test Record Deletion
        And navigates to the record with identification number "CQA86.1"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button
        Then close the browser

        And navigates to the record with identification number "CQA86.2"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button
        Then close the browser

        And navigates to the record with identification number "CQA86.3"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button
        Then close the browser

        And navigates to the record with identification number "CQA-86 Group"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button
        Then close the browser

        # make sure deleting records before deleting their parent works!
