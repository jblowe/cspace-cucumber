# Created by Regina Xu on 10/27/15
# Updated 2/26/16: need to match step defs

@supplementaryprimary
Feature: Supplementary Manual QA - Acquisition
  
  Scenario: New Record Behavior
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
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
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
      And clicks Select number pattern
      And selects "Accession" from dropdown in "Acquisition Reference Number" row
    Then enables top and bottom "cancel" buttons
      And clicks Select number pattern
      And selects "Accession" from dropdown in "Acquisition Reference Number" row
    # cannot detect incrementing numbers (next line)
    Then the number pattern incremented by one should be in the "Acquisition" "Acquisition Reference Number" field
    Then enables top and bottom "cancel" buttons
    Then close the browser

  Scenario: Record Title
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
      And enters "1234" in the "Acquisition" "Acquisition Reference Number" field
      And enters "Berkley Publishing Group" in the "Acquisition" "Acquisition Source" vocab field
    Then the titlebar should contain "1234"
    Then the titlebar should contain "Berkley Publishing Group"
      And clicks the plus to repeat the "Acquisition Source" form
      And adds "Chemtoy Corporation" in the "Acquisition Source" field of the "second" "Acquisition Source" form
      And selects the additional "Acquisition Source" as primary
    Then the titlebar should contain "1234"
    Then the titlebar should contain "Chemtoy Corporation"
      And enters "John Doe" in the "Acquisition" "Owner" vocab field
    Then the titlebar should contain "Chemtoy Corporation"
      And clears all fields of the "Acquisition" record
      And enters "John Doe" in the "Acquisition" "Owner" vocab field
    Then the titlebar should contain "John Doe"
    Then close the browser

  Scenario: Behavior After Save
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
      And enters "1234" in the "Acquisition" "Acquisition Reference Number" field
      And clicks the "Save" button
    Then the record is successfully saved
    Then "GMT-0800 (PST)" should be displayed in the message bar
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    Then close the browser

  Scenario: Docking Title Bar
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
      And enters "1234" in the "Acquisition" "Acquisition Reference Number" field
      # following line does not exist
      And clicks on the "Field collection event name" field
    # not sure if titlebar term works for docking bar
    Then the titlebar should contain "1234"
    Then the titlebar should contain "Acquisition"
    Then close the browser

  Scenario: Fold/Unfolding Boxes
    # folding steps do not exist
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
    Given user clicks on the "Fold" symbol next to "Acquisition Information"
    Then the "Acquisition Information" section should "fold"
    Then the "Fold" symbol next to "Acquisition Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Acquisition Information"
    Then the "Acquisition Information" section should "unfold"
    Then the "Fold" symbol next to "Acquisition Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Object Collection Information"
    Then the "Object Collection Information" section should "fold"
    Then the "Fold" symbol next to "Object Collection Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object Collection Information"
    Then the "Object Collection Information" section should "unfold"
    Then the "Fold" symbol next to "Object Collection Information" should be a "unfolded" symbol
    Then close the browser

  Scenario: Vocabulary Pivoting
    Given user is on the "Create New" page
      And clicks on the Create button
      And enters "1.2.3.4.5" in the "Acquisition" "Identification Number" field
      And adds "John Doe" to the "Acquisition" "Owner" vocab field
      And clicks the "Save" button
    Then the record is successfully saved
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    # not sure if types should be specified
    Then "John Doe" should appear in the "Terms Used" area
    Then "person" should appear in the "Terms Used" area
    Then "owner" should appear in the "Terms Used" area
      And clicks on "John Doe" in the "Terms Used" area
    Then the titlebar should contain "John Doe"
    # Used By steps do not exist
    Then "1.2.3.4.5" should appear in the Used By sidebar
      And clicks on "1.2.3.4.5" in the Used By sidebar
    Then the titlebar should contain "1.2.3.4.5"
      And clicks on the delete button 

      And clicks the confirmation delete button
      And clicks delete confirmation OK button
    Then close the browser
    

