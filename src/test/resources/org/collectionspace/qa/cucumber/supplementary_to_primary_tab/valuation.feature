# Created by Jennifer Lynn Be on 01/05/2016
# needs to be tested

@supplementaryprimary
Feature: Supplementary Manual QA - Valuation

  Scenario: New Record Behavior
    Given user is on the "Create New" page
      And selects the "Valuation Control" radio button on the Create New page
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
      And selects the "Valuation Control" radio button on the Create New page
      And clicks on the Create button
      And clicks Select number pattern
      And selects "Valuation Control" from dropdown in "Valuation Control Reference Number" row
    Then enables top and bottom "cancel" buttons
      And clicks Select number pattern
      And selects "Valuation Control" from dropdown in "Valuation Control Reference Number" row
    # cannot detect incrementing numbers (next line)
    Then the number pattern incremented by one should be in the "Valuation Control" "Valuation Control Reference Number" field
    Then enables top and bottom "cancel" buttons
    Then close the browser

  Scenario: Record Title
    Given user is on the "Create New" page
      And selects the "Valuation Control" radio button on the Create New page
      And clicks on the Create button
      And enters "1234" in the "Valuation Control" "Valuation Control Reference Number" field
      And selects "Original Value" from dropdown in "Type" row
    Then the titlebar should contain "Original Value"
    Then the titlebar should contain "testing"
    Then close the browser

  Scenario: Behavior After Save
    Given user is on the "Create New" page
      And selects the "Valuation Control" radio button on the Create New page
      And clicks on the Create button
      And enters "1234" in the "Valuation Control" "Vaulation Control Reference Number" field
      And saves the record
    Then the record is successfully saved
    Then "GMT-0800 (PST)" should be displayed in the message bar
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    Then close the browser

  Scenario: Docking Title Bar
    Given user is on the "Create New" page
      And clicks on the Create button
      And enters "1234" in the "Valuation Control" "Valustion Control Reference Number" field
      And clicks the plus to repeat the "Amounts" form
      And clicks the plus to repeat the "Amounts" form
      And clicks the plus to repeat the "Amounts" form
      And clicks the plus to repeat the "Amounts" form
      And clicks the plus to repeat the "Amounts" form
      And clicks the plus to repeat the "Amounts" form
      And clicks the plus to repeat the "Amounts" form
      And clicks the plus to repeat the "Amounts" form
      And clicks the plus to repeat the "Amounts" form
      # cannot enable a scroll to bottom of page, following line is not defined
      And clicks on the "Renewal Date" field
    # not sure if titlebar term works for docking bar
    Then the titlebar should contain "1234"
    Then the titlebar should contain "Valuation Control"
    Then close the browser

  Scenario: Fold/Unfolding Boxes
    # folding steps do not exist
    Given user is on the "Create New" page
      And selects the "Valuation Control" radio button on the Create New page
      And clicks on the Create button
    Given user clicks on the "Fold" symbol next to "Object Valuation Information"
    Then the "Object Valuation Information" section should fold
    Then the "Fold" symbol next to "Object Valuation Information" should be a folded symbol
    Given user clicks on the "Fold" symbol next to "Object Valuation Information"
    Then the "Object Valuation Information" section should unfold
    Then the "Fold" symbol next to "Object Valuation Information" should be an unfolded symbol
    Then close the browser

  Scenario: Vocabulary Pivoting
    Given user is on the "Create New" page
      And selects the "Valuation Control" radio button on the Create New page
      And clicks on the Create button
      And enters "1.2.3.4.5" in the "Valuation Control" "Valuation Control Reference Number" field
      And adds "Foo Clan" to the "Valuation Control" "Source" vocab field
      And saves the record
    Then the record is successfully saved
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    # not sure if types should be specified
    Then "Foo Clan" should appear in the "Terms Used" area
    Then "person" should appear in the "Terms Used" area
    Then "valueSource" should appear in the "Terms Used" area
      And clicks on "Foo Clan" in the "Terms Used" area
    Then the titlebar should contain "Foo Clan"
    # Used By steps do not exist
    Then "1.2.3.4.5" should in the Used By sidebar
      And clicks on "1.2.3.4.5" in the Used By sidebar
    Then the titlebar should contain "1.2.3.4.5"
      And clicks on the delete button 

      And clicks the confirmation delete button
      And clicks delete confirmation OK button
    Then close the browser

## The remainder of this feature file, below, needs to be converted from narrative (broad declarative steps)
## to testable steps
#
  # Scenario: Keyboard Accessibility
  #   # doesn't work, need to do later
  #    user uses tab through the entire formula
  #    each of the fields should be reachable
  #    the two save buttons and Cancel button should be reachable
  #    the folding functionality should be usable # tab to it and hit space
  #    the focus is visible at all times
  #    the terms used in the right frame should be reachable
