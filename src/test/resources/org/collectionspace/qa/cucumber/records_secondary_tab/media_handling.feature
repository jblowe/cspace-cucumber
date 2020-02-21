# Created by Cesar Villalobos on 12/28/2015

@recordssecondarytab
Feature: Media Handling Page Tab
  # Enter feature description here

	Scenario:  Working Media Handling Secondary tab #1
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA114_NE"

	    And selects the "Media Handling" tab
	    Then "CQA114.1" should appear in the "Related Media Handling Records" area

	    And navigates to the record with identification number "CQA114_E"
	    Then the "Related Media Handling Records" area should be empty
	    Then close the browser

	Scenario:  Dismissing the dialog #2
  		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA114_NE"

		#Variation A
		And clicks the "Add record" button 
	    And clicks the "close" button 
	    Then the "Related Media Handling Records" area should only contain "CQA114.1"

	    #Variation B
	    And clicks the "Add record" button
	    And presses the "ESC" key 
	    Then the "Related Media Handling Records" area should only contain "CQA114.1"

	Scenario: Searching and adding multiple Media Handling records #3
		And clicks the "Add record" button 
	    And clicks the "search" button
	    Then the search results should contain "CQA114.3" 
	    Then the search results should contain "CQA114.2" 

	    And selects the box with result "CQA114.3" 
	    And selects the box with result "CQA114.2" 
	    And clicks the "Add to current record" button  

	    #Expected, Group #1
	    Then the dialog should be dismissed 
	    Then "CQA114.3" should appear in the "Related Media Handling Records" area   
	    Then "CQA114.2" should appear in the "Related Media Handling Records" area   
	    Then "CQA114.3" should appear in the "Procedures" area   
	    Then "CQA114.2" should appear in the "Procedures" area   

	    And clicks on result with text "CQA114.3" 
	    Then an "Edit Media Record" form should be displayed 
	    Then the "Identification Number" field should contain "CQA114.3"
	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA114.3" should not appear in the "Related Media Handling Records" area

	    And clicks on result with text "CQA114.2" 
	    Then an "Edit Media Record" form should be displayed 
	    Then the "Identification Number" field should contain "CQA114.2"
	    And clicks the "Delete this relation." button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then "CQA114.2" should not appear in the "Related Media Handling Records" area 

	    Then close the browser



	Scenario: Warning when navigating away from new Media Handling record #4
  		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA114_NE"
	    Then "CQA114_NE" should be in the "Identification Number" field
	    And selects the "Media Handling" tab

	    And clicks the "Add record" button 
		And clicks the "Create New" button

		Then the dialog should be dismissed
		Then the message "Creating new record..." should be displayed 
		And enters "CQA114.4" in the "Media Handling Number" field 


	    #Variation A
    	And selects the "Current Record" tab
	    Then a leave confirmation dialog should appear 
	    And clicks the "close" button  
	    Then the "Identification Number" field should contain "CQA114.4"

		#Variation B
		And selects the "Current Record" tab
	    Then a leave confirmation dialog should appear  
	    And clicks the "cancel" button
	    Then the "Identification Number" field should contain "CQA114.4"

	    ## Variation D
	    And selects the "Current Record" tab
	    And clicks the "Don't save" button 
	   	And selects the "Media Handling" tab 
	    Then "CQA114.4" should not appear in the "Related Media Handling Records" area


		#Variation C
		And clicks the "Add record" button
    	And clicks on the Create button
    	And enters "CQA114.4" in the "Identification Number" field 
		And selects the "Current Record" tab
		And clicks on the "Save" button

	    And selects the "Media Handling" tab 
	    Then "CQA114.4" should appear in the "Related Media Handling Records" area 

	    And navigates to the record with identification number "CQA114.4"
	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser

	Scenario: Cancel changes button #5
		Given user is in the "My CollectionSpace" page
		And navigates to the record with identification number "CQA114_NE"
		And selects the "Media Handling" tab
	    And clicks the "Add record" button 
	    And clicks the "Create new" button

	    # Variation A
	    Then the message "Creating new record..." should be displayed
	   	Then the "cancel changes" button at the "bottom" of the page "should not" be clickable
	    Then the "cancel changes" button at the "top" of the page "should not" be clickable
	    
	    And enters "CQA114.5" in the "Identification Number" field
	    And clicks the "cancel changes" button 
    	Then the "Identification Number" field should be empty

	    # Variation B 
	    And enters "CQA114.5" in the "Identification Number" field
	    And clicks on the "Save" button 
	    Then the "cancel changes" button at the "top" of the page "should not" be clickable 
    	Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   

	    And clicks the "Go to record" button
	    And clicks the "Delete" button 
	    Then a delete confirmation dialog should appear
	    And clicks the confirmation delete button
	    Then the deletion should be confirmed in a dialog
	    Then close the browser


	Scenario: Check Identification Number and successful save, and edited Media Handling record 
        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "CQA114_NE" 
        And selects the "Media Handling" tab 

        And clicks the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify an Identification Number" should appear
        And enters "CQA114.11" in the "Identification Number" field
        And clicks the "Save" button
        Then the message "Relation successfully created." should appear  
        
        And enters "CQA114 Form Filling" in the "Title" field
        And selects "base" from the "Part" drop down
        And selects "area" from the "Dimension" drop down
        And selects "Ruler" from the "Method" drop down
        And selects "carats" from the "Dimension Unit" drop down
        And enters "Cesar Villalobos" in the "Measured By" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "114.2" in the "Value" field
        And enters "114.3" in the "Value Quantifier" field
        And enters "2016-01-01" in the "Date" field
        And enters "CQA114 Summary box" in the "Summary" field
        And enters "Cesar Villalobos" in the "Contributor" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Creator" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Publisher" field
        And selects "Cesar Villalobos" from autocomplete options
        And selects "Dataset" from the "Types" drop down
        And enters "CQA114 Coverage Box" in the "Coverage" field
        And enters "2016-02-02" in the "Dates" field
        And enters "CQA114 Source Box" in the "Source" field
        And enters "CQA114.1" in the "Relations" field
        And enters "None" in the "Subjects" field     
        And selects "French" from the "Languages" drop down
        And enters "No copyright here" in the "Copyright statement" field
        And enters "Cesar Villalobos" in the "Rights holder" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "CQA114 description box" in the "Description" field   
        And clicks the "Save" button
        Then the message "Media Handling successfully saved" should appear

        ## test 11 thens

        Then the "Title" field should contain "CQA114 Form Filling"
        Then the "Part" field should contain "base"
        Then the "Dimension" field should contain "area"
        Then the "Method" field should contain "Ruler"
        Then the "Dimension Unit" field should contain "carats"
        Then the "Measured By" field should contain "Cesar Villalobos"
        Then the "Value" field should contain "114.2"
        Then the "Value Quantifier" field should contain "114.3"
        Then the "Date" field should contain "2016-01-01"
        Then the "Summary" field should contain "CQA114 Summary box"
        Then the "Types" field should contain "Dataset"
        Then the "Coverage" field should contain "CQA114 Coverage Box"
        Then the "Dates" field should contain "2016-02-02"
        Then the "Source" field should contain "CQA114 Source Box"
        Then the "Creator" field should contain "Cesar Villalobos"
        Then the "Relations" field should contain "CQA114.1"
        Then the "Subjects" field should contain "None"
        Then the "Publisher" field should contain "Cesar Villalobos"
        Then the "Copyright statement" field should contain "No copyright here"
        Then the "Rights holder" field should contain "Cesar Villalobos"
        Then the "Description" field should contain ""
        Then the "Description" field should contain "CQA114 description box"
        Then the "Languages" field should contain "French"

        #### Test 13
        And enters "CQA114 Form Filling Part 1" in the "Title" 
        And selects "frame" from the "Part" drop down
        And selects "base" from the "Dimension" drop down
        And selects "Odometers" from the "Method" drop down
        And selects "feet" from the "Dimension Unit" drop down
        And enters "Jennifer Be" in the "Measured By" field
        And selects "Jennifer Be" from autocomplete options
        And enters "114.2.2" in the "Value" field
        And enters "114.3.3" in the "Value Quantifier" field
        And enters "2017-01-01" in the "Date" field
        And enters "CQA114 Summary box Pt 2" in the "Summary" field
        And enters "Jennifer Be" in the "Contributor" field
        And selects "Jennifer Be" from autocomplete options
        And enters "Jennifer Be" in the "Creator" field
        And selects "Jennifer Be" from autocomplete options
        And enters "Jennifer Be" in the "Publisher" field
        And selects "Jennifer Be" from autocomplete options
        And selects "Dataset" from the "Types" drop down
        And enters "CQA114 Coverage Box edited" in the "Coverage" field
        And enters "2017-02-02" in the "Dates" field
        And enters "CQA114 Source Box edited" in the "Source" field
        And enters "CQA114.1" in the "Relations" field
        And enters "None" in the "Subjects" field     
        And selects "German" from the "Languages" drop down
        And enters "All copyrights deserved" in the "Copyright statement" field
        And enters "Jennifer Be" in the "Rights holder" field
        And selects "Jennifer Be" from autocomplete options
        And enters "CQA114 description box pt 2" in the "Description" field   
        And clicks the "Save" button
        Then the message "Media Handling successfully saved" should appear

        ## test 13 thens

        Then the "Title" field should contain "CQA114 Form Filling Part 1"
        Then the "Part" field should contain "frame"
        Then the "Dimension" field should contain "base"
        Then the "Method" field should contain "Odometers"
        Then the "Dimension Unit" field should contain "feet"
        Then the "Measured By" field should contain "Jennifer Be"
        Then the "Value" field should contain "114.2.2"
        Then the "Value Quantifier" field should contain "114.3.3"
        Then the "Date" field should contain "2017-01-01"
        Then the "Summary" field should contain "CQA114 Summary box Pt 2"
        Then the "Types" field should contain "Dataset"
        Then the "Coverage" field should contain "CQA114 Coverage Box edited"
        Then the "Dates" field should contain "2017-02-02"
        Then the "Source" field should contain "CQA114 Source Box edited"
        Then the "Creator" field should contain "Jennifer Be"
        Then the "Relations" field should contain "CQA114.1"
        Then the "Subjects" field should contain "None"
        Then the "Publisher" field should contain "Jennifer Be"
        Then the "Copyright statement" field should contain "All copyrights deserved"
        Then the "Rights holder" field should contain "Jennifer Be"
        Then the "Description" field should contain "CQA114 description box pt 2"
        Then the "Languages" field should contain "German"
        And clicks the "Go To Record" button	    
	    And clicks the "Delete" button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
         
        Then close the browser

	Scenario: Testing links and "Go To Record" works #10
		Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA114_NE"
	    And selects the "Media Handling" tab 
	    And clicks on result with text "CQA114.1"
	    Then the "Identification Number" field should contain "CQA114.1"
	    And clicks the "Go to record" button
	    Then the titlebar should contain "CQA114.1"
	    Then the "Identification Number" field should contain "CQA114.1"
	    Then close the browser	

	Scenario: Deleting relation via list #11
		Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA114_NE"
	    And selects the "Media Handling" tab 

	    And clicks the "Add record" button 
	    And clicks on the Create button
	    And enters "CQA114.7" in the "Identification Number" field 
	    And clicks the "Save" button
	    
	    And clicks the "Delete Relation" button on the row that reads "CQA114.7"
	    Then a delete confirmation dialog should appear
	    And clicks cancel button
	    Then the dialog should be dismissed 
	    Then the "Related Media Handling Records" area should contain "CQA114.7"

	    And clicks the "Delete Relation" button on the row that reads "CQA114.7"
	    Then a delete confirmation dialog should appear
	    And clicks the "close" button
	    Then the dialog should be dismissed
	    Then the "Related Media Handling Records" area should contain "CQA114.7"


	    And clicks the "Delete Relation" button on the row that reads "CQA114.7"
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 

	    Then "CQA114.7" should not appear in the "Procedures" area
	    Then "CQA114.7" should not appear in the "Related Media Handling Records" area

    	And navigates to the record with identification number "CQA114.7"
        And selects the "Media Handling" tab 
	    Then "CQA114_NE" should not appear in the "Related Media Handling Records" area   
	    And selects the "Current Record" tab

	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser

	Scenario: Deleting relation via record editor #Test 27
		Given user is in the "My CollectionSpace" page
	    And navigates to the record with identification number "CQA114_NE"
	    Then "CQA114_NE" should be in the "Identification Number" field

	    And selects the "Media Handling" tab
	    And clicks the "Add record" button 
	    And clicks on the Create button
	    And enters "CQA114.8" in the "Identification Number" field
	    And clicks the "Save" button
	    And clicks on result with text "CQA114.8"
	    
	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear
	    And clicks cancel button 
	    Then the dialog should be dismissed
	    Then the "Related Media Handling Records" area should contain "CQA114.8"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear 
	    And clicks close button
	    Then the dialog should be dismissed 
	    Then the "Related Media Handling Records" area should contain "CQA114.8"

	    And clicks the "Delete this relation" button
	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog

	    Then "CQA114.8" should not appear in the "Procedures" area   
	    Then "CQA114.8" should not appear in the "Related Media Handling Records" area

	    And navigates to the record with identification number "CQA114.8"
	    And selects the "Media Handling" tab
	    Then the "Related Media Handling Records" area should be empty
	    
	    And selects the "Current Record" tab 
	    And clicks on the delete button 

	    Then a delete confirmation dialog should appear
	    And clicks on the delete button 
	    Then the deletion should be confirmed in a dialog
	    Then close the browser 

