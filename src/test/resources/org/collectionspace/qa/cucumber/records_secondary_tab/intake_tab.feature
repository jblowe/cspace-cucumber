# Created Nov 5, 2015 by Cesar Villalobos

@recordssecondarytab
Feature: Intake Tab 
  
  # Test 1
  Scenario: user will be working in the Intake Secondary Tab. They Will then try to add a record and is able to dismiss the dialog.

    Given user is on the "My CollectionSpace" page 
    And navigates to the record with identification number "04131995"
    And selects the "Intake" tab 
    Then "041319951" should appear in the "Related Intake Records" area

    And navigates to the record with identification number "CQA110_E"
    And selects the "Intake" tab 
    Then the "Related Intake Records" area should be empty


  # Begin Test 3:
    And clicks the "Add record" button 
    And clicks the "close" button 
    Then no changes to the record should occur 

    And clicks the "Add record" button
    And presses the "ESC" key 
    Then no changes to the record should occur 

  #Test 5 Scenario: Trying to add search for and add multiple intake records
    And clicks the "Add record" button 
    And clicks the "search" button
    Then the search results should contain "041319951.2" 
    Then the search results should contain "041319951.3"

    And selects the box with result "041319951.3" 
    And selects the box with result "041319951.2" 
    And clicks the "Add to current record" button 
    Then the dialog should be dismissed

    Then "041319951.2" should appear in the "Related Intake Records" area 
    Then "041319951.3" should appear in the "Related Intake Records" area 
    Then "041319951.2" should appear in the "Procedures" area 
    Then "041319951.3" should appear in the "Procedures" area
    
    And clicks on result with text "041319951.2"
    Then an "Edit Intake Record" form should be displayed 
    Then the "Intake Entry Number" field should contain "041319951.2"

    And clicks on the result with text "041319951.3"
    Then an "Edit Intake Record" form should be displayed 
    Then the "Intake Entry Number" field should contain "041319951.3"

    And clicks the "Delete this relation." button
    Then a delete confirmation dialog should appear
    And clicks on the delete button 
    Then the deletion should be confirmed in a dialog
    Then "041319951.3" should not appear in the "Related Intake Records" area 

    And clicks on result with text "041319951.2"
    And clicks the "Delete this relation." button
    Then a delete confirmation dialog should appear 
    And clicks on the delete button 
    Then the deletion should be confirmed in a dialog
    Then "041319951.2" should not appear in the "Related Intake Records" area 



  # Test 7
  # this test might be wrong because it says that a new line should should be displayed below the listing of records
  Scenario: Warning when nagivating away form the new intake record
    Given user is in the "My CollectionSpace" page
    And enters "04131995" in the top nav search field
    And clicks on the top nav search submit button
    Then the search results should contain "04131995"
    And clicks on result with text "04131995"
    Then "04131995" should be in the "Identification Number" field
    And selects the "Intake" tab 
    
    ###### VARIATION A ######
    And clicks the "Add record" button
    And clicks on the Create button

    Then the message "Creating new record..." should be displayed
    Then the "Intake Entry Number" field should be empty
    And enters "041319953.4" in the "Intake Entry Number" field
    And selects the "Current Record" tab
 
    
    Then a leave confirmation dialog should appear 
    And clicks close button  
    Then the dialog should be dismissed 
    And clicks cancel button 
    Then the "Intake Entry Number" should contain "04131995.4"

    And selects the "Current Record" tab
    And clicks the "Don't save" button 
    And enters "041319953.4" in the top nav search field
    Then the search results should not contain "041319953.4"

    

    And navigates to the record with identification number "04131995"
    And selects the "Intake" tab 

    And clicks the "Add record" button
    And clicks on the Create button
    And enters "041319953.4" in the "Intake Entry Number" field 
    And selects the "Current Record" tab
    Then a leave confirmation dialog should appear
    And clicks on the "Save" button
    And selects the "Intake" tab 
    Then "041319953.4" should appear in the "Related Intake Records" area 

    And navigates to the record with identification number "041319953.4"
    And clicks on the delete button 

    Then a delete confirmation dialog should appear
    And clicks on the delete button 
    Then the deletion should be confirmed in a dialog
    Then close the browser

  # Test 9
  Scenario: Testing the cancel changes button
    Given user is in the "My CollectionSpace" page
    And navigates to the record with identification number "04131995"
    Then "04131995" should be in the "Identification Number" field

    And selects the "Intake" tab 
    And clicks the "Add record" button
    And clicks on the Create button
    # Then the dialog should be dismissed

    Then the message "Creating new record..." should be displayed
    Then the "cancel changes" button at the "top" of the page "should not" be clickable 
    Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
    And enters "04131995.5" in the "Intake Entry Number" field
    
    Then the "cancel changes" button at the "top" of the page "should" be clickable 
    Then the "cancel changes" button at the "bottom" of the page "should" be clickable  
    And clicks the "cancel changes" button 
    Then the "Intake Entry Number" field should be empty


    And enters "04131995.5" in the "Intake Entry Number" field
    And clicks on the "Save" button
    Then the "cancel changes" button at the "top" of the page "should not" be clickable 
    Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   
    And clicks the "Go to record" button
    And clicks the "Delete" button 
    Then a delete confirmation dialog should appear
    And clicks the confirmation delete button
    Then the deletion should be confirmed in a dialog
    Then close the browser


    # Test 11 
    Scenario: Check Intake Entry Number and successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "04131995"
        And selects the "Intake" tab 

        And clicks the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify an Intake Entry Number" should appear 

        And enters "CQA110_11" in the "Intake Entry Number" field
        And clicks on the "Save" button

        Then the message "Relation successfully created." should appear
        Then "CQA110_11" should appear in the "Related Intake Records" area

        And enters "2016-01-31" in the "Entry Date" field
        And selects "Enquiry" from the "Entry Reason" drop down
        And selects "Found on doorstep" from the "Entry Method" drop down
        And enters "Cesar Villalobos" in the "Depositor" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "None" in the "Depositor Requirements" field
        And enters "Cesar Villalobos" in the "Current Owner" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Testing CQA_110" in the "Entry Note" field
        And enters "Testing testing" in the "Packing Note" field
        And enters "2016-02-31" in the "Return Date" field
        And enters "2015-12-31" in the "Field Collection Date" field
        And enters "California" in the "Field collection place" field
        And selects "commissioned" from the "Field collection Method" drop down
        And enters "This is a test for CQA-110" in the "Field collection note" field
        And enters "110" in the "Field collection number" field
        And enters "CQA-110 Testing" in the "Field collection event name"
        And enters "Cesar Villalobos" in the "Field collection source" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Field collector" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Valuer" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Inc" in the "Insurer" field
        And selects "Cesar Inc" from autocomplete options
        And enters "110.1" in the "Reference Number" field
        And enters "110110110" in the "Policy Number" field
        And enters "2016-01-04" in the "Renewal Date" field
        And enters "Taking care of CQA-110" in the "Insurance Note" field
        And selects "Observed" from the "Condition Check Method" drop down
        And selects "Consideration" from the "Condition Check Reason" drop down
        And enters "Jennifer Be" in the "Condition Check Assessor" field
        And selects "Jennifer Be" from autocomplete options
        And enters "This is \n a test \n for 110" in the "Condition Check Note" field
        And enters "2016-01-06" in the "Condition Check Date" field
        And enters "04131995" in the "Condition Check Reference Number" field
        And enters "CQA113.2" in the "Current Location" field
        And selects "CQA113.2" from the "Current Location" drop down
        And selects "Dangerous" from the " Current Location Fitness" drop down
        And enters "For CQA-110" in the "Current Location Note" field
        And enters "2016-01-22" in the "Location Date" field
        And enters "California" in the "Normal Location" field
        And selects "California" from autocomplete options
        And clicks on the "Save" button

        Then the message "Intake successfully saved" should appear

        # Then now make sure everything remains intact

        Then the "Entry Date" field should contain "2016-01-31"
        Then the "Entry Reason" field should contain "Enquiry"
        Then the "Entry Method" field should contain "Found on doorstep"
        Then the "Depositor" field should contain "Cesar Villalobos"
        Then the "Depositor Requirements" field should contain "None"
        Then the "Current Owner" field should contain "Cesar Villalobos"
        Then the "Entry Note" field should contain "Testing CQA_110"
        Then the "Packing Note" field should contain "Testing testing"
        Then the "Return Date" field should contain "2016-02-31"
        Then the "Field Collection Date" field should contain "2015-12-31"
        Then the "Entry Method" field should contain "commissioned"
        Then the "Field collection place" field should contain "California"
        Then the "Field collection Note" field should contain "This is a test for CQA-110"
        Then the "Field collection Number" field should contain "110"
        Then the "Field collection event name" field should contain "CQA-110 Testing"
        Then the "Field collection source" field should contain "Cesar Villalobos"
        Then the "Field collector" field should contain "Cesar Villalobos"
        Then the "Valuer" field should contain "Cesar Villalobos"
        Then the "Insurer" field should contain "Cesar Inc"
        Then the "Reference Number" field should contain "110.1"
        Then the "Policy Number" field should contain "110110110"
        Then the "Renewal Date" field should contain "2016-01-04"
        Then the "Insurance Note" field should contain "Taking care of CQA-110"
        Then the "Condition Check Method" field should contain "Observed"
        Then the "Condition Check Reason" field should contain "Consideration"
        Then the "Condition Check Assessor" field should contain "Jennifer Be"
        Then the "Condition Check Note" field should contain "This is \n a test \n for 110"
        Then the "Condition Check Date" field should contain "2016-01-06"
        Then the "Condition Check Reference Number" field should contain "04131995"
        Then the "Current Location" field should contain "CQA113.2"
        Then the "Current Location Fitness" field should contain "Dangerous"
        Then the "Current Location Note" field should contain "For CQA-110"
        Then the "Location Date" field should contain "2016-01-22"
        Then the "Normal Location" field should contain "California"
        Then the "Field collection method" field should contain "commissioned"
        

        Then close the browser

    #Test 13: Editing a saved record
        And enters "2016-01-27" in the "Entry Date" field
        And selects "Consideration" from the "Entry Reason" drop down
        And selects "In person" from the "Entry Method" drop down
        And enters "Cesar Villalobos" in the "Depositor" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Take care of CQA110-13" in the "Depositor Requirements" field
        And enters "Cesar Villalobos" in the "Current Owner" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Testing CQA_110 Test 13" in the "Entry Note" field
        And enters "Testing testing Test 13" in the "Packing Note" field
        And enters "2017-02-31" in the "Return Date" field
        And enters "2016-12-31" in the "Field Collection Date" field
        And enters "California" in the "Field collection place" field
        And selects "netted" from the "Field collection Method" drop down
        And enters "This is a test for CQA-110 Test 13" in the "Field collection note" field
        And enters "110_13" in the "Field collection number" field
        And enters "CQA-110 Testing Test 13" in the "Field collection event name"
        And enters "Cesar Villalobos" in the "Field collection source" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Field collector" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Valuer" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Inc" in the "Insurer" field
        And selects "Cesar Inc" from autocomplete options
        And enters "110.1.13" in the "Reference Number" field
        And enters "110110110.13" in the "Policy Number" field
        And enters "2016-01-06" in the "Renewal Date" field
        And enters "Taking care of CQA-110 Test 13" in the "Insurance Note" field
        And selects "X-Rayed" from the "Condition Check Method" drop down
        And selects "Damaged in transit" from the "Condition Check Reason" drop down
        And enters "Jennifer Be" in the "Condition Check Assessor" field
        And selects "Jennifer Be" from autocomplete options
        And enters "This is \n a test \n for 110 \n Test 13." in the "Condition Check Note" field
        And enters "2016-01-07" in the "Condition Check Date" field
        And enters "04131995.13" in the "Condition Check Reference Number" field
        And enters "CQA113.2" in the "Current Location" field
        And selects "CQA113.2" from the "Current Location" drop down
        And selects "Reasonable" from the " Current Location Fitness" drop down
        And enters "For CQA-110 Test 13" in the "Current Location Note" field
        And enters "2016-07-22" in the "Location Date" field
        And enters "California" in the "Normal Location" field
        And selects "California" from autocomplete options
        And clicks on the "Save" button

        Then the message "Intake successfully saved" should appear

        # Then now make sure everything remains intact

        Then the "Entry Date" field should contain "2016-01-27"
        Then the "Entry Reason" field should contain "Consideration"
        Then the "Entry Method" field should contain "In person"
        Then the "Depositor" field should contain "Cesar Villalobos"
        Then the "Depositor Requirements" field should contain "Take care of CQA110-13"
        Then the "Current Owner" field should contain "Cesar Villalobos"
        Then the "Entry Note" field should contain "Testing CQA_110 Test 13"
        Then the "Packing Note" field should contain "Testing testing Test 13"
        Then the "Return Date" field should contain "2017-02-31"
        Then the "Field Collection Date" field should contain "2016-12-31"
        Then the "Entry Method" field should contain "commissioned"
        Then the "Field collection place" field should contain "California"
        Then the "Field collection Note" field should contain "This is a test for CQA-110 Test 13"
        Then the "Field collection Number" field should contain "110_13"
        Then the "Field collection event name" field should contain "CQA-110 Testing Test 13"
        Then the "Field collection source" field should contain "Cesar Villalobos"
        Then the "Field collector" field should contain "Cesar Villalobos"
        Then the "Valuer" field should contain "Cesar Villalobos"
        Then the "Insurer" field should contain "Cesar Inc"
        Then the "Reference Number" field should contain "110.1.13"
        Then the "Policy Number" field should contain "110110110.13"
        Then the "Renewal Date" field should contain "2016-01-06"
        Then the "Insurance Note" field should contain "Taking care of CQA-110 Test 13"
        Then the "Condition Check Method" field should contain "X-Rayed"
        Then the "Condition Check Reason" field should contain "Damaged in transit"
        Then the "Condition Check Assessor" field should contain "Jennifer Be"
        Then the "Condition Check Note" field should contain "This is \n a test \n for 110 \n Test 13."
        Then the "Condition Check Date" field should contain "2016-01-07"
        Then the "Condition Check Reference Number" field should contain "04131995.13"
        Then the "Current Location" field should contain "CQA113.2"
        Then the "Current Location Fitness" field should contain "Reasonable"
        Then the "Current Location Note" field should contain "For CQA-110 Test 13"
        Then the "Location Date" field should contain "2016-07-22"
        Then the "Normal Location" field should contain "California"
        Then the "Field collection method" field should contain "netted"
        And clicks the "Go To Record" button        
        And clicks the "Delete" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        
        Then close the browser


  # Test 23
  Scenario: Testing links and "Go To Record" works 
    Given user is in the "My CollectionSpace" page
    And navigates to the record with identification number "04131995"
    And selects the "Intake" tab 
    And clicks on result with text "041319951"
    Then the "Intake Entry Number" field should contain "041319951"
    And clicks the "Go to record" button
    Then the titlebar should contain "041319951"
    Then the "Intake Entry Number" field should contain "041319951"
    Then close the browser

  # Test 25
  Scenario: Deleting relation via list
    Given user is in the "My CollectionSpace" page
    And navigates to the record with identification number "04131995"


    And selects the "Intake" tab 
    And clicks the "Add record" button 
    And clicks on the Create button
    And enters "0413199525" in the "Intake Entry Number" field
    And clicks the "Save" button
   
    And clicks the "Delete Relation" button on the row that reads "0413199525"
    Then a delete confirmation dialog should appear 
    And clicks cancel button
    Then the dialog should be dismissed 
    Then the "Related Intake Records" area should contain "0413199525"


    And clicks the "Delete Relation" button on the row that reads "0413199525"
    Then a delete confirmation dialog should appear
    And clicks close button
    Then the dialog should be dismissed
    Then the "Related Intake Records" area should contain "0413199525"

    And clicks the "Delete Relation" button on the row that reads "0413199525"
    Then a delete confirmation dialog should appear
    And clicks on the delete button 

    Then "0413199525" should not appear in the "Procedures" area 
    Then "0413199525" should not appear in the "Related Intake Records" area

    And navigates to the record with identification number "0413199525"
    And clicks on the delete button 

    Then a delete confirmation dialog should appear
    And clicks on the delete button 
    Then the deletion should be confirmed in a dialog
    Then close the browser


  # Test 27
  Scenario: Deleting relation via record editor
    Given user is in the "My CollectionSpace" page
    And navigates to the record with identification number "04131995"

    And selects the "Intake" tab 
    And clicks the "Add record" button 
    And clicks on the Create button
    And enters "0413199527" in the "Intake Entry Number" field
    And clicks the "Save" button
    And clicks on result with text "0413199527"

    
    And clicks the "Delete this relation." button
    Then a delete confirmation dialog should appear  
    And clicks cancel button 
    Then the dialog should be dismissed 
    Then the "Related Intake Records" area should contain "0413199527"

    And clicks the "Delete this relation." button
    Then a delete confirmation dialog should appear  
    And clicks close button 
    Then the dialog should be dismissed 
    Then the "Related Intake Records" area should contain "0413199527"

    And clicks the "Delete this relation." button
    Then a delete confirmation dialog should appear
    And clicks on the delete button 
    Then the deletion should be confirmed in a dialog
    Then "0413199527" should not appear in the "Procedures" area  
    Then "0413199527" should not appear in the "Related Intake Records" area

    And navigates to the record with identification number "0413199527"
    And selects the "Intake" tab 
    Then the "Related Intake Records" area should be empty
    And selects the "Current Record" tab 
    And clicks on the delete button 

    Then a delete confirmation dialog should appear
    And clicks on the delete button 
    Then the deletion should be confirmed in a dialog
    Then close the browser 


