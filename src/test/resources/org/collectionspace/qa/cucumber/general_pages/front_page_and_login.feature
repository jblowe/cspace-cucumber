# Created by xxx on mo/day/2015

@generalpages @frontpageandlogin
Feature: #Enter feature name here
  # Enter feature description here

  Scenario: User Creates a minimal Basic Person record
    Given user is on the "Create New" page
      And selects the "Person" radio button on the Create New page
    Then a drop down list should appear in the "Person" row
    Then the list in the "Person" row should contain "Local Persons, ULAN Persons"
      And clicks on the Create button
    Then the vocabulary name in the titlebar should contain "Local Person"
      And enters "Rob Miller_y" in the "Person" "Display Name" field
      And clicks the "Save" button
    Then the record is successfully saved
    Then "Rob Miller_y" should be in the "Person" "Display Name" field
    Then the vocabulary name in the titlebar should contain "Local Person"
    Then close the browser
