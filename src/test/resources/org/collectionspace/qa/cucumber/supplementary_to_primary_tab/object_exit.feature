# Created by Jennifer Lynn Be on 01/05/2016
# needs to be tested

@supplementaryprimary
Feature: Supplementary Manual QA - Object Exit

  Scenario: New Record Behavior
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
    Then the "cancel" button "should not" be clickable
    Then the "delete" button "should not" be clickable
    When user clicks the "add" button on the "Cataloging" area to the right
    Then the message "Please save the record you are creating before trying to relate other records to it." should be displayed
    When user clicks the "add" button on the "Procedures" area to the right
    Then the message "Please save the record you are creating before trying to relate other records to it." should be displayed
    Then close the browser

  Scenario: Number Chooser
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
      And clicks Select number pattern
      And selects "Object Exit" from dropdown in "Exit Number" row
    Then enables top and bottom "cancel" buttons
      And clicks Select number pattern
      And selects "Object Exit" from dropdown in "Exit Number" row
    # cannot detect incrementing numbers (next line)
    Then the number pattern incremented by one should be in the "Object Exit" "Exit Number" field
    Then enables top and bottom "cancel" buttons
    Then close the browser

  Scenario: Record Title
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
      And enters "1234" in the "Object Exit" "Exit Number" field
      And enters "John Doe" in the "Object Exit" "Current Owner" field
    Then the titlebar should contain "1234"
    Then the titlebar should contain "John Doe"
    And enters "Cesar Inc" in the "Object Exit" "Current Owner" field
    Then the titlebar should contain "Cesar Inc"
      And clears all fields of the "Object Exit" record
    # following lines do not exist
    Then the titlebar should not contain "1234"
    Then the titlebar should not contain "Cesar Inc"
    Then close the browser

  Scenario: Behavior After Save
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
      And enters "1234" in the "Object Exit" "Exit Number" field
      And clicks the "Save" button
    Then the record is successfully saved
    Then "GMT-0800 (PST)" should be displayed in the message bar
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    Then close the browser

  Scenario: Docking Title Bar
    Given user is on the "Create New" page
      And clicks on the Create button
      And enters "1234" in the "Object Exit" "Exit Number" field
      And clicks the plus to repeat the "Exit Method" form
      And clicks the plus to repeat the "Exit Method" form
      And clicks the plus to repeat the "Exit Method" form
      And clicks the plus to repeat the "Exit Method" form
      And clicks the plus to repeat the "Exit Method" form
      And clicks the plus to repeat the "Exit Method" form
      And clicks the plus to repeat the "Exit Method" form
      And clicks the plus to repeat the "Exit Method" form
      And clicks the plus to repeat the "Exit Method" form
      # cannot enable a scroll to bottom of page, following line is not defined
      And clicks on the "Packing Note" field
    # not sure if titlebar term works for docking bar
    Then the titlebar should contain "1234"
    Then the titlebar should contain "Object Exit"
    Then close the browser

  Scenario: Fold/Unfolding Boxes
    # folding steps do not exist
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
    Given user clicks on the "Fold" symbol next to "Object Exit Information"
    Then the "Object Exit Information" section should "fold"
    Then the "Fold" symbol next to "Object Exit Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object Exit Information"
    Then the "Object Exit Information" section should "unfold"
    Then the "Fold" symbol next to "Object Exit Information" should be a "unfolded" symbol
    Then close the browser

  Scenario: Vocabulary Pivoting
    Given user is on the "Create New" page
      And selects the "Object Exit" radio button on the Create New page
      And clicks on the Create button
      And enters "1.2.3.4.5" in the "Object Exit" "Exit Number" field
      And adds "Abbott Publishing Company" to the "Object Exit" "Current Owner" vocab field
      And clicks the "Save" button
    Then the record is successfully saved
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    # not sure if types should be specified
    Then "Abbott Publishing Company" should appear in the "Terms Used" area
    Then "organization" should appear in the "Terms Used" area
    Then "currentOwner" should appear in the "Terms Used" area
      And clicks on "Abbott Publishing Company" in the "Terms Used" area
    Then the titlebar should contain "Abbott Publishing Company"
    # Used By steps do not exist
    Then "1.2.3.4.5" should in the Used By sidebar
      And clicks on "1.2.3.4.5" in the Used By sidebar
    Then the titlebar should contain "1.2.3.4.5"
      And clicks on the delete button 

      And clicks the confirmation delete button
      And clicks delete confirmation OK button
    Then close the browser

