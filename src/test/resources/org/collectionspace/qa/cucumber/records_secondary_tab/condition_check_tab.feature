# Created by Cesar Villalobos on 12/30/2015
@recordssecondarytab
Feature: Condition Check Tab Test Plan
  # Enter feature description here

	Scenario: Working Condition Check Secondary Tab #1
        Given user is in the "My CollectionSpace" page
       
        And navigates to the record with identification number "CQA103_E"
        And selects the "Condition" tab     
        Then the "Related Condition Check Records" area should be empty
       
        And navigates to the record with identification number "CQA103_NE"
        And selects the "Condition" tab
        Then "CQA103.1" should appear in the "Related Condition Check Records" area

        Then close the browser

	Scenario: Dismissing the dialog #3
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA103_NE"

        #Variation A
        And clicks the "Add record" button 
        And clicks the "close" button 
        Then the "Related Condition Check Records" area should only contain "CQA103.1"

        #Variation B
        And clicks the "Add record" button
        And presses the "ESC" key 
        Then the "Related Condition Check Records" area should only contain "CQA103.1"


	Scenario: Searching and adding multiple condition Check records #5
        And clicks the "Add record" button 
        And clicks the "search" button 
        Then the search results should contain "CQA103.3" 
        Then the search results should contain "CQA103.2" 

        And selects the box with result "CQA103.3" 
        And selects the box with result "CQA103.2" 
        And clicks the "Add to current record" button

        #Expected, Group #1
        Then the dialog should be dismissed 
        Then "CQA103.3" should appear in the "Related Condition Check Records" area
        Then "CQA103.2" should appear in the "Related Condition Check Records" area 
        Then "CQA103.3" should appear in the "Procedures" area 
        Then "CQA103.2" should appear in the "Procedures" area 


        And clicks on result with text "CQA103.3" 
        Then an "Edit Condition Check Record" form should be displayed 
        Then the "Condition Check/Assessment Reference Number" field should contain "CQA103.3"
        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then "CQA103.3" should not appear in the "Related Condition Check Records" area 

        And clicks on result with text "CQA103.2" 
        Then an "Edit Condition Check Record" form should be displayed 
        Then the "Condition Check/Assessment Reference Number" field should contain "CQA103.2"
        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then "CQA103.2" should not appear in the "Related Condition Check Records" area 
        Then close the browser

	Scenario: Warning when navigating away form new Condition Check record 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA103_NE"
        Then "CQA103_NE" should be in the "Identification Number" field
        And selects the "Condition" tab 
        
        And clicks the "Add record" button
        And clicks the "Create New" button
        
        Then the dialog should be dismissed
        Then the message "Creating new record..." should be displayed
        
        Then the "Condition Check/Assessment Reference Number" field should be empty
        And enters "CQA103.4" in the "Condition Check/Assessment Reference Number" field

        #Variation A
        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear 
        And clicks the "close" button  
        Then the "Condition Check/Assessment Reference Number" field should contain "CQA103.4"

        #Variation B
        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear  
        And clicks the "cancel" button
        Then the "Condition Check/Assessment Reference Number" field should contain "CQA103.4"

        ## Variation D
        And selects the "Current Record" tab
        And clicks the "Don't save" button 
        And selects the "Condition" tab 
        Then "CQA103.4" should not appear in the "Related Condition Check Records" area

        #Variation C
        And clicks the "Add record" button
        And clicks on the Create button
        And enters "CQA103.4" in the "Condition Check/Assessment Reference Number" field 
        And selects the "Current Record" tab
        And clicks on the "Save" button

        And selects the "Condition" tab 
        Then "CQA103.4" should appear in the "Related Condition Check Records" area 

        And navigates to the record with identification number "CQA103.4"
        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then close the browser

	Scenario: Cancel changes button #9
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA103_NE"
        And selects the "Condition" tab
        And clicks the "Add record" button 
        And clicks the "Create new" button

        # Variation A
        Then the message "Creating new record..." should be displayed
        Then the "cancel changes" button at the "bottom" of the page "should not" be clickable
        Then the "cancel changes" button at the "top" of the page "should not" be clickable
        
        And enters "CQA103.5" in the "Condition Check/Assessment Reference Number" field
        And clicks the "cancel changes" button 
        Then the "Condition Check/Assessment Reference Number" field should be empty

        # Variation B
        And enters "CQA103.5" in the "Condition Check/Assessment Reference Number" field
        And clicks on the "Save" button 
        Then the "cancel changes" button at the "top" of the page "should not" be clickable 
        Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   
        And clicks the "Go to record" button
        And clicks the "Delete" button 
        Then a delete confirmation dialog should appear
        And clicks the confirmation delete button
        Then the deletion should be confirmed in a dialog
        Then close the browser

	Scenario: Check Condition Check/Assessment Reference Number and successful save and fields saved on edited Condition Check record #13

        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "CQA103_NE" 
        And selects the "Condition" tab 

        And clicks on the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify a Condition Check Number" should appear
        And enters "CQA103.11" in the "Condition Check/Assessment Reference Number" field
        And clicks the "Save" button
        Then the message "Relation successfully created." should appear

        And selects "Medium" from the "Object Audit Category" drop down
        And selects "Medium" from the "Conservation Treatment Priority" drop down
        And enters "2016-01-01" in the "Next Condition Check/Assessment Date" field
        And selects "Complete" from the "Completeness" drop down
        And enters "2016-02-02" in the "Completeness Date" field  
        And enters "This is complete" in the "Completeness Note" field

        And selects "Needs no work" from the "Condition" drop down
        And enters "2016-03-03" in the "Condition Date" field
        And enters "This needs no work" in the "Condition Note" field
        
        And selects "Poisonous" from the "Hazard" drop down
        And enters "2016-04-04" in the "Hazard Date" field
        And enters "This is Poisonous" in the "Hazard Note" field
        And enters "2016-05-05" in the "Environmental Condition Date" field
        And enters "This is Environmental yay" in the "Environmental Condition Note" field
        And enters "2016-06-06" in the "Technical Assessment Date" field
        And enters "This needs no tech sssessment yay" in the "Technical Assessment Note" field
        And enters "2016-07-07" in the "Condition Check/Assessment Date" field
        And selects "Observed" from the "Condition Check/Assessment Method" drop down
        And selects "Damaged in transit" from the "Condition Check/Assessment Reason" drop down
        And enters "Cesar Villalobos" in the "Condition Checker/Assessor" field
        And clicks on "Cesar Villalobos" from autocomplete options
        And enters "Note for \n CQA-103" in the "Condition Check/Assessment Note" field
        And enters "CQA-103 first text box" in the "Display Recommendations" field
        And enters "CQA-103 second text box" in the "Handling Recommendations" field
        And enters "CQA-103 third text box" in the "Security Recommendations" field
        And enters "CQA-103 fourth text box" in the "Storage Requirements" field
        And enters "CQA-103 fifth text box" in the "Environmental Recommendations" field
        And enters "CQA-103 sixth text box" in the "Packing Recommendations" field
        And enters "CQA-103 seventh text box" in the "Special Requirements" field
        And enters "CQA-103 eigth text box" in the "Legal/License Requirements" field
        And enters "None" in the "Legal/License Requirements Held" field
        And enters "2016-08-08" in the "Legal/License Requirements Held Begin Date" field
        And enters "2016-09-09" in the "Legal/License Requirements Held End Date" field
        And enters "1032" in the "Legal/License Requirements Held Number" field
        And enters "2016-10-10" in the "Legal/License Requirements Held Renew Date" field
        And enters "2016-11-11" in the "Salvage Priority Code Date" field
        And enters "103103" in the "Salvage Priority Code" field
        And clicks the "Save" button
        Then the message "Condition Check successfully saved" should appear        
        
        ## test 11 thens

        Then the "Object Audit Category" field should contain "Medium"
        Then the "Conservation Treatment Priority" field should contain "Medium"
        Then the "Next Condition Check/Assessment Date" field should contain "2016-01-01"
        Then the "Completeness" field should contain "Complete"
        Then the "Completeness Date" field should contain "2016-02-02"
        Then the "Completeness Note" field should contain "This is complete"
        Then the "Condition" field should contain "Needs no work"
        Then the "Condition Date" field should contain "2016-03-03"
        Then the "Condition Note" field should contain "This needs no work"
        Then the "Hazard" field should contain "Poisonous"
        Then the "Hazard Date" field should contain "2016-04-04"
        Then the "Hazard Note" field should contain "This is Poisonous"
        Then the "Environmental Condition Date" field should contain "2016-05-05"
        Then the "Environmental Condition Note" field should contain "This is Environmental yay"
        Then the "Technical Assessment Date" field should contain "2016-06-06"
        Then the "Technical Assessment Note" field should contain "This needs no tech sssessment yay"
        Then the "Condition Check/Assessment Date" field should contain "2016-07-07"
        Then the "Condition Check/Assessment Method" field should contain "Observed"
        Then the "Condition Check/Assessment Reason" field should contain "Damaged in transit"
        Then the "Condition Checker/Assessor" field should contain "Cesar Villalobos"
        Then the "Condition Check/Assessment Note" field should contain "Note for \n CQA-103"
        Then the "Display Recommendations" field should contain "CQA-103 first text box"
        Then the "Handling Recommendations" field should contain "CQA-103 second text box"
        Then the "Security Recommendations" field should contain "CQA-103 third text box"
        Then the "Storage Requirements" field should contain "CQA-103 fourth text box"
        Then the "Environmental Recommendations" field should contain "CQA-103 fifth text box"
        Then the "Packing Recommendations" field should contain "CQA-103 sixth text box"
        Then the "Special Requirements" field should contain "CQA-103 seventh text box"
        Then the "Legal/License Requirements" field should contain "CQA-103 eigth text box"
        Then the "Legal/License Requirements Held" field should contain "None"
        Then the "Legal/License Requirements Held Begin Date" field should contain "2016-08-08"
        Then the "Legal/License Requirements Held End Date" field should contain "2016-09-09"
        Then the "Legal/License Requirements Held Number" field should contain "1032"
        Then the "Legal/License Requirements Held Renew Date" field should contain "2016-10-10"
        Then the "Salvage Priority Code Date" field should contain "2016-11-11"
        Then the "Salvage Priority Code" field should contain "103103"

        

        #### Test 13

        And selects "High" from the "Object Audit Category" drop down
        And selects "High" from the "Conservation Treatment Priority" drop down
        And enters "2017-01-01" in the "Next Condition Check/Assessment Date" field
        And selects "Fragmented" from the "Completeness" drop down
        And enters "2017-02-02" in the "Completeness Date" field  
        And enters "This is fragmented" in the "Completeness Note" field

        And selects "In jeopardy" from the "Condition" drop down
        And enters "2017-03-03" in the "Condition Date" field
        And enters "This In jeopardy" in the "Condition Note" field
        
        And selects "Radioactive" from the "Hazard" drop down
        And enters "2017-04-04" in the "Hazard Date" field
        And enters "This is Radioactive" in the "Hazard Note" field
        And enters "2017-05-05" in the "Environmental Condition Date" field
        And enters "This is so radioactive" in the "Environmental Condition Note" field
        And enters "2017-06-06" in the "Technical Assessment Date" field
        And enters "This needs no tech sssessment yay except it's radioactive" in the "Technical Assessment Note" field
        And enters "2017-07-07" in the "Condition Check/Assessment Date" field
        And selects "X-Rayed" from the "Condition Check/Assessment Method" drop down
        And selects "Loan in" from the "Condition Check/Assessment Reason" drop down
        And enters "Jennifer Be" in the "Condition Checker/Assessor" field
        And clicks on "Jennifer Be" from autocomplete options
        And enters "Note for \n CQA-103 Test 13" in the "Condition Check/Assessment Note" field
        And enters "CQA-103 first text box Test 13" in the "Display Recommendations" field
        And enters "CQA-103 second text box Test 13" in the "Handling Recommendations" field
        And enters "CQA-103 third text box Test 13" in the "Security Recommendations" field
        And enters "CQA-103 fourth text box Test 13" in the "Storage Requirements" field
        And enters "CQA-103 fifth text box Test 13" in the "Environmental Recommendations" field
        And enters "CQA-103 sixth text box Test 13" in the "Packing Recommendations" field
        And enters "CQA-103 seventh text box Test 13" in the "Special Requirements" field
        And enters "CQA-103 eigth text box Test 13" in the "Legal/License Requirements" field
        
        And enters "Some" in the "Legal/License Requirements Held" field
        And enters "2017-08-08" in the "Legal/License Requirements Held Begin Date" field
        And enters "2017-09-09" in the "Legal/License Requirements Held End Date" field
        And enters "10333" in the "Legal/License Requirements Held Number" field
        And enters "2017-10-10" in the "Legal/License Requirements Held Renew Date" field
        And enters "2017-11-11" in the "Salvage Priority Code Date" field
        And enters "102" in the "Salvage Priority Code" field
        And clicks the "Save" button
        Then the message "Condition Check successfully saved" should appear  

        ## test 11 thens

        Then the "Object Audit Category" field should contain "High"
        Then the "Conservation Treatment Priority" field should contain "High"
        Then the "Next Condition Check/Assessment Date" field should contain "2017-01-01"
        Then the "Completeness" field should contain "Fragmented"
        Then the "Completeness Date" field should contain "2017-02-02"
        Then the "Completeness Note" field should contain "This is fragmented"
        Then the "Condition" field should contain "In jeopardy"
        Then the "Condition Date" field should contain "2017-03-03"
        Then the "Condition Note" field should contain "This In jeopardy"
        Then the "Hazard" field should contain "Radioactive"
        Then the "Hazard Date" field should contain "2017-04-04"
        Then the "Hazard Note" field should contain "This is Radioactive"
        Then the "Environmental Condition Date" field should contain "2017-05-05"
        Then the "Environmental Condition Note" field should contain "This is so radioactive"
        Then the "Technical Assessment Date" field should contain "2017-06-06"
        Then the "Technical Assessment Note" field should contain "This needs no tech sssessment yay except it's radioactive"
        Then the "Condition Check/Assessment Date" field should contain "2017-07-07"
        Then the "Condition Check/Assessment Method" field should contain "X-Rayed"
        Then the "Condition Check/Assessment Reason" field should contain "Loan in"
        Then the "Condition Checker/Assessor" field should contain "Jennifer Be"
        Then the "Condition Check/Assessment Note" field should contain "Note for \n CQA-103 Test 13"
        Then the "Display Recommendations" field should contain "CQA-103 first text box Test 13"
        Then the "Handling Recommendations" field should contain "CQA-103 second text box Test 13"
        Then the "Security Recommendations" field should contain "CQA-103 third text box Test 13"
        Then the "Storage Requirements" field should contain "CQA-103 fourth text box Test 13"
        Then the "Environmental Recommendations" field should contain "CQA-103 fifth text box Test 13"
        Then the "Packing Recommendations" field should contain "CQA-103 sixth text box Test 13"
        Then the "Special Requirements" field should contain "CQA-103 seventh text box Test 13"
        Then the "Legal/License Requirements" field should contain "CQA-103 eigth text box Test 13"
        Then the "Legal/License Requirements Held" field should contain "Some"
        Then the "Legal/License Requirements Held Begin Date" field should contain "2017-08-08"
        Then the "Legal/License Requirements Held End Date" field should contain "2017-09-09"
        Then the "Legal/License Requirements Held Number" field should contain "10333"
        Then the "Legal/License Requirements Held Renew Date" field should contain "2017-10-10"
        Then the "Salvage Priority Code Date" field should contain "2017-11-11"
        Then the "Salvage Priority Code" field should contain "102"
        And clicks the "Go To Record" button        
        And clicks the "Delete" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog        
        Then close the browser


	Scenario: Testing links and "Go To Record" works #23
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA103_NE"
        And selects the "Condition" tab 
        And clicks on result with text "CQA103.1"
        Then the "Condition Check/Assessment Reference Number" field should contain "CQA103.1"
        And clicks the "Go to record" button
        Then the titlebar should contain "CQA103.1"
        Then the "Condition Check/Assessment Reference Number" field should contain "CQA103.1"
        Then close the browser 

	Scenario: Deleting relation via list #25
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA103_NE"
        And selects the "Condition" tab

        And clicks the "Add record" button 
        And clicks on the Create button
        And enters "CQA103.7" in the "Condition Check/Assessment Reference Number" field
        And clicks the "Save" button
        
        And clicks the "Delete Relation" button on the row that reads "CQA103.7"
        Then a delete confirmation dialog should appear
        And clicks cancel button
        Then the dialog should be dismissed
        Then the "Related Condition Check Records" area should contain "CQA103.7"

        And clicks the "Delete Relation" button on the row that reads "CQA103.7"
        Then a delete confirmation dialog should appear
        And clicks the "close" button
        Then the dialog should be dismissed
        Then the "Related Condition Check Records" area should contain "CQA103.7"


        And clicks the "Delete Relation" button on the row that reads "CQA103.7"
        Then a delete confirmation dialog should appear
        And clicks on the delete button 

        Then "CQA103.7" should not appear in the "Procedures" area
        Then "CQA103.7" should not appear in the "Related Condition Check Records" area

        And navigates to the record with identification number "CQA103.7"
        And selects the "Condition" tab 
        Then "CQA103_NE" should not appear in the "Related Condition Check Records" area   
        And selects the "Current Record" tab

        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then close the browser

	Scenario: Deleting relation via record editor #27
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA103_NE"
        Then "CQA103_NE" should be in the "Identification Number" field

        And selects the "Condition" tab 
        And clicks the "Add record" button 
        And clicks on the Create button
        And enters "CQA103.8" in the "Condition Check/Assessment Reference Number" field
        And clicks the "Save" button
        And clicks on result with text "CQA103.8"
        
        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear  
        And clicks cancel button
        Then the dialog should be dismissed  
        Then the "Related Condition Check Records" area should contain "CQA103.8"

        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear  
        And clicks close button
        Then the dialog should be dismissed  
        Then the "Related Condition Check Records" area should contain "CQA103.8"

        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        # Then the record editor should no longer be displayed (below list)
        Then "CQA103.8" should not appear in the "Procedures" area   
        Then "CQA103.8" should not appear in the "Related Condition Check Records" area

        And navigates to the record with identification number "CQA103.8"
        And selects the "Condition" tab 
        Then the "Related Condition Check Records" area should be empty
        
        And selects the "Current Record" tab 
        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then close the browser 


