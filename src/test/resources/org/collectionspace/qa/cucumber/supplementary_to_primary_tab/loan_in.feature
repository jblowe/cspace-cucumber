# Created by Jennifer Lynn Be on 01/05/2016
# needs to be tested

@supplementaryprimary
Feature: Supplementary Manual QA - Loan In

  Scenario: New Record Behavior
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the Create New page
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
      And selects the "Loan In" radio button on the Create New page
      And clicks on the Create button
      And clicks Select number pattern
      And selects "Loan In" from dropdown in "Loan In Number" row
    Then enables top and bottom "cancel" buttons
      And clicks Select number pattern
      And selects "Loan In" from dropdown in "Loan In Number" row
    # cannot detect incrementing numbers (next line)
    Then the number pattern incremented by one should be in the "Loan In" "Loan In Number" field
    Then enables top and bottom "cancel" buttons
    Then close the browser

  Scenario: Record Title
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the Create New page
      And clicks on the Create button
      And enters "1234" in the "Loan In" "Loan In Number" field
      And enters "Woody Allen" in the "Loan In" "Lender" vocab field
    Then the titlebar should contain "1234"
    Then the titlebar should contain "Woody Allen"
      And clicks the plus to repeat the "Lender" form
      # not sure if following line works
      And adds "Woodrow Wilson" in the "Lender" field of the "second" "Lender" form
      And selects the additional "Lender" as primary
    Then the titlebar should contain "1234"
    Then the titlebar should contain "Woodrow Wilson"
    Then close the browser

  Scenario: Behavior After Save
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the Create New page
      And clicks on the Create button
      And enters "1234" in the "Loan In" "Loan In Number" field
      And clicks the "Save" button
    Then the record is successfully saved
    Then "GMT-0800 (PST)" should be displayed in the message bar
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    Then close the browser

  Scenario: Docking Title Bar
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the Create New page
      And clicks on the Create button
      And enters "1234" in the "Loan In" "Loan In Number" field
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      And clicks the plus to repeat the "Lender" form
      # following line does not exist
      And clicks on the "Loan In Date" field
    # not sure if titlebar term works for docking bar
    Then the titlebar should contain "1234"
    Then the titlebar should contain "Loan In"
    Then close the browser

  Scenario: Folding/Unfolding Boxes
    # folding steps do not exist
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the Create New page
      And clicks on the Create button
    Given user clicks on the "Fold" symbol next to "Loans In Information"
    Then the "Loans In Information" section should "fold"
    Then the "Fold" symbol next to "Loans In Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Loans In Information"
    Then the "Loans In Information" section should "unfold"
    Then the "Fold" symbol next to "Loans In Information" should be a "unfolded" symbol
    Then close the browser

  Scenario: Vocabulary Pivoting
    Given user is on the "Create New" page
      And selects the "Loan In" radio button on the Create New page
      And clicks on the Create button
      And enters "1.2.3.4.5" in the "Loan In" "Loan In Number" field
      And adds "John Doe" to the "Loan In" "Lender" vocab field
      And clicks the "Save" button
    Then the record is successfully saved
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    # not sure if types should be specified
    Then "John Doe" should appear in the "Terms Used" area
    Then "person" should appear in the "Terms Used" area
    Then "lender" should appear in the "Terms Used" area
      And clicks on "John Doe" in the "Terms Used" area
    Then the titlebar should contain "John Doe"
    # Used By steps do not exist
    Then "1.2.3.4.5" should in the Used By sidebar
      And clicks on "1.2.3.4.5" in the Used By sidebar
    Then the titlebar should contain "1.2.3.4.5"
      And clicks on the delete button 

      And clicks the confirmation delete button
      And clicks delete confirmation OK button
    Then close the browser


