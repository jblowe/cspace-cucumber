# Created by Cesar Villalobos on 03/08/2016

@rightsidebar
Feature: Right Frame - Show Related Records 


  Scenario: Show Related Records
    Given user is on a blank "Acquisition" record
    And enters "CQA16.1" in the "Acquisition Reference Number" field
    And clicks the "Save" button
    Then the "Show" button in the "Cataloging" area should be disabled
    
    And selects the "Cataloging" tab
    And clicks the "Add record" button
    And clicks the "Create" button
    And enters "CQA16.2" in the "Identification Number" field
    And clicks the "Save" button
    Then the "Related Cataloging Records" area should contain "CQA16.2"

    And selects the "Cataloging" tab
    And clicks the "Add record" button
    And clicks the "Create" button
    And enters "CQA16.3" in the "Identification Number" field
    And clicks the "Save" button
    Then the "Related Cataloging Records" area should contain "CQA16.3"
    Then the "Show" button in the "Cataloging" area should be enabled

    And clicks the "Show" button in the "Cataloging" area

    Then the titlebar should contain "Found 3 records related to CQA16.1" 
    Then the search results should contain "CQA16.2"
    Then the search results should contain "CQA16.3"
    Then the "Edit existing advanced search" button should not be visible
    Then close the browser

  Scenario: Record Deletion for Recycling
    Given user is on the "Create New" page
    And navigates to the record with identification number "CQA16.1"
    And clicks on the delete button 

    Then a delete confirmation dialog should appear
    And clicks on the delete button 
    Then the deletion should be confirmed in a dialog

    And navigates to the record with identification number "CQA16.2"
    And clicks on the delete button 

    Then a delete confirmation dialog should appear
    And clicks on the delete button 
    Then the deletion should be confirmed in a dialog

    And navigates to the record with identification number "CQA16.3"
    And clicks on the delete button 

    Then a delete confirmation dialog should appear
    And clicks on the delete button 
    Then the deletion should be confirmed in a dialog
    
    Then close the browser
