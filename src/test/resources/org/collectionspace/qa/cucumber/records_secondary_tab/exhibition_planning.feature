# Created by Cesar Villalobos on 12/29/2015

@recordssecondarytab
Feature: Exhibition Planning Tab
  # Enter feature description here

 	Scenario: Working Exhibition Secondary Tab #1
        Given user is in the "My CollectionSpace" page
       
        And navigates to the record with identification number "CQA105_E"
        And selects the "Exhibition" tab     
        Then the "Related Exhibition Records" area should be empty
       
        And navigates to the record with identification number "CQA105_NE"
        And selects the "Exhibition" tab
        Then "CQA105.1" should appear in the "Related Exhibition Records" area

        Then close the browser

	Scenario: Dismissing the dialog #3
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA105_NE"

        #Variation A
        And clicks the "Add record" button 
        And clicks the "close" button 
        Then the "Related Exhibition Records" area should only contain "CQA105.1"

        #Variation B
        And clicks the "Add record" button
        And presses the "ESC" key 
        Then the "Related Exhibition Records" area should only contain "CQA105.1"


	Scenario: Searching and adding multiple Exhibition records #5
        And clicks the "Add record" button 
        And clicks the "search" button 
        Then the search results should contain "CQA105.3" 
        Then the search results should contain "CQA105.2" 

        And selects the box with result "CQA105.3" 
        And selects the box with result "CQA105.2" 
        And clicks the "Add to current record" button

        #Expected, Group #1
        Then the dialog should be dismissed 
        Then "CQA105.3" should appear in the "Related Exhibition Records" area
        Then "CQA105.2" should appear in the "Related Exhibition Records" area 
        Then "CQA105.3" should appear in the "Procedures" area 
        Then "CQA105.2" should appear in the "Procedures" area 


        And clicks on result with text "CQA105.3" 
        Then an "Edit Exhibition Record" form should be displayed 
        Then the "Exhibition Number" field should contain "CQA105.3"
        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then "CQA105.3" should not appear in the "Related Exhibition Records" area 


        And clicks on result with text "CQA105.2" 
        Then an "Edit Exhibition Record" form should be displayed 
        Then the "Exhibition Number" field should contain "CQA105.2"
        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then "CQA105.2" should not appear in the "Related Exhibition Records" area 
        Then close the browser

	Scenario: Warning when navigating away from new Exhibition record 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA105_NE"
        Then "CQA105_NE" should be in the "Identification Number" field
        And selects the "Exhibition" tab 
        
        And clicks the "Add record" button
        And clicks the "Create New" button
        
        Then the dialog should be dismissed
        Then the message "Creating new record..." should be displayed
        
        Then the "Exhibition Number" field should be empty
        And enters "CQA105.4" in the "Exhibition Number" field


        #Variation A
        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear 
        And clicks the "close" button  
        Then the "Exhibition Number" field should contain "CQA105.4"


        #Variation B
        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear  
        And clicks the "cancel" button
        Then the "Exhibition Number" field should contain "CQA105.4"

        ## Variation D
        And selects the "Current Record" tab
        And clicks the "Don't save" button 
        And selects the "Exhibition" tab 
        Then "CQA105.4" should not appear in the "Related Exhibition Records" area


        #Variation C
        And clicks the "Add record" button
        And clicks on the Create button
        And enters "CQA105.4" in the "Exhibition Number" field 
        And selects the "Current Record" tab
        And clicks on the "Save" button

        And selects the "Exhibition" tab 
        Then "CQA105.4" should appear in the "Related Exhibition Records" area 

        And navigates to the record with identification number "CQA105.4"
        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then close the browser

	Scenario: Cancel Changes button #9
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA105_NE"
        And selects the "Exhibition" tab
        And clicks the "Add record" button
        And clicks the "Create new" button

        # Variation A
        Then the message "Creating new record..." should be displayed
        Then the "cancel changes" button at the "bottom" of the page "should not" be clickable
        Then the "cancel changes" button at the "top" of the page "should not" be clickable
        
        And enters "CQA105.5" in the "Exhibition Number" field
        And clicks the "cancel changes" button 
        Then the "Exhibition Number" field should be empty

        # Variation B
        And enters "CQA105.5" in the "Exhibition Number" field
        And clicks on the "Save" button 
        Then the "cancel changes" button at the "top" of the page "should not" be clickable 
        Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   
   
        And clicks the "Go to record" button
        And clicks the "Delete" button 
        Then a delete confirmation dialog should appear
        And clicks the confirmation delete button
        Then the deletion should be confirmed in a dialog
        Then close the browser


	Scenario: Check Exhibition Number and successful save, and all fields saved on edited Exhibition record #13

        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "CQA105_NE" 
        And selects the "Media Handling" tab 

        And clicks the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify an Exhibition Number" should appear
        And enters "CQA105.11" in the "Exhibition Number" field
        And clicks the "Save" button
        Then the message "Relation successfully created." should appear
      

        And enters "CQA105_Test_11" in the "Exhibition Title" field
        And selects "Permanent" from the "Exhibition Type" drop down

        And enters "CQA105_Room" in the "Venues" field
        And selects "CQA105_Room" from autocomplete options
        And enters "2016-01-01" in the "Opening Date" field
        And enters "2016-02-02" in the "Closing Date" field
        And enters "115" in the "Attendance" field
        And enters "www.CollectionSpace.org" in the "Web Address" field
        And enters "CQA105 Working Group" in the "Working Group Title" field
        And enters "CQA105 Notes Field" in the "Notes" field 
        And enters "Cesar Villalobos" in the "Sponsor" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Organizer" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Cesar Villalobos" in the "Person" field
        And selects "Cesar Villalobos" from autocomplete options
        And selects "Curator" from the "Role" drop down
        And enters "CQA-105 Planning Notes" in the "Planning Notes" field
        And enters "CQA-105 Curatorial Notes" in the "Curatorial Notes" field
        And enters "CQA-105 Boilerplate Text" in the "Boilerplate Text" field
        And enters "CQA-105 General Notes" in the "General Notes" field
        And enters "CQA105.11.2" in the "Rotation Name" field
        And enters "2016-03-03" in the "Start Date" field
        And enters "2016-04-04" in the "End Date" field        
        And enters "CQA105 Notes Field" in the "Notes" field
        And enters "Cesar Villalobos" in the "Reference" field
        And selects "Cesar Villalobos" from autocomplete options
        And selects "Catalog" from the "Reference Type" drop down
        And enters "CQA105 Ref Box" in the "Reference Note" field
        And enters "CQA105.11.3" in the "Section" field
        And enters "CQA105.11.4" in the "Location" field
        And enters "CQA105.11.5" in the "Objects" field
        And enters "CQA105.11.6" in the "Remarks" field
        And selects "Labels written" from the "Status" drop down
        And enters "2016-05-05" in the "Status Date" field
        And enters "CQA105.11.6" in the "Remarks" field
        And enters "Yes" in the "Object" field
        And enters "CQA105" in the "Name" field
        And enters "2016-06-06" in the "Cons. Check" field
        And selects "Needed" from the "Cons. Treatment" field
        And selects "Done" from the "Mount?" field
        And enters "CQA105.11.3" in the "Section" field
        And enters "CQA105.11.9" in the "Case" field
        And enters "CQA105.11.10" in the "Seq. #" field
        And enters "CQA105.11.11" in the "Rotation" field
        And enters "CQA105.11.12" in the "Note" field

        And clicks the "Save" button
        Then the message "Exhibition successfully saved" should appear

        Then the "Exhibition Title" field should contain "CQA105_Test_11"
        Then the "Exhibition Type" field should contain "Permanent"
        Then the "CQA105_Room" field should contain "CQA105_Room"
        Then the "Opening Date" field should contain "2016-01-01"
        Then the "Closing Date" field should contain "2016-02-02"
        Then the "Attendance" field should contain "115"
        Then the "Web Address" field should contain "www.CollectionSpace.org"
        Then the "Working Group Title" field should contain "CQA105 Working Group"
        Then the "Notes" field should contain "CQA105 Notes Field"
        Then the "Sponsor" field should contain "Cesar Villalobos"
        Then the "Organizer" field should contain "Cesar Villalobos"
        Then the "Person" field should contain "Cesar Villalobos"
        Then the "Role" field should contain "Curator"
        Then the "Planning Notes" field should contain "CQA-105 Planning Notes"
        Then the "Curatorial Notes" field should contain "CQA-105 Curatorial Notes"
        Then the "Boilerplate Text" field should contain "CQA-105 Boilerplate Text"
        Then the "General Notes" field should contain "CQA-105 General Notes"
        Then the "Rotation Name" field should contain "CQA105.11.2"
        Then the "Start Date" field should contain "2016-03-03"
        Then the "End Date" field should contain "2016-04-04"
        Then the "Reference" field should contain "Cesar Villalobos"
        Then the "Reference Type" field should contain "Catalog"
        Then the "Reference Note" field should contain "CQA105 Ref Box"
        Then the "Section" field should contain "CQA105.11.3"
        Then the "Location" field should contain "CQA105.11.4"
        Then the "Objects" field should contain "CQA105.11.5"
        Then the "Remarks" field should contain "CQA105.11.6"
        Then the "Status" field should contain "Labels written"
        Then the "Status Date" field should contain "2016-05-05"
        Then the "Object" field should contain "Yes"
        Then the "Name" field should contain "CQA105"
        Then the "Cons. Check" field should contain "2016-06-06"
        Then the "Cons. Treatment" field should contain "Needed"
        Then the "Mount?" field should contain "Done"
        Then the "Seq. #" field should contain "CQA105.11.10"
        Then the "Rotation" field should contain "CQA105.11.11"
        Then the "Note" field should contain "CQA105.11.12"
        Then the "Case" field should contain "CQA105.11.9"

        ###Test 13
        
        And enters "CQA105_Test_11 Test 13" in the "Exhibition Title" field
        And selects "Temporary" from the "Exhibition Type" drop down
        And enters "CQA105_Room" in the "Venues" field
        And selects "CQA105_Room" from autocomplete options
        And enters "2017-01-01" in the "Opening Date" field
        And enters "2017-02-02" in the "Closing Date" field
        And enters "115_13" in the "Attendance" field
        And enters "www.CollectionSpace.org" in the "Web Address" field
        And enters "CQA105 Working Group 13" in the "Working Group Title" field
        And enters "CQA105 Notes Field 13" in the "Notes" field 
        And enters "Jennifer Be" in the "Sponsor" field
        And selects "Jennifer Be" from autocomplete options
        And enters "Jennifer Be" in the "Organizer" field
        And selects "Jennifer Be" from autocomplete options
        And enters "Jennifer Be" in the "Person" field
        And selects "Jennifer Be" from autocomplete options
        And selects "Educator" from the "Role" drop down
        And enters "CQA-105_13 Planning Notes" in the "Planning Notes" field
        And enters "CQA-105_13 Curatorial Notes" in the "Curatorial Notes" field
        And enters "CQA-105_13 Boilerplate Text" in the "Boilerplate Text" field
        And enters "CQA-105_13 General Notes" in the "General Notes" field
        And enters "CQA105.11.13.2" in the "Rotation Name" field
        And enters "2017-03-03" in the "Start Date" field
        And enters "2017-04-04" in the "End Date" field        
        And enters "CQA105 Notes Field 13" in the "Notes" field
        And enters "Jennifer Be" in the "Reference" field
        And selects "Jennifer Be" from autocomplete options
        And selects "Catalog" from the "Reference Type" drop down
        And enters "CQA105 Ref Box Test 13" in the "Reference Note" field
        And enters "CQA105.11.13.3" in the "Section" field
        And enters "CQA105.11.13.4" in the "Location" field
        And enters "CQA105.11.13.5" in the "Objects" field
        And enters "CQA105.11.13.6" in the "Remarks" field
        And selects "Labels written" from the "Status" drop down
        And enters "2017-05-05" in the "Status Date" field
        And enters "CQA105.11.13.6" in the "Remarks" field
        And enters "No" in the "Object" field
        And enters "CQA105" in the "Name" field
        And enters "2017-06-06" in the "Cons. Check" field
        And selects "Not needed" from the "Cons. Treatment" field
        And selects "Needed" from the "Mount?" field
        And enters "CQA105.11.13.3" in the "Section" field
        And enters "CQA105.11.13.9" in the "Case" field
        And enters "CQA105.11.13.10" in the "Seq. #" field
        And enters "CQA105.11.13.11" in the "Rotation" field
        And enters "CQA105.11.13.12" in the "Note" field

        And clicks the "Save" button
        Then the message "Exhibition successfully saved" should appear

        Then the "Exhibition Title" field should contain "CQA105_Test_11 Test 13"
        Then the "Exhibition Type" field should contain "Temporary"
        Then the "CQA105_Room" field should contain "CQA105_Room"
        Then the "Opening Date" field should contain "2017-01-01"
        Then the "Closing Date" field should contain "2017-02-02"
        Then the "Attendance" field should contain "115_13"
        Then the "Web Address" field should contain "www.CollectionSpace.org"
        Then the "Working Group Title" field should contain "CQA105 Working Group 13"
        Then the "Notes" field should contain "CQA105 Notes Field 13"
        Then the "Sponsor" field should contain "Jennifer Be"
        Then the "Organizer" field should contain "Jennifer Be"
        Then the "Person" field should contain "Jennifer Be"
        Then the "Role" field should contain "Educator"
        Then the "Planning Notes" field should contain "CQA-105_13 Planning Notes"
        Then the "Curatorial Notes" field should contain "CQA-105_13 Curatorial Notes"
        Then the "Boilerplate Text" field should contain "CQA-105_13 Boilerplate Text"
        Then the "General Notes" field should contain "CQA-105_13 General Notes"
        Then the "Rotation Name" field should contain "CQA105.11.13.2"
        Then the "Start Date" field should contain "2017-03-03"
        Then the "End Date" field should contain "2017-04-04"
        Then the "Reference" field should contain "Jennifer Be"
        Then the "Reference Type" field should contain "Catalog"
        Then the "Reference Note" field should contain "CQA105 Ref Box Test 13"
        Then the "Section" field should contain "CQA105.11.13.3"
        Then the "Location" field should contain "CQA105.11.13.4"
        Then the "Objects" field should contain "CQA105.11.13.5"
        Then the "Remarks" field should contain "CQA105.11.13.6"
        Then the "Status" field should contain "Labels written"
        Then the "Status Date" field should contain "2017-05-05"
        Then the "Object" field should contain "No"
        Then the "Name" field should contain "CQA105"
        Then the "Cons. Check" field should contain "2017-06-06"
        Then the "Cons. Treatment" field should contain "Not needed"
        Then the "Mount?" field should contain "Needed"
        Then the "Seq. #" field should contain "CQA105.11.13.10"
        Then the "Rotation" field should contain "CQA105.11.13.11"
        Then the "Note" field should contain "CQA105.11.13.12"
        Then the "Case" field should contain "CQA105.11.13.9"
        And clicks the "Go To Record" button        
        And clicks the "Delete" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog        
        Then close the browser


	# Scenario: Listing displays correct fields #21
		#skip

	Scenario: Testing links and "Go To Record" works #23
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA105_NE"
        And selects the "Exhibition" tab 
        And clicks on result with text "CQA105.1"
        Then the "Exhibition Number" field should contain "CQA105.1"
        And clicks the "Go to record" button
        Then the titlebar should contain "CQA105.1"
        Then the "Exhibition Number" field should contain "CQA105.1"
        Then close the browser  

	Scenario: Deleting Relation via list #25
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA105_NE"
        And selects the "Exhibition" tab 

        And clicks the "Add record" button
        And clicks on the Create button
        And enters "CQA105.7" in the "Exhibition Number" field
        And clicks the "Save" button
        
        And clicks the "Delete Relation" button on the row that reads "CQA105.7"
        Then a delete confirmation dialog should appear
        And clicks cancel button
        Then the dialog should be dismissed
        Then the "Related Exhibition Records" area should contain "CQA105.7"

        And clicks the "Delete Relation" button on the row that reads "CQA105.7"
        Then a delete confirmation dialog should appear
        And clicks the "close" button
        Then the dialog should be dismissed
        Then the "Related Exhibition Records" area should contain "CQA105.7"


        And clicks the "Delete Relation" button on the row that reads "CQA105.7"
        Then a delete confirmation dialog should appear
        And clicks on the delete button 

        Then "CQA105.7" should not appear in the "Procedures" area
        Then "CQA105.7" should not appear in the "Related Exhibition Records" area

        And navigates to the record with identification number "CQA105.7"
        And selects the "Exhibition" tab 
        Then "CQA105_NE" should not appear in the "Related Exhibition Records" area   
        And selects the "Current Record" tab

        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then close the browser

	Scenario: Deleting relation via record editor #27 Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA105_NE"
        Then "CQA105_NE" should be in the "Identification Number" field

        And selects the "Exhibition" tab 
        And clicks the "Add record" button 
        And clicks on the Create button
        And enters "CQA105.8" in the "Exhibition Number" field
        And clicks the "Save" button
        And clicks on result with text "CQA105.8"
        
        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear  
        And clicks cancel button
        Then the dialog should be dismissed  
        Then the "Related Exhibition Records" area should contain "CQA105.8"

        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear  
        And clicks close button
        Then the dialog should be dismissed  
        Then the "Related Exhibition Records" area should contain "CQA105.8"

        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        # Then the record editor should no longer be displayed (below list)
        Then "CQA105.8" should not appear in the "Procedures" area   
        Then "CQA105.8" should not appear in the "Related Exhibition Records" area

        And navigates to the record with identification number "CQA105.8"
        And selects the "Exhibition" tab 
        Then the "Related Exhibition Records" area should be empty
        
        And selects the "Current Record" tab 
        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
        Then the deletion should be confirmed in a dialog
        Then close the browser 
