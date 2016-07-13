#Created by Forest Yang on 1/8/2016

@advancedsearchvocab @work
Feature: Advanced Search - Work

  #Test1
  Scenario: Advanced Search Fields
    # Given user is on the "Create New" page
    #   And selects the "Work" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Work" record
    Then the titlebar should contain "Work"
      And enters "Carly" in the "Work" "Display Name" field
    #   And clicks on the "Work" "Language" field
    # Then a drop down list should appear in the "Language" row
    #   And selects "Ancient Greek" from dropdown in "Language" row
      And selects "Ancient Greek" from the "Work" "Language" dropdown
    #   And clicks on the "Work" "Status" field
    # Then a drop down list should appear in the "Status" field
    #   And selects "Complete" from dropdown in "Status" row
      And selects "Complete" from the "Work" "Status" dropdown
    #   And clicks on the "Work" "Work type" field
    # Then a drop down list should appear in the "Work type" row
      And selects "Built" from the "Work" "Work type" dropdown
      And enters "Rae" in the "Work" "Creator" vocab field
      And adds "Rae" to "Local Persons"
      And clicks the "Save" button
    Then the record is successfully saved

      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Work" from the "AdvancedSearch" "record type" dropdown
      And enters "Carly" in the "Work" "Display Name" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by language
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Work" from the "AdvancedSearch" "record type" dropdown
    #   And clicks on the "Advanced Search" "Language" field
    # Then a drop down list should appear in the "Language" row
    #   And selects "Ancient Greek" from dropdown in "Language" row
      And selects "Ancient Greek" from the "Work" "Language" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by Status
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Work" from the "AdvancedSearch" "record type" dropdown
    #   And clicks on the "Advanced Search" "Status" field
    # Then a drop down list should appear in the "Language" row
    #   And selects "Complete" from dropdown in "Status" row
      And selects "Complete" from the "Work" "Status" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by Work type
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Work" from the "AdvancedSearch" "record type" dropdown
    #   And clicks on the "Advanced Search" "Work type" field
    # Then a drop down list should appear in the "Work type" row
    #   And selects "Built" from dropdown in "Work type" row
      And selects "Built" from the "Work" "Work type" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by Creator
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Work" from the "AdvancedSearch" "record type" dropdown
      And enters "Rae" in the "Work" "Creator" vocab field
      And clicks on "Rae" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Work" from the "AdvancedSearch" "record type" dropdown
      And enters today's date in the "GeneralPages" "Earliest Modified Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Work" from the "AdvancedSearch" "record type" dropdown
      And enters "admin@core.collectionspace.org" in the "Work" "Record last modified by" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "Carly"
    Then close the browser

  Scenario: Record deletion
    Given user is on the "My CollectionSpace" page
      And navigates to the record with identification number "Carly"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Work" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button
    Then close the browser

  # Scenario: Search by Modified Date
  #   Given user is on the "My CollectionSpace" page
  #     And clicks the "Advanced Search" button
  #   Then the titlebar should contain "Advanced Search"
  #     And selects "Work" from the "AdvancedSearch" "record type" dropdown
  #     And enters today's date in the "Modified Date" field
  #     And clicks the "Advanced Search search" button
  #   Then the search results should contain "textbook"
  #   Then close the browser
  #
  # Scenario: Search by username
  #   Given user is on the "My CollectionSpace" page
  #     And clicks the "Advanced Search" button
  #   Then the titlebar should contain "Advanced Search"
  #     And selects "Work" from the "AdvancedSearch" "record type" dropdown
  #     And enters username in the "Advanced Search" "Record last modified by" field
  #     And clicks the "Advanced Search search" button
  #   Then the search results should contain "textbook"
  #   Then close the browser
