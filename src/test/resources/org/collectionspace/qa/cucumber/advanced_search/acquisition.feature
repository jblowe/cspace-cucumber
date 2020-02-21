# Created by Cesar Villalobos on 9/15/15
# Acquisition source is not working as desired
# Everything else works as of May 31

@advancedsearch @acquisition
Feature: Advanced Search Acquisition
   Searching for a record based on boolean-search as well as regular search terms

   Scenario: Advanced Search Fields and wildcard
       Given user is on a blank "Acquisition" record
# 	    # Given user is on the "Create New" page
#         # And selects the "Acquisition" radio button on the Create New page
#         # Clicks create button
       And enters "CQA71.1" in the "Acquisition" "Acquisition Reference Number" field

       And enters "2016-02-02" in the "Acquisition" "Acquisition Date" field
       And enters "2016" in the "Acquisition" "Earliest/Single Acquisition Date Year" field
       And enters "02" in the "Acquisition" "Earliest/Single Acquisition Date Month" field
       And enters "02" in the "Acquisition" "Earliest/Single Acquisition Date Day" field

       And enters "2016-01-01" in the "Acquisition" "Accession Date" field
       And enters "2016" in the "Acquisition" "Earliest/Single Accession Date Year" field
       And enters "01" in the "Acquisition" "Earliest/Single Accession Date Month" field
       And enters "01" in the "Acquisition" "Earliest/Single Accession Date Day" field

       And selects "Purchase" from the "Acquisition" "Acquisition Method" dropdown
       And enters "CQA-71 Test" in the "Acquisition" "Field collection event name" field
       # # And enters "CQA-71 Acquisition Source" in the "Acquisition" "Acquisition Source" field
       # # And clicks on "CQA-71 Acquisition Source" from autocomplete options
       And enters "CQA-71 Funding source" in the "Acquisition" "Funding Source" autocomplete field
       And enters "textbook" in the "Acquisition" "Credit Line" field

       # And scrolls up
       And clicks the "Save" button
       And clicks the "Ok" button

       # Record Title
       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And enters "CQA71.1" in the "Acquisition" "Acquisition Reference Number" field
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.1"

#       #Accession Date
       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And enters "2016-01-01" in the "Acquisition" "Earliest Accession Date" field
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.1"
#
#        #Acquisition Date
       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And enters "2016-02-02" in the "Acquisition" "Earliest Acquisition Date" field
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.1"

       #Acquisition Method
       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And selects "Purchase" from the "Acquisition" "Acquisition Method" dropdown
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.1"
#
       #Acquisition Source
#         And clicks the "Advanced Search" button
#         And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
#         And enters "CQA-71 Acquisition Source" in the "Acquisition" "Acquisition Source" field
#         And clicks on "CQA-71 Acquisition Source" from autocomplete options
#         And clicks the "Advanced Search search" button
#         Then the search results should contain "CQA71.1"
#
       #Acquisition Funding
       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And enters "CQA-71 Funding source" in the "Acquisition" "Search Funding source" autocomplete field
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.1"
#
       #Field Collection event name
       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And enters "CQA-71 Test" in the "Acquisition" "Field collection event name" field
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.1"
#
       #Todays Date
       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And enters today's date in the "GeneralPages" "Earliest Modified Date" field
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.1"

#         #Admin
       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And enters "admin@core.collectionspace.org" in the "Acquisition" "Record last modified by" field
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.1"
       Then close the browser

   Scenario: Boolean field­-based search
#        # Given user is on the "Create New" page
#         # And selects the "Acquisition" radio button on the Create New page
#         # Clicks confirm
       Given user is on a blank "Acquisition" record
       And enters "CQA71.2" in the "Acquisition" "Acquisition Reference Number" field
       And selects "Purchase" from the "Acquisition" "Acquisition Method" dropdown
       And enters "testtest" in the "Acquisition" "Acquisition Reason" field
       And enters "thank you" in the "Acquisition" "Credit Line" field
       And clicks the "Save" button
       And clicks the "Ok" button

#         # And navigates to the "Create New" page
#         # And selects the "Acquisition" radio button on the Create New page
#         # confirm button
       And user is on a blank "Acquisition" record
       And enters "CQA71.3" in the "Acquisition" "Acquisition Reference Number" field
       And selects "Purchase" from the "Acquisition" "Acquisition Method" dropdown
       And enters "testtest" in the "Acquisition" "Acquisition Note" field
       And enters "thank you" in the "Acquisition" "Credit Line" field
       And clicks the "Save" button
       And clicks the "Ok" button
#
#         And navigates to the "Create New" page
#         And selects the "Acquisition" radio button on the Create New page
#         Confirm button
       And user is on a blank "Acquisition" record
       And enters "CQA71.4" in the "Acquisition" "Acquisition Reference Number" field
       And selects "Gift" from the "Acquisition" "Acquisition Method" dropdown
       And enters "testtest" in the "Acquisition" "Acquisition Provisos" field
       And enters "thank you" in the "Acquisition" "Credit Line" field
       And clicks the "Save" button
       And clicks the "Ok" button
#
       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
       And enters "thank you" in the "Acquisition" "Credit Line" field
       And selects "Purchase" from the "Acquisition" "Acquisition Method" dropdown
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.2"
       Then the search results should contain "CQA71.3"
       Then the search results should contain "CQA71.4"

       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
       And enters "thank you" in the "Acquisition" "Credit Line" field
       And selects "Purchase" from the "Acquisition" "Acquisition Method" dropdown
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.2"
       Then the search results should contain "CQA71.3"
       Then the search results should not contain "CQA71.4"

       Then close the browser


   Scenario: Boolean and Keyword Search
       Given user is on the "My CollectionSpace" page
       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
       And enters "thank you" in the "Acquisition" "Credit Line" field
       And selects "Purchase" from the "Acquisition" "Acquisition Method" dropdown
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.2"
       Then the search results should contain "CQA71.3"
       Then the search results should contain "CQA71.4"

       And clicks the "Advanced Search" button
       And selects "Acquisition" from the "AdvancedSearch" "record type" dropdown
       And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
       And enters "thank you" in the "Acquisition" "Credit Line" field
       And selects "Purchase" from the "Acquisition" "Acquisition Method" dropdown
       And clicks the "Advanced Search search" button
       Then the search results should contain "CQA71.2"
       Then the search results should contain "CQA71.3"
       Then the search results should not contain "CQA71.4"
       Then close the browser

   Scenario: Delete Records we just created
       Given user is on the "My CollectionSpace" page
       And navigates to the record with identification number "CQA71.1"
       And clicks on the "Delete" button
       Then delete confirmation dialogue should appear
       And clicks the confirmation delete button
       Then "Acquisition" deletion should be confirmed in a dialog
       And clicks delete confirmation OK button

       And navigates to the record with identification number "CQA71.2"
       And clicks on the "Delete" button
       Then delete confirmation dialogue should appear
       And clicks the confirmation delete button
       Then "Acquisition" deletion should be confirmed in a dialog
       And clicks delete confirmation OK button

       And navigates to the record with identification number "CQA71.3"
       And clicks on the "Delete" button
       Then delete confirmation dialogue should appear
       And clicks the confirmation delete button
       Then "Acquisition" deletion should be confirmed in a dialog
       And clicks delete confirmation OK button

       And navigates to the record with identification number "CQA71.4"
       And clicks on the "Delete" button
       Then delete confirmation dialogue should appear
       And clicks the confirmation delete button
       Then "Acquisition" deletion should be confirmed in a dialog
       And clicks delete confirmation OK button
       Then close the browser
