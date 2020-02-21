# Created by Cesar Villalobos on November 20th 2015

@recordssecondarytab
Feature: Acquisition Tab
  # Enter feature description here

    Scenario: Working Acquisition Secondary Tab #1 
        Given user is in the "My CollectionSpace" page
       
        And navigates to the record with identification number "CQA93_E"
        And selects the "Acquisition" tab     
        Then the "Related Acquisition Records" area should be empty
       
        And navigates to the record with identification number "CQA93_NE"
        And selects the "Acquisition" tab
        Then "CQA93.1" should appear in the "Related Acquisition Records" area

        Then close the browser

    Scenario: Dismissing the dialog #3 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA93_NE"

        #Variation A
        And clicks the "Add record" button 
        And clicks the "close" button 
        Then the "Related Acquisition Records" area should only contain "CQA93.1"

        #Variation B
        And clicks the "Add record" button
        And presses the "ESC" key 
        Then the "Related Acquisition Records" area should only contain "CQA93.1"

    Scenario: Searching and adding multiple Acquisition records #5 
        And clicks the "Add record" button 
        And clicks the "search" button 
        Then the search results should contain "CQA93.3" 
        Then the search results should contain "CQA93.2" 

        And selects the box with result "CQA93.3" 
        And selects the box with result "CQA93.2" 
        And clicks the "Add to current record" button  

        #Expected, Group #1
        Then the dialog should be dismissed 
        Then "CQA93.3" should appear in the "Related Acquisition Records" area
        Then "CQA93.2" should appear in the "Related Acquisition Records" area 
        Then "CQA93.3" should appear in the "Procedures" area 
        Then "CQA93.2" should appear in the "Procedures" area 


        And clicks on result with text "CQA93.3" 
        Then an "Edit Acquisition Record" form should be displayed 
        Then the "Acquisition Reference Number" field should contain "CQA93.3"
        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then "CQA93.3" should not appear in the "Related Acquisition Records" area 


        And clicks on result with text "CQA93.2" 
        Then an "Edit Acquisition Record" form should be displayed 
        Then the "Acquisition Reference Number" field should contain "CQA93.2"
        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then "CQA93.2" should not appear in the "Related Acquisition Records" area 
        Then close the browser

    Scenario: Warning when navigating away from new Acquisition record  
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA93_NE"
        Then the "Identification Number" field should contain "CQA93_NE"
        And selects the "Acquisition" tab 
        
        And clicks the "Add record" button
        And clicks the "Create New" button
        
        Then the dialog should be dismissed
        Then the message "Creating new record..." should be displayed
        
        Then the "Acquisition Reference Number" field should be empty
        And enters "CQA93.4" in the "Acquisition Reference Number" field


        #Variation A
        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear 
        And clicks the5e "close" button  
        Then the "Acquisition Reference Number" field should contain "CQA93.4"


        #Variation B
        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear  
        And clicks the "cancel" button
        Then the "Acquisition Reference Number" field should contain "CQA93.4"

        ## Variation D
        And selects the "Current Record" tab
        And clicks the "Don't save" button 
        And selects the "Acquisition" tab 
        Then "CQA93.4" should not appear in the "Related Acquisition Records" area


        #Variation C
        And clicks the "Add record" button
        And clicks on the Create button
        And enters "CQA93.4" in the "Acquisition Reference Number" field 
        And selects the "Current Record" tab
        And clicks on the "Save" button

        And selects the "Acquisition" tab 
        Then "CQA93.4" should appear in the "Related Acquisition Records" area 

        And navigates to the record with identification number "CQA93.4"
        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then close the browser

    Scenario: Cancel changes button #9 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA93_NE"
        And selects the "Acquisition" tab
        And clicks the "Add record" button 
        And clicks the "Create new" button

        # Variation A
        Then the message "Creating new record..." should be displayed
        Then the "cancel changes" button at the "bottom" of the page "should not" be clickable
        Then the "cancel changes" button at the "top" of the page "should not" be clickable
        
        And enters "CQA93.5" in the "Acquisition Reference Number" field
        And clicks the "cancel changes" button 
        Then the "Acquisition Reference Number" field should be empty

        # Variation B
        And enters "CQA93.5" in the "Acquisition Reference Number" field
        And clicks on the "Save" button 
        Then the "cancel changes" button at the "top" of the page "should not" be clickable 
        Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   
   
        And clicks the "Go to record" button
        And clicks the "Delete" button 
        Then a delete confirmation dialog should appear
        And clicks the confirmation delete button
        Then the deletion should be confirmed in a dialog
        Then close the browser

    Scenario: Check Acquisition Reference Number and successful save and All fields saved on edited Acquisition record 

        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "CQA93_NE" 
        And selects the "Acquisition" tab 

        And clicks the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify an Acquisition Reference Number" should appear
        And enters "CQA93.11" in the "Acquisition Reference Number" field
        And clicks the "Save" button
        Then the message "Relation successfully created." should appear
        
        And enters "2016-01-01" in the "Accession Date" field
        And enters "Cesar Villalobos" in the "Acquisition Authorizer" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "2016-02-02" in the "Acquisition authorizer date" field
        And enters "2016-03-03" in the "Acquisition Date" field
        And selects "Purchase" from the "Acquisition Method" drop down
        And enters "Cesar Villalobos" in the "Acquisition Source" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Owner" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "93.1" in the "Transfer of Title Number" field
        And enters "93.2" in the "Group purchase price value" field
        And enters "93.3" in the "Object offer price value" field
        And enters "93.4" in the "Object purchaser offer price value" field
        And enters "93.5" in the "Object purchase price value" field
        And enters "93.6" in the "Original object purchase price" field
        And enters "CQA93_11 Reason \n none" in the "Acquisition Reason" field
        And enters "CQA93_11 Acquisition Note \n none" in the "Acquisition Note" field
        And enters "CQA93_11 Provisos \n none" in the "Acquisition Provisos" field
        And selects "Euro" from the "Currency" drop down
        And enters "93.7" in the "Value" field
        And enters "CQA93 Fund" in the "Funding source" field
        And selects "CQA93 Fund" from autocomplete options
        And enters "None" in the "Source provisos" field
        And enters "93.8" in the "Credit Line" field
        And enters "CQA93 Digging Event" in the "Field collection event name" field
        
        And clicks the "Save" button
        Then the message "Acquisition successfully saved" should appear

        Then the "Accession Date" field should contain "2016-01-01"
        Then the "Acquisition Authorizer" field should contain "Cesar Villalobos"
        Then the "Acquisition authorizer date" field should contain "2016-02-02"
        Then the "Acquisition Date" field should contain "2016-03-03"
        Then the "Acquisition Method" field should contain "Purchase"
        Then the "Acquisition Source" field should contain "Cesar Villalobos"
        Then the "Owner" field should contain "Cesar Villalobos"
        Then the "ransfer of Title Number" field should contain "93.1"
        Then the "Group purchase price value" field should contain "93.2"
        Then the "Object offer price value" field should contain "93.3"
        Then the "Object purchaser offer price value" field should contain "93.4"
        Then the "Object purchase price value" field should contain "93.5"
        Then the "Original object purchase price" field should contain "93.6"
        Then the "Acquisition Reason" field should contain "CQA93_11 Reason \n none"
        Then the "Acquisition Note" field should contain "CQA93_11 Acquisition Note \n none"
        Then the "Acquisition provisos" field should contain "CQA93_11 Provisos \n none"
        Then the "Currency" field should contain "Euro"
        Then the "Value" field should contain "93.7"
        Then the "Funding source" field should contain "CQA93 Fund"
        Then the "Source provisos" field should contain "None"
        Then the "Credit Line" field should contain "93.8"
        Then the "Field collection event name" field should contain "CQA93 Digging Event"

        # Test 13 --> Successful save on edited record
        
        And enters "2017-01-01" in the "Accession Date" field
        And enters "Jennifer Be" in the "Acquisition Authorizer" field
        And selects "Jennifer Be" from autocomplete options
        And enters "2017-02-02" in the "Acquisition authorizer date" field
        And enters "2017-03-03" in the "Acquisition Date" field
        And selects "Purchase" from the "Acquisition Method" drop down
        And enters "Jennifer Be" in the "Acquisition Source" field
        And selects "Jennifer Be" from autocomplete options
        And enters "Jennifer Be" in the "Owner" field
        And selects "Jennifer Be" from autocomplete options
        And enters "93.13.1" in the "Transfer of Title Number" field
        And enters "93.13.2" in the "Group purchase price value" field
        And enters "93.13.3" in the "Object offer price value" field
        And enters "93.13.4" in the "Object purchaser offer price value" field
        And enters "93.13.5" in the "Object purchase price value" field
        And enters "93.13.6" in the "Original object purchase price" field
        And enters "CQA93_13 Reason \n none" in the "Acquisition Reason" field
        And enters "CQA93_13 Acquisition Note \n none" in the "Acquisition Note" field
        And enters "CQA93_13 Provisos \n none" in the "Acquisition Provisos" field
        And selects "Euro" from the "Currency" drop down
        And enters "93.13.7" in the "Value" field
        And enters "CQA93 Fund" in the "Funding source" field
        And selects "CQA93 Fund" from autocomplete options
        And enters "Some" in the "Source provisos" field
        And enters "93.13.8" in the "Credit Line" field
        And enters "CQA93 Digging Event" in the "Field collection event name" field
        And clicks the "Save" button
        Then the message "Acquisition successfully saved" should appear

        Then the "Accession Date" field should contain "2017-01-01"
        Then the "Acquisition Authorizer" field should contain "Jennifer Be"
        Then the "Acquisition authorizer date" field should contain "2017-02-02"
        Then the "Acquisition Date" field should contain "2017-03-03"
        Then the "Acquisition Method" field should contain "Purchase"
        Then the "Acquisition Source" field should contain "Jennifer Be"
        Then the "Owner" field should contain "Jennifer Be"
        Then the "ransfer of Title Number" field should contain "93.13.1"
        Then the "Group purchase price value" field should contain "93.13.2"
        Then the "Object offer price value" field should contain "93.13.3"
        Then the "Object purchaser offer price value" field should contain "93.13.4"
        Then the "Object purchase price value" field should contain "93.13.5"
        Then the "Original object purchase price" field should contain "93.13.6"
        Then the "Acquisition Reason" field should contain "CQA93_13 Reason \n none"
        Then the "Acquisition Note" field should contain "CQA93_13 Acquisition Note \n none"
        Then the "Acquisition provisos" field should contain "CQA93_13 Provisos \n none"
        Then the "Currency" field should contain "Euro"
        Then the "Value" field should contain "93.13.7"
        Then the "Funding source" field should contain "CQA93 Fund"
        Then the "Source provisos" field should contain "Some"
        Then the "Credit Line" field should contain "93.13.8"
        Then the "Field collection event name" field should contain "CQA93 Digging Event"
        And clicks the "Go To Record" button
        And clicks the "Delete" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        
        Then close the browser
        

    Scenario: Testing links and "Go To Record" works #23 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA93_NE"
        And selects the "Acquisition" tab 
        And clicks on result with text "CQA93.1"
        Then the "Acquisition Reference Number" field should contain "CQA93.1"
        And clicks the "Go to record" button
        Then the titlebar should contain "CQA93.1"
        Then the "Acquisition Reference Number" field should contain "CQA93.1"
        Then close the browser  

    Scenario: Deleting Relation via List #25 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA93_NE"
        And selects the "Acquisition" tab 

        And clicks the "Add record" button 
        And clicks on the Create button
        And enters "CQA93.7" in the "Acquisition Reference Number" field
        And clicks the "Save" button
        
        And clicks the "Delete Relation" button on the row that reads "CQA93.7"
        Then a delete confirmation dialog should appear
        And clicks the "cancel" button
        Then the dialog should be dismissed 
        Then the "Related Acquisition Records" area should contain "CQA93.7"

        And clicks the "Delete Relation" button on the row that reads "CQA93.7"
        Then a delete confirmation dialog should appear
        And clicks the "close" button
        Then the dialog should be dismissed
        Then the "Related Acquisition Records" area should contain "CQA93.7"


        And clicks the "Delete Relation" button on the row that reads "CQA93.7"
        Then a delete confirmation dialog should appear
        And clicks the "delete" button
        Then "CQA93.7" should not appear in the "Procedures" area
        Then "CQA93.7" should not appear in the "Related Acquisition Records" area

        And navigates to the record with identification number "CQA93.7"
        And selects the "Acquisition" tab 
        Then "CQA93_NE" should not appear in the "Related Acquisition Records" area   
        And selects the "Current Record" tab

        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then close the browser

    Scenario: Deleting Relation via record editor #27 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA93_NE"
        Then "CQA93_NE" should be in the "Identification Number" field

        And selects the "Acquisition" tab 
        And clicks the "Add record" button 
        And clicks on the Create button
        And enters "CQA93.8" in the "Acquisition Reference Number" field
        And clicks the "Save" button
        And clicks on result with text "CQA93.8"
        
        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear  
        And clicks the "cancel" button
        Then the dialog should be dismissed  
        Then the "Related Acquisition Records" area should contain "CQA93.8"

        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear  
        And clicks the "close" button
        Then the dialog should be dismissed  
        Then the "Related Acquisition Records" area should contain "CQA93.8"

        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then "CQA93.8" should not appear in the "Procedures" area   
        Then "CQA93.8" should not appear in the "Related Acquisition Records" area

        And navigates to the record with identification number "CQA93.8"
        And selects the "Acquisition" tab 
        Then the "Related Acquisition Records" area should be empty
        
        And selects the "Current Record" tab 
        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then close the browser 

