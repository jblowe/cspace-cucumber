# Created by Jennifer Be on 12/23/2015
# needs to be tested

@supplementaryprimary
Feature: Supplementary Manual QA - Cataloging

  Scenario: New Record Behavior
    Given user is on the "Create New" page
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
      And clicks on the Create button
      And clicks Select number pattern
      And selects "Intake" from dropdown in "Identification Number" row
    Then enables top and bottom "cancel" buttons
      And clicks Select number pattern
      And selects "Intake" from dropdown in "Identification Number" row
    # cannot detect incrementing numbers (next line)
    Then the number pattern incremented by one should be in the "Cataloging" "Identification Number" field
    Then enables top and bottom "cancel" buttons
    Then close the browser

  Scenario: Record Title
    Given user is on the "Create New" page
      And clicks on the Create button
      And enters "1234" in the "Cataloging" "Identification Number" field
      And enters "testing" in the "Cataloging" "Object Name" field
    Then the titlebar should contain "1234"
    Then the titlebar should contain "testing"
      And enters "sample" in the "Cataloging" "Title" field
    Then the titlebar should contain "1234"
    Then the titlebar should contain "sample"
      And clicks the plus to repeat the "Title" form
      # not sure if following line works
      And adds "sample2" in the "Title" field of the "second" "Title" form
      And selects the additional "Title" as primary
    Then the titlebar should contain "1234"
    Then the titlebar should contain "sample2"
    Then close the browser

  Scenario: Behavior After Save
    Given user is on the "Create New" page
      And clicks on the Create button
      And enters "1234" in the "Cataloging" "Identification Number" field
      And clicks the "Save" button
    Then the record is successfully saved
    Then "GMT-0800 (PST)" should be displayed in the message bar
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    Then close the browser

  Scenario: Docking Title Bar
    Given user is on the "Create New" page
      And clicks on the Create button
      And enters "1234" in the "Cataloging" "Identification Number" field
      # cannot enable a scroll to bottom of page
      And clicks on the "Production Date" field
    # not sure if titlebar term works for docking bar
    Then the titlebar should contain "1234"
    Then the titlebar should contain "Cataloging"
    Then close the browser

  Scenario: Structured Date
    # not sure how to address pop-up dialog features/checks
    Given user is on the "Create New" page
      And clicks on the Create button
      And enters "1234" in the "Cataloging" "Identification Number" field
      # following line does not exist
      And clicks on the "Production Date" field
      And enters "1500" in the "Cataloging" "Display Date" field
      And clicks the "Save" button
    Then "1500" should be in the "Cataloging" "Production Date" field

  Scenario: Folding and Unfolding Boxes
  # folding steps do not exist
    Given user is on the "Create New" page
      And clicks on the Create button
    Given user clicks on the "Fold" symbol next to "Object Identification Information"
    Then the "Object Collection Information" section should "fold"
    Then the "Fold" symbol next to "Object Collection Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object Identification Information"
    Then the "Object Collection Information" section should "unfold"
    Then the "Fold" symbol next to "Object Collection Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Object Description Information"
    Then the "Object Description Information" section should "fold"
    Then the "Fold" symbol next to "Object Description Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object Description Information"
    Then the "Object Description Information" section should "unfold"
    Then the "Fold" symbol next to "Object Description Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Object Production Information"
    Then the "Object Production Information" section should "fold"
    Then the "Fold" symbol next to "Object Production Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object Production Information"
    Then the "" section should "unfold"
    Then the "Fold" symbol next to "Object Production Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Object History and Association Information"
    Then the "Object History and Association Information" section should "fold"
    Then the "Fold" symbol next to "Object History and Association Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object History and Association Information"
    Then the "" section should "unfold"
    Then the "Fold" symbol next to "Object History and Association Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Object Owner's Contribution Information"
    Then the "" section should "fold"
    Then the "Fold" symbol next to "Object Owner's Contribution Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object Owner's Contribution Information"
    Then the "" section should "unfold"
    Then the "Fold" symbol next to "Object Owner's Contribution Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Object Viewer's Contribution Information"
    Then the "Object Viewer's Contribution Information" section should "fold"
    Then the "Fold" symbol next to "Object Viewer's Contribution Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object Viewer's Contribution Information"
    Then the "" section should "unfold"
    Then the "Fold" symbol next to "Object Viewer's Contribution Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Reference Information"
    Then the "Reference Information" section should "fold"
    Then the "Fold" symbol next to "Reference Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Reference Information"
    Then the "Reference Information" section should "unfold"
    Then the "Fold" symbol next to "Reference Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Object Collection Information"
    Then the "Object Collection Information" section should "fold"
    Then the "Fold" symbol next to "Object Collection Information" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object Collection Information"
    Then the "Object Collection Information" section should "unfold"
    Then the "Fold" symbol next to "Object Collection Information" should be a "unfolded" symbol
    Given user clicks on the "Fold" symbol next to "Object Hierarchy"
    Then the "Object Hierarchy" section should "fold"
    Then the "Fold" symbol next to "Object Hierarchy" should be a "folded" symbol
    Given user clicks on the "Fold" symbol next to "Object Hierarchy"
    Then the "Object Hierarchy" section should "unfold"
    Then the "Fold" symbol next to "Object Hierarchy" should be a "unfolded" symbol
    Then close the browser

  Scenario: Alternating Shading for Repeated Groups
    Given user is on the "Create New" page
      And clicks on the Create button
      And clicks the plus to repeat the "Title" form
      And clicks the plus to repeat the "Title" form
     # cannot detect alternating colors
    Then the "Title" group should alternate shading
      And clicks the plus to repeat the "Dimensions" form
      And clicks the plus to repeat the "Dimensions" form
    Then the "Dimensions" group should alternate shading
    Then close the browser

  Scenario: Vocabulary Pivoting
    Given user is on the "Create New" page
      And clicks on the Create button
      And enters "1.2.3.4.5" in the "Cataloging" "Identification Number" field
      And adds "Object" to the "Cataloging" "Concept" vocab field
      And clicks the "Save" button
    Then the record is successfully saved
    Then disables top and bottom "cancel" buttons
    Then enables top and bottom "delete" buttons
    # not sure if types should be specified
    Then "Object" should appear in the "Terms Used" area
    Then "concept" should appear in the "Terms Used" area
    Then "contentConcept" should appear in the "Terms Used" area
      And clicks on "Object" in the "Terms Used" area
    Then the titlebar should contain "Object"
    # Used By steps do not exist
    Then "1.2.3.4.5" should appear in the Used By sidebar
      And clicks on "1.2.3.4.5" in the Used By sidebar
    Then the titlebar should contain "1.2.3.4.5"
      And clicks on the delete button 

      And clicks the confirmation delete button
      And clicks delete confirmation OK button
    Then close the browser


