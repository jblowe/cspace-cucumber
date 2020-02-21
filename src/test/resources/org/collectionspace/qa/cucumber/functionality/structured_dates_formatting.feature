#Created by Forest Yang on 12/302015
# OBJECTS EXIT
@advancedsearch
Feature: Advanced Search - Object Exit

  #Test1
  Scenario: Advanced Search Fields
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button
      And clicks on the Create button
    Then the titlebar should contain "Object Exit"
      And enters "desiderium" in the "Object Exit" "Exit Number" field
      And enters "tishas" in the "Object Exit" "Current Owner" vocab field
      And adds "tishas" to "Local Persons"
      And enters "oar" in the "Object Exit" "Depositor" vocab field
      And adds "oar" to "Local Persons"
      And enters "01-01-2011" in the "Object Exit" "Exit Date" field
      And clicks on the "Object Exit" "Exit Method" field
    Then a drop down list should appear in the "Exit Method" row
      And selects "Courier" from dropdown in "Exit Method" row
      And clicks on the "Object Exit" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And selects "Deaccession" from dropdown in "Exit Reason" row
      And enters "textbook" in the "Object Exit" "Exit Note" field
      And clicks the "Save" button
    Then the record is successfully saved
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters "desiderium" in the "Advanced Search" "Exit Number" field
      And clicks the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Current owner
    Given user is on the "My Collectionspace" page
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters "tishas" in the "Advanced Search" "Current Owner" vocab field
      And clicks on "tishas" from autocomplete options
      And clicks the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Depositor
    Given user is on the "My Collectionspace" page
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters "oar" in the "Advanced Search" "Depositor" vocab field
      And clicks on "oar" from autocomplete options
      And clicks the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Exit Date
    Given user is on the "My Collectionspace" page
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search" 
      And selects "Object Exit" from record type dropdown
      And enters "01-01-2011" in the "Advanced Search" "Exit Date" field
      And clicks on the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Exit Method
    Given user is on the "My Collectionspace" page
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And clicks on the "Advanced Search" "Exit Method" field
    Then a drop down list should appear in the "Exit Method" row
      And selects "Courier" from dropdown in "Exit Method" row
      And clicks on the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Exit Reason
    Given user is on the "My Collectionspace" page
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And clicks on the "Advanced Search" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And selects "Deaccession" from dropdown in "Exit Reason" row
      And clicks on the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Exit Note
    Given user is on the "My Collectionspace" page
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters "textbook" in the "Advanced Search" "Exit Note" field
      And clicks on the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Exit Note (partial)
    Given user is on the "My Collectionspace" page
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search" 
      And selects "Object Exit" from record type dropdown
      And enters "textb*" in the "Advanced Search" "Exit Note" field
      And clicks on the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My Collectionspace" page
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters today's date in the "Modified Date" field
      And clicks the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My Collectionspace" page
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters username in the "Advanced Search" "Record last modified by" field
      And clicks the "Search" button
    Then the search results should contain "desiderium"
    Then close the browser

  #Test2
  Scenario: Boolean based field search
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Object Exit"
      And enters "ThiefintheNight" in the "Object Exit" "Exit Number" field
      And enters "Jane Doe" in the "Object Exit" "Current Owner" vocab field
      And adds "Jane Doe" to "Local Persons"
      And clicks on the "Object Exit" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And selects "Return of Loan" from dropdown in "Exit Reason" row
      And enters "testtest" in the "Exit Note" field
      And clicks the "Save" button
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Object Exit"
      And enters "Bestfriend" in the "Object Exit" "Exit Number" field
      And enters "Jane Doe" in the "Object Exit" "Current Owner" vocab field
      And clicks on "Jane Doe" from autocomplete options
      And clicks on the "Object Exit" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And selects "Return of Loan" from dropdown in "Exit Reason" row
      And enters "testtest" in the "Exit Note" field
      And clicks the "Save" button
    Then the record is successfully saved
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Object Exit"
      And enters "Lifestyle" in the "Object Exit" "Exit Number" field
      And enters "Jane Doe" in the "Object Exit" "Current Owner" vocab field
      And clicks on "Jane Doe" from autocomplete options
      And clicks on the "Object Exit" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And selects "Disposal" from dropdown in "Exit Reason" row
      And enters "testtest" in the "Exit Note" field
      And clicks the "Save" button
    Then the record is successfully saved
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And selects "any (OR)" from the "Field-based Search" drop down
      And enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And clicks on "Jane Doe" from autocomplete options
      And clicks on the "Advanced Search" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And selects "Return of Loan" from dropdown in "Exit Reason" row
      And clicks the "Search" button
    Then the search results should contain "Lifestyle"
    Then the search results should contain "Bestfriend"
    Then the search results should contain "ThiefintheNight"
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And selects "all (AND)" from the "Field-based Search" drop down
      And enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And clicks on "Jane Doe" from autocomplete options
      And clicks on the "Advanced Search" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And selects "Return of Loan" from dropdown in "Exit Reason" row
      And clicks the "Search" button
    Then the search results should not contain "Lifestyle"
    Then the search results should contain "Bestfriend"
    Then the search results should contain "ThiefintheNight"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My Collectionspace" page
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And selects "any (OR)" from record type dropdown
      And enters "testtest" in the "keyword search" field
      And enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And clicks on "Jane Doe" from autocomplete options
      And clicks on the "Advanced Search" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And selects "Return of Loan" from dropdown in "Exit Reason" row
      And clicks the "Search" button
    Then the search results should contain "Lifestyle"
    Then the search results should contain "Bestfriend"
    Then the search results should contain "ThiefintheNight"
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search" 
      And selects "Object Exit" from record type dropdown
      And selects "and (ALL)" from record type dropdown
      And enters "testtest" in the "keyword search" field
      And enters "Jane Doe" in the "Advanced Search" "Current Owner" vocab field
      And clicks on "Jane Doe" from autocomplete options
      And clicks the "Advanced Search" "Exit Reason" field
    Then a drop down list should appear in the "Exit Reason" row
      And selects "Return of Loan" from dropdown in "Exit Reason" row
      And clicks the "Search" button
    Then the search results should not contain "Lifestyle"
    Then the search results should contain "Bestfriend"
    Then the search results should contain "ThiefintheNight"
    Then close the browser

  #Test4
  Scenario: Structured Date Search
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And fills out required fields
      And enters "Lovehoneybear" in the "Object Exit" "Exit Number" field
      And enters "1987" in the "Object Exit" "Exit Date" "Earliest/Single Year" field
      And enters "6" in the "Object Exit" "Exit Date" "Earliest/Single Month" field
      And enters "5" in the "Object Exit" "Exit Date" "Earliest/Single Day" field
      And enters "1993" in the "Object Exit" "Exit Date" "Latest Year" field
      And enters "4" in the "Object Exit" "Exit Date" "Latest Month" field
      And enters "19" in the "Object Exit" "Exit Date" "Latest Day" field
      And clicks the "Save" button
    Then the record is successfully saved
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters "6-5-1986" in the "Advanced Search" "Exit Date" "Earliest/Single Date" field
      And enters "6-7-1994" in the "Advanced Search" "Exit Date" "Latest Date" field
      And clicks the "Search" button
    Then the search results should contain "Lovehoneybear"
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters "6-5-1987" in the "Advanced Search" "Exit Date" "Earliest/Single Date" field
      And enters "4-19-1993" in the "Advanced Search" "Exit Date" "Latest Date" field
      And clicks the "Search" button
    Then the search results should contain "Lovehoneybear"
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters "6-6-1987" in the "Advanced Search" "Exit Date" "Earliest/Single Date" field
      And enters "4-20-1994" in the "Advanced Search" "Exit Date" "Latest Date" field
      And clicks the "Search" button
    Then the search results should contain "Lovehoneybear"
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters "6-3-1987" in the "Advanced Search" "Exit Date" "Earliest/Single Date" field
      And enters "6-4-1987" in the "Advanced Search" "Exit Date" "Latest Date" field
      And clicks the "Search" button
    Then the search results should not contain "Lovehoneybear"
      And clicks the "Advanced search" button
    Then the titlebar should contain "Advanced Search"
      And selects "Object Exit" from record type dropdown
      And enters "4-21-1993" in the "Advanced Search" "Exit Date" "Earliest/Single Date" field
      And enters "4-22-1993" in the "Advanced Search" "Exit Date" "Latest Date" field
      And clicks the "Search" button
    Then the search results should not contain "Lovehoneybear"
    Then close the browser
