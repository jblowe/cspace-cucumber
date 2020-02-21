#Created by Forest Yang on 12/22/2015

@administration
Feature: Term List Management

  #Test1 
  Scenario: Editing a term list name, source, and description
    Given user is on the "Administration" page
      And selects the "Term List Management" tab
      And clicks on a term list
    Then the "Cancel changes" button "should not" be clickable
      And enters "Changedname" in the "Administration" "Name" field
      And enters "Changeddescription" in the "Administration" "Description" field
      And enters "Changedsource" in the "Administration" "Source" field
      And clicks the "+" button above the "Terms (values)" table
      And clicks the "Cancel changes" button
    Then the fields should return to original values
      And enters "Changedname" in the "Administration" "Name" field
      And enters "Changeddescription" in the "Administration" "Description" field
      And enters "Changedsource" in the "Administration" "Source" field
      And clicks the "+" button above the "Terms (values)" table
      And clicks on the "Save" button
    Then "Changedname" should be in the "Administration" "Name" field
    Then "Changeddescription" should be in the "Administration" "Description" field
    Then "Changedsource" should be in the "Administration" "Source" field
  #Test2: Inactivating a term, continued from above
      And selects "Inactive" from dropdown in a term row under "Status"
      And clicks on the "Save" button
    Then the term's status should be displayed as "Inactive"
      And navigates to a procedure containing the term list
      And clicks relevant field
    Then the dropdown should contain the term list
    Then the term list should be greyed out
    Given user is on the "Administration" page
      And selects the "Term List Management" tab
      And clicks on the same term list
      And selects "Active" from dropdown in term row under "Status"
      And clicks on the "Save" button
    Then the term's status should be displayed as "Active"
      And navigates to a procedure containing the term list
      And clicks relevant field
    Then the dropdown should contain the term list
    Then the term list "should" be clickable
    Then close the browser

  #Test3
  Scenario: Adding a term
    Given user is on the "Administration" page
      And selects the "Term List Management" tab
      And clicks on a term list
      And clicks the "+" button above the "Terms (values)" table
    Then a new row should appear in the "Terms (values)" table
      And fills out the row
      And selects "Active" from dropdown in term row under "Status"
      And clicks on the "Save" button
    Then the "Terms (values)" table should contain the new term
    Then the "Terms (values)" table should be in alphabetical order
    Then close the browser

  #Test 4
  Scenario: Editing an existing term
    Given user is on the "Create New" page
      And selects the "Intake" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Intake"
      And enters "Existing Term Test" in the "Intake" "Intake Entry Number" field
      And enters "found dead" in the "Intake" "Field Collection Method" field
      And clicks the "Save" button
    Given user is on the "Administration" page
      And selects the "Term List Management" tab
      And clicks on "collectionmethod" term list
      And changes "Term Name" for "found dead" to "found deadest"
      And clicks on the "Save" button
      And enters "Existing Term Test" in the top nav search field
      And selects "Intake" from the top nav search record type select field
      And clicks on the top nav search submit button
      And clicks on result with text "Existing Term Test"
    Then the titlebar should contain "Intake"
    Then "found deadest" should be in the "Intake" "Field Collection Method" field
    Then close the browser

  #Test 5
  Scenario: Deleting a term
    Given user is on the "Administration" page
      And selects the "Term List Management" tab
      And clicks on a term list
      And clicks the "x" button in the first row of the "Terms (values)" table
    Then the "Terms (values)" table should not contain the term
      And clicks on the "Save" button
    Then the "Terms (values)" table should not contain the term
      And navigates to a procedure containing the term list
      And clicks relevant field
    Then the dropdown should not contain the term
    Then close the term

  #Test 6
  Scenario: Attempting to delete an in-use term
    Given user is on the "Create New" page
      And selects the "Intake" radio button on the Create New page
      And clicks on the Create button
      And enters "Fillmeup" in the "Intake" "Intake Entry Number" field
      And clicks the "Save" button
    Given user is on the "Administration" page
      And selects the "Term List Management" tab
      And clicks on "Entry Method" 
    Then "intake:intake-entryMethod" should be in the "Used By(field)" field
      And clicks the "x" button to the right of "In Person"
    Then an error message should appear
      And clicks the "Ok" button
    Then close the browser


  #Test 7
  Scenario: Changing the default value of used by field and testing null value
    Given user is on the "Administration" page
      And selects the "Term List Management" tab
      And clicks on a term list
      And changes default value of a row in "Used By (field)" list
      And checks the checkbox under "Include null value"
      And clicks on the "Save" button
    Then the default value should still be selected
    Then the checkbox under "Include null value" should be checked
      And navigates to a procedure containing the term list
    Then the term list should have the new default
    Then the term list should contain a "Please select a value" entry
    Given user is on the "Administration" page
      And selects the "Term List Management" tab
      And clicks on the same term list
      And changes default value of a row in "Used By (field)" list
      And unchecks the checkbox under "Include null value"
      And clicks on the "Save" button
      And navigates to a procedure containing the term list
    Then the term list should have the new default
    Then the term list should not contain a "Please select a value" entry
    Then close the browser
