#Created by Forest Yang on 12/302015
# OBJECTS EXIT - CQA 83
# Working as of June 15 2016

@advancedsearch @object_exit
Feature: Advanced Search - Object Exit
#       And selects "Dataset" from the "Media Handling" "Types" dropdown
#       And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown

  #Test1
  Scenario: Advanced Search Fields
    # Given user is on the "Create New" page
    #   And selects the "Object Exit" radio button
    #   And clicks on the Create button
    Given user is on a blank "Object Exit" record
      And enters "CQA83desiderium" in the "Object Exit" "Exit Number" field
      And enters "tishas" in the "Object Exit" "Current Owner" autocomplete field
      And enters "oar" in the "Object Exit" "Depositor" autocomplete field
      And enters "01-01-2011" in the "Object Exit" "Exit Date" field
      And enters "01" in the "Object Exit" "Earliest/Single Date Day" field
      And enters "01" in the "Object Exit" "Earliest/Single Date Month" field
      And enters "2011" in the "Object Exit" "Earliest/Single Date Year" field
      And selects "Courier" from the "Object Exit" "Exit Method" dropdown
      And selects "Deaccession" from the "Object Exit" "Exit Reason" dropdown
      And enters "textbook" in the "Object Exit" "Exit Note" field
      And clicks the "Save" button
    # Then the record is successfully saved

      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "CQA83desiderium" in the "Object Exit" "Exit Number" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA83desiderium"
    Then close the browser

  Scenario: Search by Current owner
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "tishas" in the "Object Exit" "Current Owner Search" autocomplete field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA83desiderium"
    Then close the browser

  Scenario: Search by Depositor
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "oar" in the "Object Exit" "Depositor Search" autocomplete field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA83desiderium"
    Then close the browser

  Scenario: Search by Exit Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "01-01-2011" in the "Object Exit" "Earliest Exit Date" field
      And enters "01-01-2011" in the "Object Exit" "Latest Exit Date" field
      And clicks on the "Advanced Search search" button
    Then the search results should contain "CQA83desiderium"
    Then close the browser

  Scenario: Search by Exit Method
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And selects "Courier" from the "Object Exit" "Exit Method" dropdown
      And clicks on the "Advanced Search search" button
    Then the search results should contain "CQA83desiderium"
    Then close the browser

  Scenario: Search by Exit Reason
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And selects "Deaccession" from the "Object Exit" "Exit Reason" dropdown
      And clicks on the "Advanced Search search" button
    Then the search results should contain "CQA83desiderium"
    Then close the browser

  Scenario: Search by Exit Note
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "textbook" in the "Object Exit" "Exit Note" field
      And clicks on the "Advanced Search search" button
    Then the search results should contain "CQA83desiderium"
    Then close the browser

  Scenario: Search by Exit Note (partial)
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "textb*" in the "Object Exit" "Exit Note" field
      And clicks on the "Advanced Search search" button
    Then the search results should contain "CQA83desiderium"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters today's date in the "Object Exit" "Earliest Modified Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA83desiderium"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "admin@core.collectionspace.org" in the "Object Exit" "Record last modified by" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA83desiderium"
    Then close the browser

  #Test2
  Scenario: Boolean based field search
    Given user is on the "Create New" page
    #   And selects the "Object Exit" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Object Exit" record
      And enters "CQA83ThiefintheNight" in the "Object Exit" "Exit Number" field
      And enters "Jane Doe" in the "Object Exit" "Current Owner" autocomplete field
      And selects "Return of Loan" from the "Object Exit" "Exit Reason" dropdown
      And enters "testtest" in the "Object Exit" "Exit Note" field
      And clicks the "Save" button
    # Then the record is successfully saved

    # Given user is on the "Create New" page
    #   And selects the "Object Exit" radio button on the Create New page
    #   And clicks on the Create button
    And user is on a blank "Object Exit" record
      And enters "CQA83Bestfriend" in the "Object Exit" "Exit Number" field
      And enters "Jane Doe" in the "Object Exit" "Current Owner" autocomplete field
      And selects "Return of Loan" from the "Object Exit" "Exit Reason" dropdown
      And enters "testtest" in the "Object Exit" "Exit Note" field
      And clicks the "Save" button
    # Then the record is successfully saved

    # Given user is on the "Create New" page
    #   And selects the "Object Exit" radio button on the Create New page
    #   And clicks on the Create button
    And user is on a blank "Object Exit" record
      And enters "CQA83Lifestyle" in the "Object Exit" "Exit Number" field
      And enters "Jane Doe" in the "Object Exit" "Current Owner" autocomplete field
      And selects "Disposal" from the "Object Exit" "Exit Reason" dropdown
      And enters "testtest" in the "Object Exit" "Exit Note" field
      And clicks the "Save" button
    # Then the record is successfully saved

      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Object Exit" "Current Owner Search" autocomplete field
      And selects "Return of Loan" from the "Object Exit" "Exit Reason" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA83Lifestyle"
    Then the search results should contain "CQA83Bestfriend"
    Then the search results should contain "CQA83ThiefintheNight"

      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Object Exit" "Current Owner Search" autocomplete field
      And selects "Return of Loan" from the "Object Exit" "Exit Reason" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should not contain "CQA83Lifestyle"
    Then the search results should contain "CQA83Bestfriend"
    Then the search results should contain "CQA83ThiefintheNight"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
      And enters "Jane Doe" in the "Object Exit" "Current Owner Search" autocomplete field
      And selects "Return of Loan" from the "Object Exit" "Exit Reason" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA83Lifestyle"
    Then the search results should contain "CQA83Bestfriend"
    Then the search results should contain "CQA83ThiefintheNight"

      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
      And enters "Jane Doe" in the "Object Exit" "Current Owner Search" autocomplete field
      And selects "Return of Loan" from the "Object Exit" "Exit Reason" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should not contain "CQA83Lifestyle"
    Then the search results should contain "CQA83Bestfriend"
    Then the search results should contain "CQA83ThiefintheNight"
    Then close the browser

  #Test4
  Scenario: Structured Date Search # Fix all of these, they have multiple things
     Given user is on a blank "Object Exit" record
    # Given user is on the "Create New" page
    #   And selects the "Object Exit" radio button on the Create New page
      And enters "CQA83Lovehoneybear" in the "Object Exit" "Exit Number" field

      And enters "06-05-1987" in the "Object Exit" "Exit Date" field
      And enters "05" in the "Object Exit" "Earliest/Single Date Day" field
      And enters "06" in the "Object Exit" "Earliest/Single Date Month" field
      And enters "1987" in the "Object Exit" "Earliest/Single Date Year" field
      And enters "19" in the "Object Exit" "Earliest/Single Date Day" field
      And enters "04" in the "Object Exit" "Earliest/Single Date Month" field
      And enters "1993" in the "Object Exit" "Earliest/Single Date Year" field

      And clicks the "Save" button
    Then the record is successfully saved

      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "5-4-1986" in the "Object Exit" "Earliest Exit Date" field
      And enters "6-7-1994" in the "Object Exit" "Latest Exit Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA83Lovehoneybear"

      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "6-5-1987" in the "Object Exit" "Earliest Exit Date" field
      And enters "4-19-1993" in the "Object Exit" "Latest Exit Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA83Lovehoneybear"

      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "6-6-1987" in the "Object Exit" "Earliest Exit Date" field
      And enters "4-20-1994" in the "Object Exit" "Latest Exit Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA83Lovehoneybear"

      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "6-3-1987" in the "Object Exit" "Earliest Exit Date" field
      And enters "6-4-1987" in the "Object Exit" "Latest Exit Date" field
      And clicks the "Advanced Search search" button
    Then the search results should not contain "CQA83Lovehoneybear"

      And clicks the "Advanced Search" button
      And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "4-21-1993" in the "Object Exit" "Earliest Exit Date" field
      And enters "4-22-1993" in the "Object Exit" "Latest Exit Date" field
      And clicks the "Advanced Search search" button
    Then the search results should not contain "CQA83Lovehoneybear"
    Then close the browser

  Scenario: Record deletion
      Given user is on the "My CollectionSpace" page
        And navigates to the record with identification number "CQA83desiderium"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Object Exit" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA83Lifestyle"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Object Exit" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA83Bestfriend"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Object Exit" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA83ThiefintheNight"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Object Exit" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA83Lovehoneybear"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Object Exit" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

      Then close the browser
