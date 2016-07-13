# Created by Regina Xu on 2/26/16

@advancedsearch @advanced_keyword_search
Feature: Advanced Keyword Search
    Scenario: Looking for 'Sesame' with a Cataloging record
        # Given user is on the "My CollectionSpace" page
        # And clicks the cataloging button
        # And clicks confirm button
        Given user is on a blank "Cataloging" record
        And enters "CQA___.1" in the "Cataloging" "Identification Number" field
        And enters "sesame" in the "Cataloging" "Brief Description" field
        And clicks the "Save" button

        And user is on a blank "Cataloging" record
        And enters "CQA___.2" in the "Cataloging" "Identification Number" field
        And enters "sesame" in the "Cataloging" "Distinguishing Features" field
        And clicks the "Save" button

        And user is on a blank "Cataloging" record
        And enters "CQA___.3" in the "Cataloging" "Identification Number" field
        And enters "sesame" in the "Cataloging" "__________" field
        And clicks the "Save" button

        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "sesame" in the "AdvancedSearch" "search" field
        And clicks the "Advanced Search search" button

        Then the search results should contain "CQA_____.1"
        Then the search results should contain "CQA_____.2"
        Then the search results should contain "CQA_____.3"
    #  Then At the top of the results list it should say "Found x records for sesame", where x is the number of results

        And user is on a blank "Cataloging" record
        And enters "CQA___.4" in the "Cataloging" "Identification Number" field
        And enters "sesame" in the "Cataloging" "Title" field
        And clicks the "Save" button
    #         Check that the number of results is increased by 1, and the new record is displayed in the list.

    Scenario: Searching for 'Sesame Street' in various different record types
        Given user is on a blank "Loan In" record
        And enters "CQA___.5" in the "Loan In" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Acquisition" record
        And enters "CQA___.6" in the "Acquisition" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Loan Out" record
        And enters "CQA___.7" in the "Loan Out" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Exhibition" record
        And enters "CQA___.8" in the "Exhibition" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Object Exit" record
        And enters "CQA___.9" in the "Object Exit" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Intake" record
        And enters "CQA___.10" in the "Intake" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Condition Check" record
        And enters "CQA___.11" in the "Condition Check" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Concept" record
        And enters "CQA___.12" in the "Concept" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Person" record
        And enters "CQA___.13" in the "Person" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Storage Location" record
        And enters "CQA___.14" in the "Storage Location" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Organization" record
        And enters "CQA___.15" in the "Organization" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Place" record
        And enters "CQA___.16" in the "Place" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Work" record
        And enters "CQA___.17" in the "Work" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Citation" record
        And enters "CQA___.18" in the "Citation" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Media Handling" record
        And enters "CQA___.19" in the "Media Handling" "Identification Number" field
        # Something with "sesame street"
        And clicks the "Save" button

        Given user is on a blank "Location/Movement/Inventory" record
        And enters "CQA___.20" in the "Location/Movement/Inventory" "_______" field
        # Something with "sesame street"
        And clicks the "Save" button

        And clicks the "Advanced Search" button
        # click all record types
        And enters "sesame" in the "AdvancedSearch" "search" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA_____.1"
        Then the search results should contain "CQA_____.2"
        Then the search results should contain "CQA_____.3"
        Then the search results should contain "CQA_____.4"
        Then the search results should contain "CQA_____.5"
        Then the search results should contain "CQA_____.6"
        Then the search results should contain "CQA_____.7"
        Then the search results should contain "CQA_____.8"
        Then the search results should contain "CQA_____.9"
        Then the search results should contain "CQA_____.10"
        Then the search results should contain "CQA_____.11"
        Then the search results should contain "CQA_____.12"
        Then the search results should contain "CQA_____.13"
        Then the search results should contain "CQA_____.14"
        Then the search results should contain "CQA_____.15"
        Then the search results should contain "CQA_____.16"
        Then the search results should contain "CQA_____.17"
        Then the search results should contain "CQA_____.18"
        Then the search results should contain "CQA_____.19"
        Then the search results should contain "CQA_____.20"
        # Check that the number of results is increased by 18, and that each type of record is displayed in the list.

        Then close the browser


    Scenario: Search for a key phrase "sesame street"
        # Given user is on the "My CollectionSpace" page
        Given user is on a blank "Cataloging" record
        And enters "CQA___.21" in the "Cataloging" "Identification Number" field
        And enters "sesame street" in the "Cataloging" "Brief Description" field
        And clicks the "Save" button

        And user is on a blank "Cataloging" record
        And enters "CQA___.22" in the "Cataloging" "Identification Number" field
        And enters "sesame street" in the "Cataloging" "Distinguishing Features" field
        And clicks the "Save" button

        And user is on a blank "Cataloging" record
        And enters "CQA___.23" in the "Cataloging" "Identification Number" field
        And enters "sesame street" in the "Cataloging" "_____" field #any text field
        And clicks the "Save" button

        And user clicks the "Advanced Search" button
        And enters "sesame street" in the "AdvancedSearch" "search" field
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And clicks the "Advanced Search search" button

        Then the search results should contain "CQA_____.21"
        Then the search results should contain "CQA_____.22"
        Then the search results should contain "CQA_____.23"



#         The list should consist of the following columns: ID number (link to the record), Summary, Record type, Updated at
#         At the top of the results list it should say "Found x records for sesame street", where x is the number of results
#     Actions:

        And user is on a blank "Cataloging" record
        And enters "CQA___.24" in the "Cataloging" "Identification Number" field
        And enters "sesame street" in the "Cataloging" "_____" field #any text field
        And clicks the "Save" button

        And user clicks the "Advanced Search" button
        And enters "sesame street" in the "AdvancedSearch" "search" field
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And clicks the "Advanced Search search" button

        Then the search results should contain "CQA_____.21"
        Then the search results should contain "CQA_____.22"
        Then the search results should contain "CQA_____.23"
        Then the search results should contain "CQA_____.24"
#         Check that the number of results is increased by 1,

        And user is on a blank "Cataloging" record
        And enters "CQA___.25" in the "Cataloging" "Identification Number" field
        And enters "The Big Lebowski" in the "Cataloging" "Brief Description" field
        And clicks the "Save" button

        And user clicks the "Advanced Search" button
        And enters "The Big Lebowski" in the "AdvancedSearch" "search" field
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And clicks the "Advanced Search search" button

        Then the search results should contain "CQA_____.25"


        And clicks the "Advanced Search" button
        And enters "sesame street" in the "AdvancedSearch" "search" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA_____.4"
        Then the search results should contain "CQA_____.5"
        Then the search results should contain "CQA_____.6"
        Then the search results should contain "CQA_____.7"
        Then the search results should contain "CQA_____.8"
        Then the search results should contain "CQA_____.9"
        Then the search results should contain "CQA_____.10"
        Then the search results should contain "CQA_____.11"
        Then the search results should contain "CQA_____.12"
        Then the search results should contain "CQA_____.13"
        Then the search results should contain "CQA_____.14"
        Then the search results should contain "CQA_____.15"
        Then the search results should contain "CQA_____.16"
        Then the search results should contain "CQA_____.17"
        Then the search results should contain "CQA_____.18"
        Then the search results should contain "CQA_____.19"
        Then the search results should contain "CQA_____.20"
        Then the search results should contain "CQA_____.21"
        Then the search results should contain "CQA_____.22"
        Then the search results should contain "CQA_____.23"
#         Check that the number of results is increased by 18, and that each type of record is displayed in the list.
        Then close the browse

    Scenario: Search for a record that contains an authority term "James Fanboy"
        Given user is on a blank "Cataloging" record
        And enters "CQA___.25" in the "Cataloging" "Identification Number" field
        And enters "James Fanboy" in the "Cataloging" "Owner" field
        # If no matches are found, add James Fanboy to the Local Persons authority
        And clicks the "Save" button

        And clicks the "Advanced Search" button
        And enters "James Fanboy" in the "AdvancedSearch" "search" field
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And clicks the "Advanced Search search" button

        Then the results should contain "CQA___.25"

        And clicks on the first item in the search results #needs Stepdef
        Then the titlebar should contain "____" #need to fill in values

    Scenario: Perform a wildcard search
        Given user is on the "My CollectionSpace" page
        And clicks on the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "*" in the "AdvancedSearch" "search" field
        And clicks the "Advanced Search search" button

        # Then A list of all Cataloging records that exist in the system are displayed.

        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And clicks the "Advanced Search search" button
        # Then A list of all Cataloging records that exist in the system are displayed.
        Then close the browser

    Scenario: Boolean Keyword Search
        Given user is on a blank "Loan In" record
        And enters "CQA___.26" in the "Loan In" "Identification Number" field
        # Something with "queen size bed"
        And clicks the "Save" button

        And user is on a blank "Loan In" record
        And enters "CQA___.27" in the "Loan In" "Identification Number" field
        # Something with "queen size bed"
        And clicks the "Save" button

        And user is on a blank "Loan In" record
        And enters "CQA___.28" in the "Loan In" "Identification Number" field
        # Something with "queen size bed"
        And clicks the "Save" button

        And user is on a blank "Loan In" record
        And enters "CQA___.29" in the "Loan In" "Identification Number" field
        # Something with "king size bed"
        And clicks the "Save" button

        And user is on a blank "Loan In" record
        And enters "CQA___.30" in the "Loan In" "Identification Number" field
        # Something with "king size bed"
        And clicks the "Save" button

        And user is on a blank "Loan In" record
        And enters "CQA___.31" in the "Loan In" "Identification Number" field
        # Something with "king size bed"
        And clicks the "Save" button

        And clicks the "Advanced Search" button
        And selects "Loan In" from the "AdvancedSearch" "record type" dropdown
        And enters "queen and bed" into the "AdvancedSearch" "search" field
        And clicks the "Advanced Search search" button

        Then the results should contain "CQA___.26"
        Then the results should contain "CQA___.27"
        Then the results should contain "CQA___.28"

        And clicks the "Advanced Search" button
        And selects "Loan In" from the "AdvancedSearch" "record type" dropdown
        And enters "king and bed not queen" into the "AdvancedSearch" "search" field
        And clicks the "Advanced Search search" button

        Then the results should contain "CQA___.29"
        Then the results should contain "CQA___.30"
        Then the results should contain "CQA___.31"

        And clicks the "Advanced Search" button
        And selects "Loan In" from the "AdvancedSearch" "record type" dropdown
        And enters "king or queen" into the "AdvancedSearch" "search" field

        Then the results should contain "CQA___.26"
        Then the results should contain "CQA___.27"
        Then the results should contain "CQA___.28"
        Then the results should contain "CQA___.29"
        Then the results should contain "CQA___.30"
        Then the results should contain "CQA___.31"
        Then close the browser
#
    Scenario: Traverse through search results pages
        Given user is on the "My CollectionSpace" page
        #  On the My CollectionSpace page, check to see if there are at least 12 acquisition records in the system
        #  If there aren't 12, create new records to add up to 12
        And clicks the "Advanced Search" button
        And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
        And clicks the "Advanced Search search"
        # Then All acquisition records appear in the search results

        # And  Leave the number of items per page at 10, and click on the next button
        # Then The second page of the results list should load
        # Then Item 11 and on should be displayed



    Scenario: Record Deletion
        Given navigates to the record with identification number "CQA___.1"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.2"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.3"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.4"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.5"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.6"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.7"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.8"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.9"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.10"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.11"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.12"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.13"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.14"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.15"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.16"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.17"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.18"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.19"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.20"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.21"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.22"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.23"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.24"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.25"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.26"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.27"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.28"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.29"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.30"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA___.31"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Group" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button
        Then close the browser
