#Created by Forest Yang on 12/29/2015

@advancedsearch @location_movement_inventory
Feature: Advanced Search - Location / Movement / Inventory

  #Test1
  Scenario: Advanced Search Fields
    # Given user is on the "Create New" page
    #   And selects the "Location/Movement/Inventory" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Location/Movement/Inventory" record
    Then the titlebar should contain "Location/Movement/Inventory"
      And enters "Ssidweet" in the "Location/Movement/Inventory" "Current Location" vocab field
      And adds "Ssidweet" to "Local Storage Locations"
      And enters "1002-01-01" in the "Location/Movement/Inventory" "Location Date" field
      And enters "Teewdiss" in the "Location/Movement/Inventory" "Normal Location" vocab field
      And adds "Teewdiss" to "Local Storage Locations"
      And enters "hobinrood" in the "Location/Movement/Inventory" "Movement Contact" vocab field
      And adds "hobinrood" to "Local Persons"
    #   And clicks on the "Location/Movement/Inventory" "Movement Method" field
    # Then a drop down list should appear in the "Movement Method" row
    #   And selects "Forklift" from dropdown in "Movement Method" row
      And selects "Forklift" from the "Location/Movement/Inventory" "Movement Method" dropdown
      And enters "1002-01-01" in the "Location/Movement/Inventory" "Planned removal date" field
      And enters "1002-01-01" in the "Location/Movement/Inventory" "Removal date" field
    #   And clicks on the "Location/Movement/Inventory" "Reason for move" field
    # Then a drop down list should appear in the "Reason for move" field
    #   And selects "Conservation" from dropdown in "Reason for move" row
      And selects "Conservation" from the "Location/Movement/Inventory" "Reason for move" dropdown
      And enters "1002-01-01" in the "Location/Movement/Inventory" "Inventory Date" field
      And enters "hobinrood" in the "Location/Movement/Inventory" "Inventory Contact" field
      And clicks on "hobinrood" from autocomplete options
    #   And clicks on the "Location/Movement/Inventory" "Inventory Action Required" field
    # Then a drop down list should appear in the "Inventory Action Required" field
    #   And selects "Conservation" from dropdown in "Inventory Action Required" row
      And selects "Conservation" from the "Location/Movement/Inventory" "Inventory Action Required" dropdown
      And enters "irrelevant" in "Location/Movement/Inventory" "Inventory Note" field
    #   And clicks on the "Location/Movement/Inventory" "Inventory Frequency" field
    # Then a drop down list should appear in the "Inventory Frequency" field
    #   And selects "Daily" from dropdown in "Inventory Frequency" row
    And selects "Daily" from the "Location/Movement/Inventory" "Inventory Frequency" dropdown
      And enters "1002-01-01" in the "Location/Movement/Inventory" "Next Inventory Date" field
      And enters "3357" in the "Location/Movement/Inventory" "Reference Number" field
      And clicks the "Save" button
    Then the record is successfully saved

      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "Ssidweet" in the "Location/Movement/Inventory" "Current Location" vocab field
      And clicks on "Ssidweet" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Location Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "1002-01-01" in the "Location/Movement/Inventory" "Location Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Normal Location
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "Teewdiss" in the "Location/Movement/Inventory" "Normal Location" vocab field
      And clicks on "Teewdiss" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Movement Contact
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "hobinrood" in the "Location/Movement/Inventory" "Movement Contact" vocab field
      And clicks on "hobinrood" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Movement Method
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
    #   And clicks on the "Advanced Search" "Movement Method" field
    # Then a drop down list should appear in the "Movement Method" row
    #   And selects "Forklift" from dropdown in "Movement Method" row
      And selects "Forklift" from the "Location/Movement/Inventory" "Movement Method" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Planned removal date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "1002-01-01" in the "Location/Movement/Inventory" "Planned removal date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Removal date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "1002-01-01" in the "Location/Movement/Inventory" "Removal Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Reason for move
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
    #   And clicks on the "Advanced Search" "Reason for move" field
    # Then a drop down list should appear in the "Reason for move" row
    #   And selects "Conservation" from dropdown in "Reason for move" row
      And selects "Conservation" from the "Location/Movement/Inventory" "Reason for move" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Inventory Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "1002-01-01" in the "Location/Movement/Inventory" "Inventory Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Inventory Contact
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "hobinrood" in the "Location/Movement/Inventory" "Inventory Contact" vocab field
      And clicks on "hobinrood" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Inventory action required
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
    #   And clicks on the "Advanced Search" "Inventory Action Required" field
    # Then a drop down list should appear in the "Inventory Action Required" row
    #   And selects "Conservation" from dropdown in "Inventory Action Required" row
      And selects "Conservation" from the "Location/Movement/Inventory" "Inventory Action Required" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Inventory Note
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "irrelevant" in the "Location/Movement/Inventory" "Inventory Note" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Inventory Frequency
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
    #   And clicks on the "Advanced Search" "Inventory Frequency" field
    # Then a drop down list should appear in the "Inventory Frequency" row
    #   And selects "Daily" from dropdown in "Inventory Frequency" row
      And selects "Daily" from the "Location/Movement/Inventory" "Inventory Frequency" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Next Inventory Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "1002-01-01" in the "Location/Movement/Inventory" "Next Inventory Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters today's date in the "Location/Movement/Inventory" "Earliest Modified Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "admin@core.collectionspace.org" in the "GeneralPages" "Record last modified by" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: search by reference number
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "3357" in the "Location/Movement/Inventory" "Reference Number" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  Scenario: search by reference number fragment
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And enters "33*" in the "Location/Movement/Inventory" "Reference Number" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "3357"
    Then close the browser

  #Test2
  Scenario: Boolean field-based search
    # Given user is on the "Create New" page
    #   And selects the "Location/Movement/Inventory" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Location/Movement/Inventory" record
    Then the titlebar should contain "Location/Movement/Inventory"
      And enters "7533" in the "Location/Movement/Inventory" "Reference Number" field
      And enters "Jane Doe" in the "Location/Movement/Inventory" "Movement Contact" vocab field
      And adds "Jane Doe" to "Local Persons"
      And enters "In a Shoebox" in the "Location/Movement/Inventory" "Current Location" vocab field
      And adds "In a Shoebox" to "Local Storage Locations"
      And enters "testtest" in the "Location/Movement/Inventory" "Movement Information Note" field
      And clicks the "Save" button
    Then the record is successfully saved

    # Given user is on the "Create New" page
    #   And selects the "Location/Movement/Inventory" radio button on the Create New page
    #   And clicks on the Create button
    And user is on a blank "Location/Movement/Inventory" record
    Then the titlebar should contain "Location/Movement/Inventory"
      And enters "7534" in the "Location/Movement/Inventory" "Reference Number" field
      And enters "Jane Doe" in the "Location/Movement/Inventory" "Movement Contact" vocab field
      And adds "Jane Doe" to "Local Persons"
      And enters "In a Shoebox" in the "Location/Movement/Inventory" "Current Location" vocab field
      And adds "In a Shoebox" to "Local Storage Locations"
      And enters "testtest" in the "Location/Movement/Inventory" "Movement Information Note" field
      And clicks the "Save" button
    Then the record is successfully saved

    # Given user is on the "Create New" page
    #   And selects the "Location/Movement/Inventory" radio button on the Create New page
    #   And clicks on the Create button
    And user is on a blank "Location/Movement/Inventory" record
    Then the titlebar should contain "Location/Movement/Inventory"
      And enters "7535" in the "Location/Movement/Inventory" "Reference Number" field
      And enters "Jane Doe" in the "Location/Movement/Inventory" "Movement Contact" vocab field
      And adds "Jane Doe" to "Local Persons"
      And enters "In my Pocket" in the "Location/Movement/Inventory" "Current Location" vocab field
      And adds "In my Pocket" to "Local Storage Locations"
      And enters "testtest" in the "Location/Movement/Inventory" "Movement Information Note" field
      And clicks the "Save" button
    Then the record is successfully saved

      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Location/Movement/Inventory" "Movement Contact" vocab field
      And clicks on "Jane Doe" from autocomplete options
      And enters "In a Shoebox" in the "Location/Movement/Inventory" "Current Location" vocab field
      And clicks on "In a Shoebox" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should contain "7533"
    Then the search results should contain "7534"
    Then the search results should contain "7535"

      And clicks the "Advanced Search" button
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Location/Movement/Inventory" "Movement Contact" vocab field
      And clicks on "Jane Doe" from autocomplete options
      And enters "In a Shoebox" in the "Location/Movement/Inventory" "Current Location" vocab field
      And clicks on "In a Shoebox" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should contain "7533"
    Then the search results should contain "7534"
    Then the search results should not contain "7535"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And enters "testtest" in the "AdvancedSearch" "search" field
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Location/Movement/Inventory" "Movement Contact" vocab field
      And clicks on "Jane Doe" from autocomplete options
      And enters "In a Shoebox" in the "Location/Movement/Inventory" "Current Location" vocab field
      And clicks on "In a Shoebox" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should contain "7533"
    Then the search results should contain "7534"
    Then the search results should contain "7535"

      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
      And enters "testtest" in the "AdvancedSearch" "search" field
      And selects "Location/Movement/Inventory" from the "AdvancedSearch" "record type" dropdown
      And selects "and (ALL)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Location/Movement/Inventory" "Movement Contact" vocab field
      And clicks on "Jane Doe" from autocomplete options
      And enters "In a Shoebox" in the "Location/Movement/Inventory" "Current Location" vocab field
      And clicks on "In a Shoebox" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should contain "7533"
    Then the search results should contain "7534"
    Then the search results should not contain "7535"
    Then close the browser


  Scenario: Delete Records we just created
    Given user is on the "My CollectionSpace" page
      And navigates to the record with identification number "3357"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Acquisition" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button

      And navigates to the record with identification number "7533"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Acquisition" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button

      And navigates to the record with identification number "7534"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Acquisition" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button

      And navigates to the record with identification number "7535"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Acquisition" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button
    Then close the browser
