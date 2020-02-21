#Created by Forest Yang

@functionality
Feature: Reporting
  #Test1
  Scenario: Creating a Report
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Acquisition"
      And enters "102938" in the "Acquisition" "Acquisition Reference Number" field
      And enters "Onyx Felidae" in the "Acquisition" "Acquisition Authorizer" vocab field
      And adds to "Local Persons" from vocabulary autocomplete
      And enters "1000-01-01" in the "Acquisition" "Acquisition authorizer date" field
      And enters "Wild Encounter" in the "Acquisition" "Acquisition Date" field 
      And clicks the "Save" button
    Then a dropdown should appear under "Run Report"
  #Probably no stepdefs for phrase : under run report
      And selects "Acquisition Summary (PDF)" from dropdown under "Run Report"
      And clicks the "Run" button
  # lack of confirmation dialog stepdefs
    Then a confirmation dialog should appear
      And clicks the confirmation cancel button
    Then the dialog should be dismissed
      And clicks the "Run" button
    Then a confirmation dialog should appear
      And clicks the confirmation close button
    Then the dialog should be dismissed
      And clicks the "Run" button
    Then a confirmation dialog should appear
      And clicks the "Run" button in the confirmation dialog
  # Inadequate stepdefs for the following sequence
    Then a progress bar should appear
    Then user should not be able to navigate away
    Then a browser dialog should appear 
      And views the report
    Then the report should contain the correct information
    Then close the browser

  #Test3
  Scenario: Running reports in multiple output formats
    Given user is on the "My CollectionSpace" page
      And enters "102938" in the top nav search field
      And selects "Acquisition" from the top nav search record type select field
      And clicks on the top nav search submit button
      And clicks the link to "102938" 
    Then the titlebar should contain "102938"
      And selects "Acquisition Summary (MS Word)" from dropdown under "Run Report"
      And clicks the "Run" button
    Then a confirmation dialog should appear
      And clicks the "Run" button in the confirmation dialog
    Then a progress bar should appear
    Then a browser dialog should appear
      And views the report with "Microsoft Word"
    Then the report should contain the correct information

  #---- Space added for clarity

    Given user is on the "My CollectionSpace" page
      And enters "102938" in the top nav search field
      And selects "Acquisition" from the top nav search record type select field
      And clicks on the top nav search submit button
      And clicks the link to "102938" 
    Then the titlebar should contain "102938"
      And selects "Acquisition Summary (MS Excel)" from dropdown under "Run Report"
      And clicks the "Run" button
    Then a confirmation dialog should appear
      And clicks the "Run" button in the confirmation dialog
    Then a progress bar should appear
    Then a browser dialog should appear
      And views the report with "Microsoft Excel"
    Then the report should contain the correct information

  #---- Space added for clarity  

    Given user is on the "My CollectionSpace" page
      And enters "102938" in the top nav search field
      And selects "Acquisition" from the top nav search record type select field
      And clicks on the top nav search submit button
      And clicks the link to "102938" 
    Then the titlebar should contain "102938"
      And selects "Acquisition Summary (MS PPT)" from dropdown under "Run Report"
      And clicks the "Run" button
    Then a confirmation dialog should appear
      And clicks the "Run" button in the confirmation dialog
    Then a progress bar should appear
    Then a browser dialog should appear
      And views the report with "Microsoft PowerPoint"
    Then the report should contain the correct information

  #---- Space added for clarity  

    Given user is on the "My CollectionSpace" page
      And enters "102938" in the top nav search field
      And selects "Acquisition" from the top nav search record type select field
      And clicks on the top nav search submit button
      And clicks the link to "102938" 
    Then the titlebar should contain "102938"
      And selects "Acquisition Summary (CSV)" from dropdown under "Run Report"
      And clicks the "Run" button
    Then a confirmation dialog should appear
      And clicks the "Run" button in the confirmation dialog
    Then a progress bar should appear
    Then a browser dialog should appear
      And views the report with "Microsoft Excel"
    Then the report should contain the correct information

  #---- Space added for clarity  

    Given user is on the "My CollectionSpace" page
      And enters "102938" in the top nav search field
      And selects "Acquisition" from the top nav search record type select field
      And clicks on the top nav search submit button
      And clicks the link to "102938" 
    Then the titlebar should contain "102938"
      And selects "Acquisition Summary (TSV)" from dropdown under "Run Report"
      And clicks the "Run" button
    Then a confirmation dialog should appear
      And clicks the "Run" button in the confirmation dialog
    Then a progress bar should appear
    Then a browser dialog should appear
      And views the report with "Microsoft Excel"
    Then the report should contain the correct information

  #Test 5
  Scenario: Running a report with unsaved changes
    Given user is on the "My CollectionSpace" page
      And enters "102938" in the top nav search field
      And selects "Acquisition" from the top nav search record type select field
      And clicks on the top nav search submit button
      And clicks the link to "102938" 
    Then the titlebar should contain "102938"
      And enters "10293847" in the "Acquisition" "Acquisition Reference Number" field
      And selects "Acquisition Summary (PDF)" from dropdown under "Run Report"
      And clicks the "Run" button
    Then a dialog containing the message "Save unsaved changes and run this report?" should be displayed
      And clicks the "Cancel" button in the confirmation dialog
    Then the dialog should be dismissed
      And clicks the "Run" button
    Then a dialog containing the message "Save unsaved changes and run this report?" should be displayed
      And clicks the "Save and Run" button in the confirmation dialog
    Then a progress bar should appear
    Then a browser dialog should appear
      And views the report
    Then the report should contain "10293847" 
    Then close the browser

  #Test 8
  Scenario: Running a report prior to saving a new record
    Given user is on the "Create New" page
      And selects the "Acquisition" radio button on the Create New page
      And clicks on the Create button
    Then the titlebar should contain "Acquisition" 
    Then the "Run" button under "Run Report" should be disabled
    Then close the browser

