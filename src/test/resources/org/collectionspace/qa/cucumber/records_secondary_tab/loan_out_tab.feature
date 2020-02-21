# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Loan Out Tab
  # Enter feature description here

	Scenario: Working Loan Out Secondary Tab #Test 1
		Given user is in the "My CollectionSpace" page
	   
	    And navigates to the record with identification number "CQA112_E"
   	    And selects the "Loan Out" tab
	    Then the "Related Loan Out Records" area should be empty

		And navigates to the record with identification number "CQA112_NE"
	    And selects the "Loan Out" tab
	    Then "CQA112.1" should appear in the "Related Loan Out Records" area

	    Then close the browser

	Scenario: Dismissing the dialog #Test 3
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA112_NE"
 
		#Variation A
		And clicks the "Add record" button 
	    And clicks the "close" button 
	    Then the "Related Loan Out Records" area should only contain "CQA112.1"

	    #Variation B
	    And clicks the "Add record" button
	    And presses the "ESC" key 
	    Then the "Related Loan Out Records" area should only contain "CQA112.1"


	Scenario: Searching and adding multiple Loan Out records #Test 5
		And clicks the "Add record" button 
	    And clicks the "search" button 
	    Then the search results should contain "CQA112.3" 
	    Then the search results should contain "CQA112.2" 

	    And selects the box with result "CQA112.3" 
	    And selects the box with result "CQA112.2" 
	    And clicks the "Add to current record" button  

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA112.3" should appear in the "Related Loan Out Records" area
	    Then "CQA112.2" should appear in the "Related Loan Out Records" area 
	    Then "CQA112.3" should appear in the "Procedures" area 
	    Then "CQA112.2" should appear in the "Procedures" area 


	    And clicks on result with text "CQA112.3" 
	    Then an "Edit Loan Out Record" form should be displayed 
	    Then the "Loan Out Number" field should contain "CQA112.3"
	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA112.3" should not appear in the "Related Loan Out Records" area 


	    And clicks on result with text "CQA112.2" 
	    Then an "Edit Loan Out Record" form should be displayed 
	    Then the "Loan Out Number" field should contain "CQA112.2"
	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA112.2" should not appear in the "Related Loan Out Records" area 

	    Then close the browser

	Scenario: Warning when navigating away from new Loan Out record #Test 7 
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA112_NE"
	    Then "CQA112_NE" should be in the "Identification Number" field
	    And selects the "Loan Out" tab 
	    
	    And clicks the "Add record" button
		And clicks the "Create New" button
		
		Then the dialog should be dismissed
		Then the message "Creating new record..." should be displayed
	    
		Then the "Loan Out Number" field should be empty
	    And enters "CQA112.4" in the "Loan Out Number" field


	    #Variation A
	    	And selects the "Current Record" tab
		    Then a leave confirmation dialog should appear 
		    And clicks the "close" button  
		    Then the "Loan Out Number" field should contain "CQA112.4"


		#Variation B
			And selects the "Current Record" tab
		    Then a leave confirmation dialog should appear  
		    And clicks the "cancel" button
		    Then the "Loan Out Number" field should contain "CQA112.4"

	    ## Variation D
		    And selects the "Current Record" tab
		    And clicks the "Don't save" button 
		   	And selects the "Loan Out" tab 
		    Then "CQA112.4" should not appear in the "Related Loan Out Records" area


		#Variation C
			And clicks the "Add record" button
	    	And clicks on the Create button
	    	And enters "CQA112.4" in the "Loan Out Number" field 
			And selects the "Current Record" tab
			And clicks on the "Save" button

		    And selects the "Loan Out" tab 
		    Then "CQA112.4" should appear in the "Related Loan Out Records" area 

		    And navigates to the record with identification number "CQA112.4"
		    And clicks on the delete button 

		    Then a delete confirmation dialog should appear
		    And clicks on the delete button 
		    Then the deletion should be confirmed in a dialog
		    Then close the browser

	Scenario: Cancel changes button #Test 9
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA112_NE"
		And selects the "Loan Out" tab
	    And clicks the "Add record" button 
	    And clicks the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the "bottom" of the page "should not" be clickable
	    Then the "cancel changes" button at the "top" of the page "should not" be clickable
	    
	    And enters "CQA112.5" in the "Loan Out Number" field
	    And clicks the "cancel changes" button 
    	Then the "Loan Out Number" field should be empty

	    # Variation B
	    And enters "CQA112.5" in the "Loan Out Number" field
	    And clicks on the "Save" button 
	    Then the "cancel changes" button at the "top" of the page "should not" be clickable 
    	Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   
   
	    And clicks the "Go to record" button
	    And clicks the "Delete" button 
	    Then a delete confirmation dialog should appear
	    And clicks the confirmation delete button
	    Then the deletion should be confirmed in a dialog
	    Then close the browser



	Scenario: Check loan Out number and scuccessful save and  All felds saved on edited Loan Out record #Test 13


        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "CQA112_NE"
        And selects the "Loan Out" tab 

        And clicks the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify a Loan Out Number" should appear 

        And enters "CQA112.11" in the "Loan Out Number" field
        And clicks on the "Save" button

        Then the message "Relation successfully created." should appear
        Then "CQA112.11" should appear in the "Related Loan Out Records" area


        And selects "Exhibition" from the "Loan Purpose" drop down        
        And enters "2016-01-27" in the "Loan Status Date" field
        And enters "CQA112: Loan Status" in the "Loan Status Note" field
        And selects "Agreed" from the "Loan Status" drop down
        And enters "Cesar Villalobos" in the "Lender" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Lender's Contact" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Lender's Authorizer" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "2016-01-01" in the "Authorization Date" field
        And enters "Cesar Villalobos" in the "Borrower's Contact" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Borrower's Authorizer" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "2016-02-02" in the "Borrower's Authorization Date" field
        And enters "This \n Is \n A test \n for CQA112" in the "Loan Out Conditions" field
        And enters "CQA112" in the "Loan Out Note" field

        And enters "2015-03-05" in the "Loan Out Date" field
        And enters "2016-05-03" in the "Loan Return Date" field
        And enters "2017-06-01" in the "Loan Renewal Application Date" field
        And clicks on the "Save" button

        Then the message "Loan Out successfully saved" should appear


        Then the "Loan Out Number" field should contain "CQA112.11"
        Then the "Loan Out Purpose" field should contain "Exhibition"
        Then the "Loan Status Date" field should contain "2016-01-27"
        Then the "Loan Status Note" field should contain "CQA112: Loan Status"
        Then the "Loan Status" field should contain "Agreed"
        Then the "Lender" field should contain "Cesar Villalobos"
        Then the "Lender's Contact" field should contain "Cesar Villalobos"
        Then the "Lender's Authorizer" field should contain "Cesar Villalobos"
        Then the "Authorization Date" field should contain "2016-01-01"
        Then the "Borrower's Contact" field should contain "Cesar Villalobos"
        Then the "Borrower's Authorizer" field should contain "Cesar Villalobos"
        Then the "Borrower's Authorization Date" field should contain "2016-02-02"
        Then the "Loan Out Conditions" field should contain "This \n Is \n A test \n for CQA112"
        Then the "Loan Out Note" field should contain "CQA112"
        Then the "Loan Out Date" field should contain "2015-03-05"
        Then the "Loan Return Date" field should contain "2016-05-03"
        Then the "Loan Renewal Application Date" field should contain "2017-06-01"

        
        Scenario: Test 13-->
        And selects "Research" from the "Loan Purpose" drop down        
        And enters "2016-02-22" in the "Loan Status Date" field
        And enters "CQA112: Loan Status Test 13" in the "Loan Status Note" field
        And selects "Authorized" from the "Loan Status" drop down
        And enters "Cesar Villalobos" in the "Lender" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Lender's Contact" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Lender's Authorizer" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "2002-02-02" in the "Authorization Date" field
        And enters "Cesar Villalobos" in the "Borrower's Contact" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Borrower's Authorizer" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "2016-03-03" in the "Borrower's Authorization Date" field
        And enters "This \n Is \n A test \n for CQA112 Test 13" in the "Loan Out Conditions" field
        And enters "CQA112 Test 13" in the "Loan Out Note" field
        And enters "2015-03-08" in the "Loan Out Date" field
        And enters "2018-05-03" in the "Loan Return Date" field
        And enters "2017-06-01" in the "Loan Renewal Application Date" field
        And clicks on the "Save" button

        Then the message "Loan Out successfully saved" should appear


        Then the "Loan Out Number" field should contain "CQA112.11"
        Then the "Loan Out Purpose" field should contain "Research"
        Then the "Loan Status Date" field should contain "2016-02-22"
        Then the "Loan Status Note" field should contain "CQA112: Loan Status Test 13"
        Then the "Loan Status" field should contain "Authorized"
        Then the "Lender" field should contain "Cesar Villalobos"
        Then the "Lender's Contact" field should contain "Cesar Villalobos"
        Then the "Lender's Authorizer" field should contain "Cesar Villalobos"
        Then the "Authorization Date" field should contain "2002-02-02"
        Then the "Borrower's Contact" field should contain "Cesar Villalobos"
        Then the "Borrower's Authorizer" field should contain "Cesar Villalobos"
        Then the "Borrower's Authorization Date" field should contain "2016-03-03"
        Then the "Loan Out Conditions" field should contain "This \n Is \n A test \n for CQA112 Test 13"
        Then the "Loan Out Note" field should contain "CQA112 Test 13"
        Then the "Loan Out Date" field should contain "2015-03-08"
        Then the "Loan Return Date" field should contain "2018-05-03"
        Then the "Loan Renewal Application Date" field should contain "2017-06-01"
        And clicks the "Go To Record" button        
        And clicks the "Delete" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 

        Then close the browser

	Scenario: Testing links and "Go To Record" works #Test 23
	    Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA112_NE"
	    And selects the "Loan Out" tab 
	    And clicks on result with text "CQA112.1"
	    Then the "Loan Out Number" field should contain "CQA112.1"
	    And clicks the "Go to record" button
	    Then the titlebar should contain "CQA112.1"
	    Then the "Loan Out Number" field should contain "CQA112.1"
	    Then close the browser	

	Scenario: Deleting relation via list #Test 25
		Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA112_NE"
	    And selects the "Loan Out" tab 

	    And clicks the "Add record" button 
	    And clicks on the Create button
	    And enters "CQA112.7" in the "Loan Out Number" field
	    And clicks the "Save" button
	    
	    And clicks the "Delete Relation" button on the row that reads "CQA112.7"
	    Then a delete confirmation dialog should appear
	    And clicks cancel button
	    Then the dialog should be dismissed 
	    Then the "Related Loan Out Records" area should contain "CQA112.7"

	    And clicks the "Delete Relation" button on the row that reads "CQA112.7"
	    Then a delete confirmation dialog should appear
	    And clicks the "close" button
	    Then the dialog should be dismissed
	    Then the "Related Loan Out Records" area should contain "CQA112.7"


	    And clicks the "Delete Relation" button on the row that reads "CQA112.7"
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 

	    Then "CQA112.7" should not appear in the "Procedures" area
	    Then "CQA112.7" should not appear in the "Related Loan Out Records" area

    	And navigates to the record with identification number "CQA112.7"
        And selects the "Loan Out" tab 
	    Then "CQA112_NE" should not appear in the "Related Loan Out Records" area   
	    And selects the "Current Record" tab

	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser

	Scenario: Deleting relation via record editor #Test 27
		Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA112_NE"
	    Then "CQA112_NE" should be in the "Identification Number" field

	    And selects the "Loan Out" tab 
	    And clicks the "Add record" button 
	    And clicks on the Create button
	    And enters "CQA112.8" in the "Loan Out Number" field
	    And clicks the "Save" button
	    And clicks on result with text "CQA112.8"
	    
	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear  
	    And clicks cancel button
	    Then the dialog should be dismissed  
	    Then the "Related Loan Out Records" area should contain "CQA112.8"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear  
	    And clicks close button
	    Then the dialog should be dismissed  
	    Then the "Related Loan Out Records" area should contain "CQA112.8"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    # Then the record editor should no longer be displayed (below list)
	    Then "CQA112.8" should not appear in the "Procedures" area   
	    Then "CQA112.8" should not appear in the "Related Loan Out Records" area

	    And navigates to the record with identification number "CQA112.8"
	    And selects the "Loan Out" tab 
	    Then the "Related Loan Out Records" area should be empty
	    
	    And selects the "Current Record" tab 
	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser 




