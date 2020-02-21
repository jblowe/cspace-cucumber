# Created by cbn on 9/15/15

@person
Feature: Person Vocabulary Data Entry
  As a user
  I want to be able to enter data into the Person Vocabulary Form
  That Data should persist

  Scenario: User Creates a minimal Basic Person record
    Given user is on the "Create New" page
      And selects the "Person" radio button on the Create New page
    Then a drop down list should appear in the "Person" row
    Then the list in the "Person" row should contain "Local Persons, ULAN Persons"
      And clicks on the Create button
    Then the titlebar should contain "Local Person"
      And enters "Pat Smaller" in the "Person" "Display Name" field
      And clicks the "Save" button
    Then the record is successfully saved
    Then "Pat Smaller" should be in the "Person" "Display Name" field
    Then the titlebar should contain "Local Person"
    Then close the browser

    Scenario: User creates a basic ULAN Person record		
      Given user is on the "Create New" page		
        And selects the "Person" radio button on the Create New page		
      Then a drop down list should appear in the "Person" row		
        And selects "ULAN Persons" from dropdown in "Person" row		
        And clicks on the Create button		
      Then the titlebar should contain "ULAN Persons"		
        And enters "Joe Bean Jr" in the "Person" "Display Name" field		
        And clicks the "Save" button		
      Then the record is successfully saved		
      Then "Joe Bean Jr" should be in the "Person" "Display Name" field		
      Then the titlebar should contain "ULAN Person"		
      Then close the browser		
		
    Scenario: Searching for known records works as expected		
      Given user is on the "My CollectionSpace" page		
        And enters "Joe Bean" in the top nav search field		
        And selects "Person" from the top nav search record type select field		
        And clicks on the top nav search submit button		
      Then the search results should contain "Joe Bean; Joe Bean Jr"		
      Then close the browser		
		
    Scenario Outline: Scoping search for known records works as expected		
      Given user is on the "My CollectionSpace" page		
        And enters "<searchTerm>" in the top nav search field		
        And selects "<recordType>" from the top nav search record type select field		
        And selects "<vocabulary>" from the top nav search vocabulary select field		
        And clicks on the top nav search submit button		
      Then the search results should contain "<result>"		
        And clicks on result with text "<result>"		
      Then "<result>" should be in the "Person" "Display Name" field		
      Then the titlebar should contain "<vocabulary>"		
      Then close the browser		
      Examples:		
      | searchTerm | recordType | vocabulary       | result                |		
      | Joe Bean   | Person     | Local Persons    | Joe Bean              |		
      | Joe Bean   | Person     | ULAN Persons     | Joe Bean Jr           |		
		
    Scenario Outline: Person Vocab Terms should be suggested in Cataloging record		
      Given user is on the "Create New" page		
        And selects the "Cataloging" radio button on the Create New page		
        And clicks on the Create button		
      Then the titlebar should contain "Cataloging"		
        And fills out required fields		
        And enters "<text>" in the "Cataloging" "<field>" vocab field		
      Then the vocabulary autocomplete should contain "<options>"		
        And clicks on "<choice>" from autocomplete options		
        And clicks the "Save" button		
      Then the record is successfully saved		
      Then "<choice>" should be in the "Cataloging" "<field>" vocab field		
      Then "<choice>" should appear in the "Terms Used" area		
        And clicks on "<choice>" in the "Terms Used" area		
      Then the titlebar should contain "Person"		
      Then "<choice>" should be in the "Person" "Display Name" field		
      Then close the browser		
      Examples:		
      | text  | field  | options             | choice      |		
      | Joe   | Person |Joe Bean; Joe Bean Jr| Joe Bean    |		
      | Joe   | Person |Joe Bean; Joe Bean Jr| Joe Bean Jr |		
		
    Scenario: Display Name		
      Given user is on a blank "Person" record		
        And enters "James" in the "Person" "Forename" field		
        And clicks the "Save" button		
      Then the error message bar should appear with "Please specify a Display Name"		
        And clicks OK to cancel error message		
        And enters "James Earl Jones" in the "Person" "Display Name" field		
        And removes focus from "Person" "Display Name" field		
      Then the titlebar should contain "James Earl Jones"		
        And clicks the plus to repeat the "Person Term Group" form		
      Then an additional "Person Term Group" record should be present		
        And adds "JEJ" in the "Display Name" field of the "second" "Person Term Group" form		
        And selects the additional "Person Term Group" as primary		
      Then the titlebar should contain "JEJ"		
      Then close the browser		
		
    Scenario: Create Person record with All fields filled in, then empty it		
      Given user is on a blank "Person" record		
        And repeats all repeatable fields		
        And fills out required fields		
        And clicks the "Save" button		
      Then the record is successfully saved		
      Then all fields in "Person" record should be filled in		
        And clears all fields of the "Person" record		
        And clicks the "Save" button		
      Then all fields of the "Person" record should be empty		
      Then close the browser		
		
    Scenario: Create then delete a record		
      Given user is on a blank "Person" record		
        And enters "Delete Me" in the "Person" "Display Name" field		
      Then the "delete" button "should not" be clickable		
        And clicks the "Save" button		
      Then the record is successfully saved		
        And clicks on the delete button 
		
      Then a delete confirmation dialog should appear		
        And clicks cancel button		
      Then "Delete Me" should be in the "Person" "Display Name" field		
        And clicks on the delete button 
		
      Then a delete confirmation dialog should appear		
        And clicks close button		
      Then "Delete Me" should be in the "Person" "Display Name" field		
        And clicks on the delete button 
		
      Then a delete confirmation dialog should appear		
        And clicks the confirmation delete button		
      Then the deletion should be confirmed in a dialog		
        And clicks delete confirmation OK button		
        And enters "Delete Me" in the top nav search field		
        And clicks on the top nav search submit button		
      Then the search results should not contain "Delete Me"		
      Then close the browser		
		
		
   # Scenario: Cannot delete Person related to another record		
   #   Given user is on the "My CollectionSpace" page		
   #   And enters "Joe Bean" in the top nav search field		
   #   And selects "<recordType>" from the top nav search record type select field		
		
   # Scenario: All of the sections should be collapsible		
   #  Given user is on a blank "Person" record
