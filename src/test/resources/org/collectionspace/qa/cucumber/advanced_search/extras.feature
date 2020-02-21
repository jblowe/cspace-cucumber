#Created by forest yang on 1/5/2016

@advancedsearch @extras
Feature: Advanced_Search - Extras

  #Prerequisite
  Scenario: set up record
    Given user is on a blank "Object Exit" record
    # Given user is on the "Create New" page
    #   And selects the "Object Exit" radio button on the Create New page
    #   And clicks on the Create button
    Then the titlebar should contain "Object Exit"
      And enters "Remember me 1234" in the "Object Exit" "Exit Number" field
      And enters "James Adams" in the "Object Exit" "Depositor" vocab field #double check
      And clicks on "James Adams" from autocomplete options
      And enters "Goodbye" in the "Object Exit" "Exit Note" field
      And clicks the "Save" button
    Then the record is successfully saved
    Then close the browser

  #Test1
  Scenario: Recent Searches
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
    Then the titlebar should contain "Advanced Search"
    And selects "Object Exit" from the "AdvancedSearch" "record type" dropdown
      And enters "Goodbye" in the "AdvancedSearch" "search" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "Remember me 1234"
      And clicks the "Edit existing advanced search" button #double check
    Then the titlebar should contain "Advanced Search"
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "remember me 1234" in the "Object Exit" "Exit Number" field
      And enters "James Blish" in the "Object Exit" "Depositor" vocab field
      And clicks on "James Blish" from autocomplete options
      And clicks the "Advanced Search search" button
    Then the search results should not contain "Remember me 1234"
      And clicks on the "Recent searches" entry containing "{"initialState":false, "keywords":"goodbye"}" #double check
    Then the search results should contain "Remember me 1234"
      And clicks the "Edit existing advanced search" button #double check
    Then the titlebar should contain "Advanced Search"
    Then "Goodbye" should be in the "Advanced Search" "search" field
      And clicks on the "Recent searches" entry containing "{"initialState":false, "keywords":""}" #double check
    Then the search results should not contain "Remember me 1234"
      And clicks the "Edit existing advanced search" button
    Then the titlebar should contain "Advanced Search"
  #the wiki says goodbye should be in the "keyword search" field.. but according to the instructions. second search didn't put anything in keyword search field.
    #Then "Goodbye" should be in the "keyword search" field
    Then "remember me 1234" should be in the "Object Exit" "Exit Number" field
    Then "James Blish" should be in the "Object Exit" "Depositor" vocab field
    Then close the browser

  Scenario: Record deletion
     Given navigates to the record with identification number "Remember me 1234"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Object Exit" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button
    Then close the browser

    # What i changed: "Advanced Search" "X" field --> "Object Exit" "X" field
    # keyword search --> advanced search search
    # Added } to the end of the dictionaries
