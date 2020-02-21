# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Valuation Tab
  	# Enter feature description here
# And clicks the "___" button
  	Scenario: Working Valuation Control Secondary Tab #1
		Given user is in the "My CollectionSpace" page
	   
	    And navigates to the record with identification number "CQA116_E"
	    And selects the "Valuation" tab	    
	    Then the "Related Valuation Control Records" area should be empty
	   
		And navigates to the record with identification number "CQA116_NE"
	    And selects the "Valuation" tab
	    Then "CQA116.1" should appear in the "Related Valuation Control Records" area

	    Then close the browser


  	Scenario: Dismissing the dialog #3 
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA116_NE"

		#Variation A
		And clicks the "Add record" button 
	    And clicks the "close" button 
	    Then the "Related Valuation Control Records" area should only contain "CQA116.1"

	    #Variation B
	    And clicks the "Add record" button
	    And presses the "ESC" key 
	    Then the "Related Valuation Control Records" area should only contain "CQA116.1"


  	Scenario: Searching and adding multiple Valuation Control records #5
		And clicks the "Add record" button 
	    And clicks the "search" button 
	    Then the search results should contain "CQA116.3" 
	    Then the search results should contain "CQA116.2" 

	    And selects the box with result "CQA116.3" 
	    And selects the box with result "CQA116.2" 
	    And clicks the "Add to current record" button  

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA116.3" should appear in the "Related Valuation Control Records" area
	    Then "CQA116.2" should appear in the "Related Valuation Control Records" area 
	    Then "CQA116.3" should appear in the "Procedures" area 
	    Then "CQA116.2" should appear in the "Procedures" area 


	    And clicks on result with text "CQA116.3" 
	    Then an "Edit Valuation Control Record" form should be displayed 
	    Then the "Valuation Control Reference Number" field should contain "CQA116.3"
	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA116.3" should not appear in the "Related Valuation Control Records" area 


	    And clicks on result with text "CQA116.2" 
	    Then an "Edit Valuation Control Record" form should be displayed 
	    Then the "Valuation Control Reference Number" field should contain "CQA116.2"
	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA116.2" should not appear in the "Related Valuation Control Records" area 

	    Then close the browser


  	Scenario: Warning when navigating away from new Valuation Control record 
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA116_NE"
	    Then "CQA116_NE" should be in the "Identification Number" field
	    And selects the "Valuation" tab 
	    
	    And clicks the "Add record" button
		And clicks the "Create New" button
		
		Then the dialog should be dismissed
		Then the message "Creating new record..." should be displayed
	    
		Then the "Valuation Control Reference Number" field should be empty
	    And enters "CQA116.4" in the "Valuation Control Reference Number" field


	    #Variation A
    	And selects the "Current Record" tab
	    Then a leave confirmation dialog should appear 
	    And clicks the "close" button  
	    Then the "Valuation Control Reference Number" field should contain "CQA116.4"


		#Variation B
		And selects the "Current Record" tab
	    Then a leave confirmation dialog should appear
	    And clicks the "cancel" button
	    Then the "Valuation Control Reference Number" field should contain "CQA116.4"

	    ## Variation D
	    And selects the "Current Record" tab
	    And clicks the "Don't save" button 
	   	And selects the "Valuation" tab 
	    Then "CQA116.4" should not appear in the "Related Valuation Control Records" area


		#Variation C
		And clicks the "Add record" button
    	And clicks on the Create button
    	And enters "CQA116.4" in the "Valuation Control Reference Number" field 
		And selects the "Current Record" tab
		And clicks on the "Save" button

	    And selects the "Valuation" tab 
	    Then "CQA116.4" should appear in the "Related Valuation Control Records" area 

	    And navigates to the record with identification number "CQA116.4"
	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser

 	Scenario: Cancel changes button #9
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA116_NE"
		And selects the "Valuation" tab
	    And clicks the "Add record" button 
	    And clicks the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the "bottom" of the page "should not" be clickable
	    Then the "cancel changes" button at the "top" of the page "should not" be clickable
	    
	    And enters "CQA116.5" in the "Valuation Control Reference Number" field
	    And clicks the "cancel changes" button 
    	Then the "Valuation Control Reference Number" field should be empty

	    # Variation B
	    And enters "CQA116.5" in the "Valuation Control Reference Number" field
	    And clicks on the "Save" button 
	    Then the "cancel changes" button at the "top" of the page "should not" be clickable 
    	Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   
   
	    And clicks the "Go to record" button
	    And clicks the "Delete" button 
	    Then a delete confirmation dialog should appear
	    And clicks the confirmation delete button
	    Then the deletion should be confirmed in a dialog

	    Then close the browser


	Scenario: Check Valuation Control Reference Number and successful save  And All fields saved on edited Valuation Control record #13
        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "CQA116_NE"
        And selects the "Valuation" tab 

        And clicks the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify a Valuation Control Reference Number" should appear
        And enters "CQA116.11" in the "Evaluation Control Reference Number" field
        And clicks the "Save" button
        Then the message "Relation successfully created." should appear

        And selects "Danish Krone" from the "Currency" drop down
        And enters "116" in the "Amount" field
        And enters "Cesar Villalobos" in the "Source" field
        And clicks on "Cesar Villalobos" from autocomplete options
        And enters "2016-01-01" in the "Date" field
        And enters "2016-01-02" in the "Renewal Date" field
        And selects "Current Value" from the "Type" drop down
        And enters "CQA116 \n Test" in the "Note" field
        And clicks the "Save" button
        Then the message "Valuation Control successfully saved" should appear

        Then the "Currency" field should contain "Danish Krone"
        Then the "Amount" field should contain "116"
        Then the "Source" field should contain "Cesar Villalobos"
        Then the "Date" field should contain "2016-01-01"
        Then the "Renewal Date" field should contain "2016-01-02"
        Then the "Type" field should contain "Current Value"
        Then the "Note" field should contain "CQA116 \n Test"

        Then the "Depositor" field should contain "Jennifer Be"
        Then the "Exit Method" field should contain "Courier"
        Then the "Exit Reason" field should contain "Deaccession"
        Then the "Exit Date" field should contain "2016-01-05"
        Then the "Exit Note" field should contain "This \n is \n CQA115"
        Then the "Packing Note" field should contain "Packing for CQA115"

        ## Test 13
        And selects "Euro" from the "Currency" drop down
        And enters "120" in the "Amount" field
        And enters "Jennifer Be" in the "Source" field
        And clicks on "Jennifer Be" from autocomplete options
        And enters "2016-01-10" in the "Date" field
        And enters "2017-01-02" in the "Renewal Date" field
        And selects "Original Value" from the "Type" drop down
        And enters "CQA116 \n Test \n for subtest Test 13" in the "Note" field
        
        And clicks the "Save" button
        Then the message "Valuation Control successfully saved" should appear

        Then the "Currency" field should contain "Euro"
        Then the "Amount" field should contain "120"
        Then the "Source" field should contain "Cesar Villalobos"
        Then the "Date" field should contain "2016-01-10"
        Then the "Renewal Date" field should contain "2017-01-02"
        Then the "Type" field should contain "Original Value"
        Then the "Note" field should contain "CQA116 \n Test \n for subtest Test 13"	    
	    And clicks the "Go To Record" button
	    And clicks the "Delete" button 
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 

        Then close the browser



	Scenario: Testing links and "Go To Record" works #23
	    Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA116_NE"
	    And selects the "Valuation" tab
	    And clicks on result with text "CQA116.1"
	    Then the "Valuation Control Reference Number" field should contain "CQA116.1"
	    And clicks the "Go to record" button
	    Then the titlebar should contain "CQA116.1"
	    Then the "Valuation Control Reference Number" field should contain "CQA116.1"
	    Then close the browser	

	Scenario: Deleting relation via list #25
		Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA116_NE"
	    And selects the "Valuation" tab 

	    And clicks the "Add record" button 
	    And clicks on the Create button
	    And enters "CQA116.7" in the "Valuation Control Reference Number" field
	    And clicks the "Save" button
	    
	    And clicks the "Delete Relation" button on the row that reads "CQA116.7"
	    Then a delete confirmation dialog should appear
	    And clicks cancel button
	    Then the dialog should be dismissed 
	    Then the "Related Valuation Control Records" area should contain "CQA116.7"

	    And clicks the "Delete Relation" button on the row that reads "CQA116.7"
	    Then a delete confirmation dialog should appear
	    And clicks the "close" button
	    Then the dialog should be dismissed
	    Then the "Related Valuation Control Records" area should contain "CQA116.7"


	    And clicks the "Delete Relation" button on the row that reads "CQA116.7"
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 

	    Then "CQA116.7" should not appear in the "Procedures" area
	    Then "CQA116.7" should not appear in the "Related Valuation Control Records" area

    	And navigates to the record with identification number "CQA116.7"
        And selects the "Valuation" tab 
	    Then "CQA116_NE" should not appear in the "Related Valuation Control Records" area
	    And selects the "Current Record" tab

	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser


	Scenario: Deleting relation via record editor #27
		Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA116_NE"
	    Then "CQA116_NE" should be in the "Identification Number" field

	    And selects the "Valuation" tab 
	    And clicks the "Add record" button 
	    And clicks on the Create button
	    And enters "CQA116.8" in the "Valuation Control Reference Number" field
	    And clicks the "Save" button
	    And clicks on result with text "CQA116.8"
	    
	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear
	    And clicks cancel button
	    Then the dialog should be dismissed
	    Then the "Related Valuation Control Records" area should contain "CQA116.8"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear
	    And clicks close button
	    Then the dialog should be dismissed
	    Then the "Related Valuation Control Records" area should contain "CQA116.8"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    # Then the record editor should no longer be displayed (below list)
	    Then "CQA116.8" should not appear in the "Procedures" area 
	    Then "CQA116.8" should not appear in the "Related Valuation Control Records" area

	    And navigates to the record with identification number "CQA116.8"
	    And selects the "Valuation" tab 
	    Then the "Related Valuation Control Records" area should be empty
	    
	    And selects the "Current Record" tab 
	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser 


