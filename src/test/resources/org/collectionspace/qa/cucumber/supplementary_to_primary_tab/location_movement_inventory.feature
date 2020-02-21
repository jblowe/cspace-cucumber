# Created by Jennifer Lynn Be on 01/05/2016
# needs to be tested

@supplementaryprimary
Feature: Supplementary Manual QA - Location-Movement-Inventory

  Scenario: New Record Behavior
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
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
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And clicks Select number pattern
      And selects "Inventory" from dropdown in "Reference Number" row
    Then enables top and bottom "cancel" buttons
      And clicks Select number pattern
      And selects "Inventory" from dropdown in "Reference Number" row
    # cannot detect incrementing numbers (next line)
    Then the number pattern incremented by one should be in the "Location/Movement/Inventory" "Reference Number" field
    Then enables top and bottom "cancel" buttons
    Then close the browser

  Scenario: Record Title
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And adds "New York Theater" to the "Location/Movement/Inventory" "Current Location" vocab field
      And adds "2016-01-01" to the "Location/Movement/Inventory" "Location Date" field
    Then the titlebar should contain "New York Theater"
    Then the titlebar should contain "2016-01-01"
    Then close the browser

  Scenario: Behavior After Save
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And adds "New York Theater" to the "Location/Movement/Inventory" "Current Location" vocab field
      And clicks the "Save" button
    Then the record is successfully saved
    Then "GMT-0800 (PST)" should be displayed in the message bar
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    Then close the browser

  Scenario: Docking Title Bar
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And adds "New York Theater" to the "Location/Movement/Inventory" "Current Location" vocab field
      And adds "2016-01-01" to the "Location/Movement/Inventory" "Location Date" field
      # cannot enable a scroll to bottom of page
      And clicks on the "Contact" field
    # not sure if titlebar term works for docking bar
    Then the titlebar should contain "New York Theater"
    Then the titlebar should contain "2016-01-01"
    Then close the browser

  Scenario: Folding and Unfolding Boxes
    # folding steps do not exist
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
    Given user clicks on the "Fold" symbol next to "Object Location Information"
    Then the "Object Location Information" section should "fold"
    Then the "Fold" symbol next to "Object Location Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object Location Information"
    Then the "Object Location Information" section should "unfold"
    Then the "Fold" symbol next to "Object Location Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Movement Information"
    Then the "Movement Information" section should "fold"
    Then the "Fold" symbol next to "Movement Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Movement Information"
    Then the "Movement Information" section should "unfold"
    Then the "Fold" symbol next to "Movement Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Inventory Information"
    Then the "Inventory Information" section should "fold"
    Then the "Fold" symbol next to "Inventory Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Inventory Information"
    Then the "Inventory Information" section should "unfold"
    Then the "Fold" symbol next to "Inventory Information" should be a "unfolded" symbol
    Then close the browser

  Scenario: Vocabulary Pivoting
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And enters "1.2.3.4.5" in the "Location/Movement/Inventory" "Reference Number" field
      And adds "New York Theater" to the "Location/Movement/Inventory" "Current Location" vocab field
      And clicks the "Save" button
      Then the message "Please note that "Hard Save" will make the record read-only." should be displayed
      And clicks the "Save" button
    Then the record is successfully saved
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    # not sure if types should be specified
    Then "New York Theater" should appear in the "Terms Used" area
    Then "organization" should appear in the "Terms Used" area
    Then "currentLocation" should appear in the "Terms Used" area
      And clicks on "New York Theater" in the "Terms Used" area
    Then the titlebar should contain "New York Theater"
    # Used By steps do not exist
    Then "1.2.3.4.5" should appear in the Used By sidebar
      And clicks on "1.2.3.4.5" in the Used By sidebar
    Then the titlebar should contain "1.2.3.4.5"
      And clicks on the delete button 

      And clicks the confirmation delete button
      And clicks delete confirmation OK button
    Then close the browser

  Scenario: Hard Save
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And enters "1.2.3.4.5" in the "Location/Movement/Inventory" "Reference Number" field
      And adds "New York Theater" to the "Location/Movement/Inventory" "Current Location" vocab field
      And clicks the "Save" button
    Then the message "Please note that "Hard Save" will make the record read-only." should be displayed
      And clicks the "Save" button
    Then the record is successfully saved
      And adds "2016-01-01" to the "Location/Movement/Inventory" "Location Date" field
      And clicks the "Save" button
    Then the message "Please note that "Hard Save" will make the record read-only." should be displayed
      # hard save not implemented
      And hard clicks the "Save" button
    Then the record is read-only
    Given user is on the "My CollectionSpace" page
      And enters "New York Theater" in the top nav search field
      And selects "Location/Movement/Inventory" from the top nav search record select type field
      And clicks on the top nav search submit button
    # locked not implemented
    Then the search results should contain a locked "1.2.3.4.5" 
      And clicks on result with text "1.2.3.4.5"
    # not implemented read-only
    Then the record should be read-only

  Scenario: Hard Save with Related Records
    Given user is on the "Create New" page
      And selects the "Location/Movement/Inventory" radio button on the Create New page
      And clicks on the Create button
      And enters "123123123" in the "Location/Movement/Inventory" "Reference Number" field
      And adds "Metro Pictures Corporation" to the "Location/Movement/Inventory" "Current Location" vocab field
      And clicks the "Save" button
    Then the message "Please note that "Hard Save" will make the record read-only." should be displayed
      And clicks the "Save" button
    Then the record is successfully saved
      And selects the "Acquisitions" tab
      # not stepdefs
      And selects "Add record" button
      And selects "create" button
      And enters "456.456.456" in the "Acquisition" "Acquisition Reference Number" field
      And clicks the "Save" button
    Then the record is successfully saved
      And selects the "Cataloging" tab
      # not stepdefs
      And selects "Add record" button
      And selects "create" button
      And enters "987.987.987" in the "Cataloging" "Identification Number" field
      And clicks the "Save" button
    Then the record is successfully saved
      And selects the "Current Record" tab
      And clicks the "Save" button
    Then the message "Please note that "Hard Save" will make the record read-only." should be displayed
      # hard save not implemented
      And hard clicks the "Save" button
    Then the record is read-only
    Given user is on the "My CollectionSpace" page
      And enters "Metro Pictures Corporation" in the top nav search field
      And selects "Location/Movement/Inventory" from the top nav search record select type field
      And clicks on the top nav search submit button
    # locked not implemented
    Then the search results should contain a locked "123123123" 
      And clicks on result with text "123123123"
    # not implemented read-only
    Then the record should be read-only
    And selects the "Acquisitions" tab
    And clicks on result with text "456.456.456"
    And enters "3242342" in the "Acquisition" "Acquisition Reference Number" field
      And clicks the "Save" button
    Then the record is successfully saved
      And selects the "Cataloging" tab
      And clicks on result with text "987.987.987"
      And enters "3rrew42342" in the "Cataloging" "Identification Number" field
      And clicks the "Save" button
    Then the record is successfully saved

