# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Location/Movement/Inventory Control Tab
  # Enter feature description here

    Scenario: Working Location/Movement/Inventory Secondary Tab #1
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA113_NE"
        And selects the "Location/Movement/Inventory" tab
        Then "CQA113.1" should appear in the "Related Location/Movement/Inventory Records" area
     
        And navigates to the record with identification number "CQA113_E"
        And selects the "Location/Movement/Inventory" tab
        Then the "Related Location/Movement/Inventory" area should be empty
        Then close the browser

    Scenario: Dismissing the dialog 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA113_NE"

        #Variation A
        And clicks the "Add record" button 
        And clicks the "close" button 
        Then the "Related Location/Movement/Inventory Records" area should only contain "CQA113.1"

        #Variation B
        And clicks the "Add record" button
        And presses the "ESC" key 
        Then the "Related Location/Movement/Inventory Records" area should only contain "CQA113.1"


    Scenario: Searching and adding multiple Location/Movement/Inventory records
        And clicks the "Add record" button 
        And clicks the "search" button
        Then the search results should contain "CQA113.3" 
        Then the search results should contain "CQA113.2" 

        And selects the box with result "CQA113.3" 
        And selects the box with result "CQA113.2" 
        And clicks the "Add to current record" button

        #Expected, Group #1
        Then the dialog should be dismissed 
        Then "CQA113.3" should appear in the "Related Location/Movement/Inventory Records" area   
        Then "CQA113.2" should appear in the "Related Location/Movement/Inventory Records" area   
        Then "CQA113.3" should appear in the "Procedures" area   
        Then "CQA113.2" should appear in the "Procedures" area   


        And clicks on result with text "CQA113.3"
        Then an "Edit Location/Movement/Inventory Control" form should be displayed
        Then the "Reference Number" field should contain "CQA113.3"

        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then "CQA113.3" should not appear in the "Related Location/Movement/Inventory Records" area 


        And clicks on result with text "CQA113.2"
        Then an "Edit Location/Movement/Inventory Control" form should be displayed
        Then the "Reference Number" field should contain "CQA113.2"

        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then "CQA113.3" should not appear in the "Related Location/Movement/Inventory Records" area 

        Then close the browser

    Scenario: Warning when navigating away from new Location/Movement/Inventory record 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA113_NE"
        Then "CQA113_NE" should be in the "Identification Number" field
        And selects the "Location/Movement/Inventory" tab 
        

        And clicks the "Add record" button 
        And clicks the "Create New" button
        Then the message "Creating new record..." should be displayed 
        # Then an empty Intake record form should be displayed below the listing of records
        And enters "CQA113.4" in the "Reference Number" field 
        And enters "CQA113.2" in the "Current Location" field
        And selects "CQA113.2" from the drop down options 

        #Variation A
        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear  
        And clicks the "close" button
        Then the "Reference Number" field should contain "CQA113.4" 

        #Variation B
        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear  
        And clicks the "cancel" button
        Then the dialog should be dismissed

        #Variation D
        And selects the "Current Record" tab
        And clicks the "Don't save" button 
        And selects the "Location/Movement/Inventory" tab 
        Then "CQA113.4" should not appear in the "Related Location/Movement/Inventory Records" area

        #Variation C
        And clicks the "Add record" button
        And clicks on the Create button
        And enters "CQA113.4" in the "Reference Number" field 
        And enters "CQA113.2" in the "Current Location" field
        And selects "CQA113.2" from the drop down options 

        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear
        And clicks on the "Save" button

        And selects the "Location/Movement/Inventory" tab 
        Then "CQA113.4" should appear in the "Related Location/Movement/Inventory Records" area 

        ## Deleting records so we can reuse
        And navigates to the record with identification number "CQA113.4"
        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then close the browser



    Scenario: Cancel changes button #9
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA113_NE"
        And selects the "Location/Movement/Inventory" tab
        And clicks the "Add record" button 
        And clicks the "Create new" button

        # Variation A
        Then the message "Creating new record..." should be displayed
        Then the "cancel changes" button at the "bottom" of the page "should not" be clickable  
        Then the "cancel changes" button at the "top" of the page "should not" be clickable  

        And enters "CQA113.5" in the "Reference Number" field
        And enters "CQA113.2" in the "Current Location" field
        And selects "CQA113.2" from the drop down options 

        And clicks the "cancel changes" button at the "top" of the page 
        Then the "Reference Number" should be empty


        # Variation B
        And enters "CQA113.5" in the "Reference Number" field
        And enters "CQA113.2" in the "Current Location" field
        And selects "CQA113.2" from the drop down options 

        And clicks on the "Save" button 
        Then the "cancel changes" button at the "top" of the page "should not" be clickable 
        Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   
   
        And clicks the "Go to record" button
        And clicks the "Delete" button 
        Then a delete confirmation dialog should appear
        And clicks the confirmation delete button
        Then the deletion should be confirmed in a dialog
        Then close the browser


    Scenario: Check current location and successful save and All fields saved on edited Location/Movement/Inventory record #13

        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "CQA113_NE"
        And selects the "Location/Movement/Inventory" tab 

        And clicks the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify a Current Location" should appear 
        And enters "CQA113.2" in the "Current Location" field
        And clicks on "CQA113.2" from autocomplete options
        And clicks the "Save" button
        Then the message "Relation successfully created." should appear


        And enters "CQA113.11" in the "Reference Number" field
        And enters "CQA113_Loc" in the "Normal Location" field
        And clicks on "CQA113_Loc" from autocomplete options
        And selects "Dangerous" from the "Fitness" drop down
        And enters "CQA113 Test" in the "Note" field
        And enters "2016-01-04" in the "Location Date" field
        And selects "Conservation" from the "Reason for move" drop down
        And enters "Cesar Villalobos" in the "Contact" field
        And clicks on "Cesar Villalobos" from autocomplete options
        And selects "Forklift" from the "Method" drop down
        And enters "2016-01-05" in the "Planned removal date" field
        And enters "2016-01-06" in the "Removal date" field
        And enters "Test for CQA113 note box 2" in the "Note" field
        And selects "Conservation" from the "Inventory Action Required" drop down
        And selects "Monthly" from the "Inventory Frequency" drop down
        And enters "Cesar Villalobos" in the "Contact" field
        And clicks on "Cesar Villalobos" from autocomplete options
        And enters "2016-01-11" in the "Inventory Date" field
        And enters "2016-01-12" in the "Next Inventory Date" field
        And enters "CQA113 Third Note Box" in the "Note" field
        And clicks the "Save" button
        Then the message "Location/Movement/Inventory successfully saved" should appear

        Then the "Reference Number" field should contain "CQA113.11"
        Then the "Normal Location" field should contain "CQA113_Loc"
        Then the "Fitness" field should contain "Dangerous"
        Then the "Note" field should contain "CQA113 Test"
        Then the "Location Date" field should contain "2016-01-04"
        Then the "Reason for move" field should contain "Conservation"
        Then the "Contact" field should contain "Cesar Villalobos"
        Then the "Method" field should contain "Forklift"
        Then the "Planned removal date" field should contain "2016-01-05"
        Then the "Removal date" field should contain "2016-01-06"
        Then the "Note" field should contain "Test for CQA113 note box 2"
        Then the "Inventory Action Required" field should contain "Conservation"
        Then the "Inventory Frequency" field should contain "Monthly" 
        Then the "Contact" field should contain "Cesar Villalobos"
        Then the "Inventory Date" field should contain "2016-01-11"
        Then the "Next Inventory Date" field should contain "2016-01-12"
        Then the "Note" field should contain "CQA113 Third Note Box" 


       

        And enters "CQA113.11" in the "Reference Number" field
        And enters "CQA113_Loc_2" in the "Normal Location" field
        And clicks on "CQA113_Loc_2" from autocomplete options
        And selects "Suitable" from the "Fitness" drop down
        And enters "CQA113 Test 13" in the "Note" field
        And enters "2016-01-05" in the "Location Date" field
        And selects "Preservation" from the "Reason for move" drop down
        And enters "Cesar Villalobos" in the "Contact" field
        And clicks on "Cesar Villalobos" from autocomplete options
        And selects "Trolley" from the "Method" drop down
        And enters "2016-02-05" in the "Planned removal date" field
        And enters "2016-02-06" in the "Removal date" field
        And enters "Test for CQA113 note box 2, Test 13" in the "Note" field
        And selects "Preservation" from the "Inventory Action Required" drop down
        And selects "Daily" from the "Inventory Frequency" drop down
        And enters "Cesar Villalobos" in the "Contact" field
        And clicks on "Cesar Villalobos" from autocomplete options
        And enters "2016-02-11" in the "Inventory Date" field
        And enters "2016-02-12" in the "Next Inventory Date" field
        And enters "CQA113 Third Note Box Test 13" in the "Note" field
        And clicks the "Save" button
        Then the message "Location/Movement/Inventory successfully saved" should appear

        Then the "Reference Number" field should contain "CQA113.11"
        Then the "Normal Location" field should contain "CQA113_Loc_2"
        Then the "Fitness" field should contain "Suitable"
        Then the "Note" field should contain "CQA113 Test 13"
        Then the "Location Date" field should contain "2016-02-05"
        Then the "Reason for move" field should contain "Preservation"
        Then the "Contact" field should contain "Cesar Villalobos"
        Then the "Method" field should contain "Trolley"
        Then the "Planned removal date" field should contain "2016-01-05"
        Then the "Removal date" field should contain "2016-02-06"
        Then the "Note" field should contain "Test for CQA113 note box 2, Test 13"
        Then the "Inventory Action Required" field should contain "Preservation"
        Then the "Inventory Frequency" field should contain "Daily" 
        Then the "Contact" field should contain "Cesar Villalobos"
        Then the "Inventory Date" field should contain "2016-02-11"
        Then the "Next Inventory Date" field should contain "2016-02-12"
        Then the "Note" field should contain "CQA113 Third Note Box Test 13" 
        And clicks the "Go To Record" button       
        And clicks the "Delete" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
         

        Then close the browser




    Scenario: Testing links and "Go To Record" works
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA113_NE"
        And selects the "Location/Movement/Inventory" tab
        Then "CQA113.1" should appear in the "Related Location/Movement/Inventory Records" area   
        And clicks on result with text "CQA113.1"
        Then "CQA113.1" should be in the "Reference Number" field    
        And clicks the "Go To Record" button
        Then the titlebar should contain "CQA113.1" 
        Then the "Reference Number" field should contain "CQA113.1"
        Then close the browser

    Scenario: Deleting relation via list
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA113_NE"
        And selects the "Location/Movement/Inventory" tab 

        And clicks the "Add record" button 
        And clicks on the Create button
        And enters "CQA113.7" in the "Reference Number" field
        And enters "CQA113.2" in the "Current Location" field
        And selects "CQA113.2" from the drop down options 

        And clicks the "Save" button
        And clicks the "Delete Relation" button on the row that reads "CQA113.7"
        Then a delete confirmation dialog should appear
        And clicks cancel button
        Then the dialog should be dismissed 
        Then no changes to the record should occur 

        And clicks the "Delete Relation" button on the row that reads "CQA113.7"
        Then a delete confirmation dialog should appear
        And clicks the "close" button
        Then the dialog should be dismissed
        Then no changes to the record should occur 

        And clicks the "Delete Relation" button on the row that reads "CQA113.7"
        Then a delete confirmation dialog should appear
        And clicks on the delete button 

        Then "CQA113.7" should not appear in the "Procedures" area
        Then "CQA113.7" should not appear in the "Related Location/Movement/Inventory Records" area

        And navigates to the record with identification number "CQA113.6"
        And selects the "Location/Movement/Inventory" tab 
        Then "CQA113_NE" should not appear in the "Related Location/Movement/Inventory Records" area   
        And selects the "Current Record" tab

        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then close the browser


    Scenario: Deleting relation via record editor
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA113_NE"
        Then "CQA113_NE" should be in the "Identification Number" field

        And selects the "Location/Movement/Inventory" tab 
        And clicks the "Add record" button 
        And clicks on the Create button
        And enters "CQA113.8" in the "Reference Number" field
        And enters "CQA113.2" in the "Current Location" field
        And selects "CQA113.2" from the drop down options 

        And clicks the "Save" button
        And clicks the result with text "CQA113.8"
        
        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear  
        And clicks cancel button
        Then the dialog should be dismissed  
        Then the "Related Location/Movement/Inventory Records" area should contain "CQA113.8"

        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear  
        And clicks close button
        Then the dialog should be dismissed  
        Then the "Related Location/Movement/Inventory Records" area should contain "CQA113.8"

        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
       
        Then "CQA113.8" should not appear in the "Procedures" area   
        Then "CQA113.8" should not appear in the "Related Location/Movement/Inventory Records" area



        And navigates to the record with identification number "CQA113.8"
        And selects the "Location/Movement/Inventory" tab 
        Then the "Related Location/Movement/Inventory Records" area should be empty
        
        And selects the "Current Record" tab 
        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then close the browser  


