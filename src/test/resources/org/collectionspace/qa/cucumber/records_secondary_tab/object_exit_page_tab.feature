# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Object Exit Page Tab
  # Enter feature description here

  Scenario: Working Object Exit Secondary Tab #1
		Given user is in the "My CollectionSpace" page
	   
	    And navigates to the record with identification number "CQA115_E"
	    And selects the "Object Exit" tab	    
	    Then the "Related Object Exit Records" area should be empty
	   

		And navigates to the record with identification number "CQA115_NE"
	    And selects the "Object Exit" tab
	    Then "CQA115.1" should appear in the "Related Object Exit Records" area
	    Then close the browser

  Scenario: Dismissing the dialog #3
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA115_NE"

		#Variation A
		And clicks the "Add record" button 
	    And clicks the "close" button 
	    Then the "Related Object Exit Records" area should only contain "CQA115.1"

	    #Variation B
	    And clicks the "Add record" button
	    And presses the "ESC" key 
	    Then the "Related Object Exit Records" area should only contain "CQA115.1"


  Scenario: Searching and adding multiple Object Exit records #5
		And clicks the "Add record" button 
	    And clicks the "search" button 
	    Then the search results should contain "CQA115.3" 
	    Then the search results should contain "CQA115.2" 

	    And selects the box with result "CQA115.3" 
	    And selects the box with result "CQA115.2" 
	    And clicks the "Add to current record" button  

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA115.3" should appear in the "Related Object Exit Records" area
	    Then "CQA115.2" should appear in the "Related Object Exit Records" area 
	    Then "CQA115.3" should appear in the "Procedures" area 
	    Then "CQA115.2" should appear in the "Procedures" area 


	    And clicks on result with text "CQA115.3" 
	    Then an "Edit Object Exit Record" form should be displayed 
	    Then the "Object Exit Number" field should contain "CQA115.3"
	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA115.3" should not appear in the "Related Object Exit Records" area 


	    And clicks on result with text "CQA115.2" 
	    Then an "Edit Object Exit Record" form should be displayed 
	    Then the "Object Exit Number" field should contain "CQA115.2"
	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA115.2" should not appear in the "Related Object Exit Records" area 

	    Then close the browser


  Scenario: Warning when navigating away from Object Exit record 
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA115_NE"
	    Then "CQA115_NE" should be in the "Identification Number" field
	    And selects the "Object Exit" tab 
	    
	    And clicks the "Add record" button
		And clicks the "Create New" button
		
		Then the dialog should be dismissed
		Then the message "Creating new record..." should be displayed
	    
		Then the "Exit Number" field should be empty
	    And enters "CQA115.4" in the "Exit Number" field


	    #Variation A
    	And selects the "Current Record" tab
	    Then a leave confirmation dialog should appear 
	    And clicks the "close" button  
	    Then the "Exit Number" field should contain "CQA115.4"


		#Variation B
		And selects the "Current Record" tab
	    Then a leave confirmation dialog should appear  
	    And clicks the "cancel" button
	    Then the "Exit Number" field should contain "CQA115.4"

	    ## Variation D
	    And selects the "Current Record" tab
	    And clicks the "Don't save" button 
	   	And selects the "Object Exit" tab 
	    Then "CQA115.4" should not appear in the "Related Object Exit Records" area


		#Variation C
		And clicks the "Add record" button
    	And clicks on the Create button
    	And enters "CQA115.4" in the "Exit Number" field 
		And selects the "Current Record" tab
		And clicks on the "Save" button

	    And selects the "Object Exit" tab 
	    Then "CQA115.4" should appear in the "Related Object Exit Records" area 

	    And navigates to the record with identification number "CQA115.4"
	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser

  Scenario: Cancel changes button #9
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA115_NE"
		And selects the "Object Exit" tab
	    And clicks the "Add record" button 
	    And clicks the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the "bottom" of the page "should not" be clickable
	    Then the "cancel changes" button at the "top" of the page "should not" be clickable
	    
	    And enters "CQA115.5" in the "Exit Number" field
	    And clicks the "cancel changes" button 
    	Then the "Exit Number" field should be empty

	    # Variation B
	    And enters "CQA115.5" in the "Exit Number" field
	    And clicks on the "Save" button 
	    Then the "cancel changes" button at the "top" of the page "should not" be clickable 
    	Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   
   
	    And clicks the "Go to record" button
	    And clicks the "Delete" button 
	    Then a delete confirmation dialog should appear
	    And clicks the confirmation delete button
	    Then the deletion should be confirmed in a dialog
	    Then close the browser

	Scenario: Check Exit Number and successful save and All fields saved on edited Object Exit record #13

        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "CQA115_NE"
        And selects the "Object Exit" tab 

        And clicks the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify an Exit Number" should appear
        And enters "CQA115.11" in the "Exit Number" field
        And clicks the "Save" button
        Then the message "Relation successfully created." should appear

        And enters "2016-01-05" in the "Exit Date" field
        And enters "Cesar Villalobos" in the "Current Owner" field
        And clicks on "Cesar Villalobos" from autocomplete options
        And enters "Jennifer Be" in the "Depositor" field
        And clicks on "Jennifer Be" from autocomplete options
        And selects "Courier" from the "Exit Method" drop down
        And selects "Deaccession" from the "Exit Reason" drop down
        And enters "This \n is \n CQA115" in the "Exit Note" field
        And enters "Packing for CQA115" in the "Packing Note" field

        And clicks the "Save" button
        Then the message "Object Exit successfully saved" should appear



        Then the "Exit Number" field should contain "CQA115.11"
        Then the "Current Owner" field should contain "Cesar Villalobos"
        Then the "Depositor" field should contain "Jennifer Be"
        Then the "Exit Method" field should contain "Courier"
        Then the "Exit Reason" field should contain "Deaccession"
        Then the "Exit Date" field should contain "2016-01-05"
        Then the "Exit Note" field should contain "This \n is \n CQA115"
        Then the "Packing Note" field should contain "Packing for CQA115"

        ## Test 13

        And enters "2016-01-10" in the "Exit Date" field
        And enters "Jennifer Be" in the "Current Owner" field
        And clicks on "Jennifer Be" from autocomplete options
        And enters "Cesar Villalobos" in the "Depositor" field
        And clicks on "Cesar Villalobos" from autocomplete options
        And selects "Post" from the "Exit Method" drop down
        And selects "Disposal" from the "Exit Reason" drop down
        And enters "This \n is \n CQA115 \n Test 13" in the "Exit Note" field
        And enters "Packing for CQA115 Test 13" in the "Packing Note" field

        And clicks the "Save" button
        Then the message "Object Exit successfully saved" should appear

        Then the "Exit Number" field should contain "CQA115.11"
        Then the "Current Owner" field should contain "Jennifer Be"
        Then the "Depositor" field should contain "Cesar Villalobos"
        Then the "Exit Method" field should contain "Post"
        Then the "Exit Reason" field should contain "Disposal"
        Then the "Exit Date" field should contain "2016-01-10"
        Then the "Exit Note" field should contain "This \n is \n CQA115 \n Test 13"
        Then the "Packing Note" field should contain "Packing for CQA115 Test 13"
        And clicks the "Go To Record" button	    
	    And clicks the "Delete" button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog   

        Then close the browser




  Scenario: Testing links and "Go To Record" works #23
	    Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA115_NE"
	    And selects the "Object Exit" tab 
	    And clicks on result with text "CQA115.1"
	    Then the "Exit Number" field should contain "CQA115.1"
	    And clicks the "Go to record" button
	    Then the titlebar should contain "CQA115.1"
	    Then close the browser	

	Scenario: Deleting relation via list #25
		Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA115_NE"
	    And selects the "Object Exit" tab 

	    And clicks the "Add record" button 
	    And clicks on the Create button
	    And enters "CQA115.7" in the "Exit Number" field
	    And clicks the "Save" button
	    
	    And clicks the "Delete Relation" button on the row that reads "CQA115.7"
	    Then a delete confirmation dialog should appear
	    And clicks cancel button
	    Then the dialog should be dismissed 
	    Then the "Related Object Exit Records" area should contain "CQA115.7"

	    And clicks the "Delete Relation" button on the row that reads "CQA115.7"
	    Then a delete confirmation dialog should appear
	    And clicks the "close" button
	    Then the dialog should be dismissed
	    Then the "Related Object Exit Records" area should contain "CQA115.7"

	    And clicks the "Delete Relation" button on the row that reads "CQA115.7"
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 

	    Then "CQA115.7" should not appear in the "Procedures" area
	    Then "CQA115.7" should not appear in the "Related Object Exit Records" area

		And navigates to the record with identification number "CQA115.7"
	    And selects the "Object Exit" tab 
	    Then "CQA115_NE" should not appear in the "Related Object Exit Records" area   
	    And selects the "Current Record" tab

	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser

	Scenario: Deleting relation via record editor #27
		Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA115_NE"
	    Then "CQA115_NE" should be in the "Identification Number" field

	    And selects the "Object Exit" tab 
	    And clicks the "Add record" button 
	    And clicks on the Create button
	    And enters "CQA115.8" in the "Exit Number" field
	    And clicks the "Save" button
	    And clicks on result with text "CQA115.8"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear  
	    And clicks cancel button
	    Then the dialog should be dismissed  
	    Then the "Related Object Exit Records" area should contain "CQA115.8"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear  
	    And clicks close button
	    Then the dialog should be dismissed  
	    Then the "Related Object Exit Records" area should contain "CQA115.8"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    # Then the record editor should no longer be displayed (below list)
	    Then "CQA115.8" should not appear in the "Procedures" area   
	    Then "CQA115.8" should not appear in the "Related Object Exit Records" area

	    And navigates to the record with identification number "CQA115.8"
	    And selects the "Object Exit" tab 
	    Then the "Related Object Exit Records" area should be empty
	    
	    And selects the "Current Record" tab 
	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser 



