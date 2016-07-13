#Created by Forest Yang on 12/29

@advancedsearch @loans_out
Feature: Advanced Search - Loans Out

  #Test1
  Scenario: Advanced Search Fields - Loan Out Number
      # Given user is on the "Create New" page
      #   And selects the "Loan Out" radio button on the Create New page
      #   And clicks on the Create button
      Given user is on a blank "Loan Out" record
        And enters "textbook CQA79" in the "Loan Out" "Loan Out Number" field
        And selects "Exhibition" from the "Loan Out" "Loan Purpose" dropdown
        And selects "Agreed" from the "Loan Out" "Loan Status" dropdown
        And enters "Forest Yang" in the "Loan Out" "Borrower" autocomplete field
        And enters "2022-01-01" in the "Loan Out" "Loan Out Date" field
        And enters "2022-01-01" in the "Loan Out" "Loan Return Date" field
        And enters "2022-01-01" in the "Loan Out" "Loan Renewal Application Date" field
        And clicks the "Save" button
        And clicks the "Advanced Search" button

        And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
        And enters "textbook CQA79" in the "Loan Out" "Loan Out Number" field
        And clicks the "Advanced Search search" button
      Then the search results should contain "textbook CQA79"
      Then close the browser

  Scenario: Search by Loan Purpose
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And selects "Exhibition" from the "Loan Out" "Loan Purpose" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "textbook CQA79"
    Then close the browser

  Scenario: Search by Borrower
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And enters "Forest Yang" in the "Loan Out" "Borrower Search" autocomplete field
      And clicks the "Advanced Search search" button
    Then the search results should contain "textbook CQA79"
    Then close the browser

  Scenario: Search by Loan Status
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And selects "Agreed" from the "Loan Out" "Loan Status" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "textbook CQA79"
    Then close the browser

  Scenario: Search by Loan Out Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button

      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And enters "2022-01-01" in the "Loan Out" "Earliest Loan Out Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "textbook CQA79"
    Then close the browser

  Scenario: Search by Loan Return Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button

      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And enters "2022-01-01" in the "Loan Out" "Earliest Loan Return Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "textbook CQA79"
    Then close the browser

  Scenario: Search by Loan Renewal Application Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button

      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And enters "2022-01-01" in the "Loan Out" "Earliest Loan Renewal Application Date" field
      And enters "2022-01-01" in the "Loan Out" "Latest Loan Renewal Application Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "textbook CQA79"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button

      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And enters today's date in the "GeneralPages" "Earliest Modified Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "textbook CQA79"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And enters "admin@core.collectionspace.org" in the "Loan Out" "Record last modified by" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "textbook CQA79"
    Then close the browser
#
  Scenario: textb**
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button

      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And enters "textb*" in the "Loan Out" "Loan Out Number" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "textbook CQA79"
    Then close the browser

  #Test2
  Scenario: Boolean field based search
    # Given user is on the "Create New" page
    #   And selects the "Loan Out" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Loan Out" record

      And enters "example" in the "Loan Out" "Loan Out Number" field
      And enters "John Doe" in the "Loan Out" "Borrower" autocomplete field
      And selects "Research" from the "Loan Out" "Loan Purpose" dropdown
      And enters "testtest" in the "Loan Out" "Loan Out Note" field
      And clicks the "Save" button
    # Then the record is successfully saved

    # Given user is on the "Create New" page
    #   And selects the "Loan Out" radio button on the Create New page
    #   And clicks on the Create button
    And user is on a blank "Loan Out" record
      And enters "exampleexample" in the "Loan Out" "Loan Out Number" field
      And enters "John Doe" in the "Loan Out" "Borrower" autocomplete field
      And selects "Research" from the "Loan Out" "Loan Purpose" dropdown
      And enters "testtest" in the "Loan Out" "Loan Out Conditions" field
      And clicks the "Save" button
    # Then the record is successfully saved

    # Given user is on the "Create New" page
    #   And selects the "Loan Out" radio button on the Create New page
    #   And clicks on the Create button
    And user is on a blank "Loan Out" record
      And enters "exampleexampleexample" in the "Loan Out" "Loan Out Number" field
      And enters "John Doe" in the "Loan Out" "Borrower" autocomplete field
      And selects "Photography" from the "Loan Out" "Loan Purpose" dropdown
      And enters "testtest" in the "Loan Out" "Loan Out Note" field
      And clicks the "Save" button
    # Then the record is successfully saved

      And clicks the "Advanced Search" button
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And enters "John Doe" in the "Loan Out" "Borrower Search" autocomplete field
      And selects "Research" from the "Loan Out" "Loan Purpose" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "example"
    Then the search results should contain "exampleexample"
    Then the search results should contain "exampleexampleexample"

      And clicks the "Advanced Search" button
      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "John Doe" in the "Loan Out" "Borrower Search" autocomplete field
      And selects "Research" from the "Loan Out" "Loan Purpose" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "example"
    Then the search results should contain "exampleexample"
    Then the search results should not contain "exampleexampleexample"
    Then close the browser


  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button

      And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "John Doe" in the "Loan Out" "Borrower Search" autocomplete field
      And selects "Research" from the "Loan Out" "Loan Purpose" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "example"
    Then the search results should contain "exampleexample"
    Then the search results should contain "exampleexampleexample"

      And clicks the "Advanced Search" button

      And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
      And selects "Loan Out" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "John Doe" in the "Loan Out" "Borrower Search" autocomplete field
      And selects "Research" from the "Loan Out" "Loan Purpose" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "example"
    Then the search results should contain "exampleexample"
    Then the search results should not contain "exampleexampleexample"
    Then close the browser

  Scenario: Record Deletion
    Given user is on the "My CollectionSpace" page
      And navigates to the record with identification number "textbook CQA79"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Loan Out" deletion should be confirmed in a dialog
    And clicks delete confirmation OK button

      And navigates to the record with identification number "example"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Loan Out" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button

      And navigates to the record with identification number "exampleexample"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Loan Out" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button

      And navigates to the record with identification number "exampleexampleexample"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Loan Out" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button
    Then close the browser
