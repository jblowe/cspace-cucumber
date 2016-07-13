#Created by Forest Yang on 1/5/2015

@advancedsearch @valuation
Feature: Advanced Search - Valuation

  #Test1
  Scenario: Advanced Search Field
    # Given user is on the "Create New" page
    #   And selects the "Valuation Control" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Valuation Control" record
    Then the titlebar should contain "Valuation Control"
      And enters "multi-love" in the "Valuation Control" "Valuation Control Reference Number" field
      And enters "06-06-1666" in the "Valuation Control" "Date" field
      And enters "06-06-1666" in the "Valuation Control" "Renewal Date" field
    #   And clicks on the "Valuation Control" "Type" field
    # Then a drop down list should appear in the "Type" row
    #   And selects "Current Value" from dropdown in "Type" row
    #   And selects "Current Value" from the "Valuation Control" "Type" dropdown
      And enters "sarcastish" in the "Valuation Control" "Source" vocab field
    #   And adds "sarcastish" to "Local Persons"
    #   And enters "textbook" in the "Valuation Control" "Note" field
    Given user is on a blank "Valuation Control" record
      And clicks the "Save" button
    Then the record is successfully saved

      And clicks the "Advanced Search" button
    # Then the titlebar should contain "Advanced Search"
    #   And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And clicks on the "Advanced Search" "Type" field

    # Then a drop down list should appear in the "Type" row
    #   And selects "Current Value" from dropdown in "Type" row
      And selects "Current Value" from the "Valuation Control" "Type" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by ref number
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And enters "multi-love" in the "Valuation Control" "Valuation Control" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And enters "1666-06-06" in the "Valuation Control" "Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by Renewal Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And enters "1666-06-06" in the "Valuation Control" "Renewal Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by Source
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And enters "sarcastish" in the "Valuation Control" "Source" vocab field
      And clicks on "sarcastish" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by note
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And enters "textbook" in the "Valuation Control" "Note" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by partial note
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And enters "textb*" in the "Valuation Control" "Note" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "multi-love"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And enters today's date in the "Valuation Control" "Modified Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "multilove"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And enters "admin@core.collectionspace.org" in the "GeneralPages" "Record last modified by" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "multi-love"
    Then close the browser

  #Test2
  Scenario: Boolean-based field search
    # Given user is on the "Create New" page
    #   And selects the "Valuation Control" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Valuation Control" record
    Then the titlebar should contain "Valuation Control"
      And enters "Extreme Wealth" in the "Valuation Control" "Valuation Control Reference Number" field
      And enters "Jane Doe" in the "Valuation Control" "Source" vocab field
      And adds "Jane Doe" to "Local Persons"
    #   And clicks on the "Valuation Control" "Type" field
    # Then a drop down list should appear in the "Type" row
    #   And selects "Current Value" from dropdown in "Type" row
      And selects "Current Value" from the "Valuation Control" "Type" dropdown
      And enters "testtest" in the "Valuation Control" "Note" field
      And clicks the "Save" button
    Then the record is successfully saved
    # Given user is on the "Create New" page
    #   And selects the "Valuation Control" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Valuation Control" record
    Then the titlebar should contain "Valuation Control"
      And enters "Casual Cruelty" in the "Valuation Control" "Valuation Control Reference Number" field
      And enters "Jane Doe" in the "Valuation Control" "Source" vocab field
      And adds "Jane Doe" to "Local Persons"
    #   And clicks on the "Valuation Control" "Type" field
    # Then a drop down list should appear in the "Type" row
    #   And selects "Current Value" from dropdown in "Type" row
      And selects "Current Value" from the "Valuation Control" "Type" dropdown
      And enters "testtest" in the "Valuation Control" "Note" field
      And clicks the "Save" button
    Then the record is successfully saved
    # Given user is on the "Create New" page
    #   And selects the "Valuation Control" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Valuation Control" record
    Then the titlebar should contain "Valuation Control"
      And enters "Unknown Mortal" in the "Valuation Control" "Valuation Control Reference Number" field
      And enters "Jane Doe" in the "Valuation Control" "Source" vocab field
      And adds "Jane Doe" to "Local Persons"
    #   And clicks on the "Valuation Control" "Type" field
    # Then a drop down list should appear in the "Type" row
    #   And selects "Original Value" from dropdown in "Type" row
      And selects "Original Value" from the "Valuation Control" "Type" dropdown
      And enters "testtest" in the "Valuation Control" "Note" field
      And clicks the "Save" button
    Then the record is successfully saved

      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Valuation Control" "Source" vocab field
      And clicks on "Jane Doe" from autocomplete options
    #   And clicks on the "Advanced Search" "Type" field
    # Then a drop down list should appear in the "Type" row
    #   And selects "Current Value" from dropdown in "Type" row
      And selects "Current Value" from the "Valuation Control" "Type" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "Extreme Wealth"
    Then the search results should contain "Casual Cruelty"
    Then the search results should contain "Unknown Mortal"

      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Valuation Control" "Source" vocab field
      And clicks on "Jane Doe" from autocomplete options
    #   And clicks on the "Advanced Search" "Type" field
    # Then a drop down list should appear in the "Type" row
    #   And selects "Current Value" from dropdown in "Type" row
      And selects "Current Value" from the "Valuation Control" "Type" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "Extreme Wealth"
    Then the search results should contain "Casual Cruelty"
    Then the search results should not contain "Unknown Mortal"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "testtest" in the "AdvancedSearch" "search" field
      And enters "Jane Doe" in the "Valuation Control" "Source" vocab field
      And clicks on "Jane Doe" from autocomplete options
    #   And clicks on the "Advanced Search" "Type" field
    # Then a drop down list should appear in the "Type" row
    #   And selects "Current Value" from dropdown in "Type" row
      And selects "Current Value" from the "Valuation Control" "Type" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "Extreme Wealth"
    Then the search results should contain "Casual Cruelty"
    Then the search results should contain "Unknown Mortal"

      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Valuation Control" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "testtest" in the "AdvancedSearch" "search" field
      And enters "Jane Doe" in the "Valuation Control" "Source" vocab field
      And clicks on "Jane Doe" from autocomplete options
    #   And clicks on the "Advanced Search" "Type" field
    # Then a drop down list should appear in the "Type" row
    #   And selects "Current Value" from dropdown in "Type" row
      And selects "Current Value" from the "Valuation Control" "Type" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "Extreme Wealth"
    Then the search results should contain "Casual Cruelty"
    Then the search results should not contain "Unknown Mortal"
    Then close the browser

    Scenario: Record deletion
      Given user is on the "My CollectionSpace" page
        And navigates to the record with identification number "multi-love"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Work" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "Extreme Wealth"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Work" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "Casual Cruelty"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Work" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "Unknown Mortal"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Work" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button
      Then close the browser
