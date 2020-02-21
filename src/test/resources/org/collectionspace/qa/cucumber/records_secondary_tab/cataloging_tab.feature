# Created by Cesar Villalobos on 12/30/2015

@recordssecondarytab
Feature: #Enter feature name here
  # Enter feature description here

	Scenario: Working cataloging tab #1 
        Given user is in the "My CollectionSpace" page
       
        And navigates to the record with identification number "CQA99_E"
        And selects the "Cataloging" tab     
        Then the "Related Cataloging Records" area should be empty
       
        And navigates to the record with identification number "CQA99_NE"
        And selects the "Cataloging" tab
        Then "CQA99.1" should appear in the "Related Cataloging Records" area
        Then close the browser

	Scenario: Dismissing the dialog #3 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA99_NE"

        #Variation A
        And clicks the "Add record" button
        And clicks the "close" button 
        Then the "Related Cataloging Records" area should only contain "CQA99.1"

        #Variation B
        And clicks the "Add record" button
        And presses the "ESC" key 
        Then the "Related Cataloging Records" area should only contain "CQA99.1"


	Scenario: Searching and adding multiple cataloging records #5 
        And clicks the "Add record" button 
        And clicks the "search" button 
        Then the search results should contain "CQA99.3" 
        Then the search results should contain "CQA99.2" 

        And selects the box with result "CQA99.3" 
        And selects the box with result "CQA99.2" 
        And clicks the "Add to current record" button  

        #Expected, Group #1
        Then the dialog should be dismissed 
        Then "CQA99.3" should appear in the "Related Cataloging Records" area
        Then "CQA99.2" should appear in the "Related Cataloging Records" area 
        Then "CQA99.3" should appear in the "Procedures" area 
        Then "CQA99.2" should appear in the "Procedures" area 

        And clicks on result with text "CQA99.3" 
        Then an "Edit Cataloging Record" form should be displayed 
        Then the "Identification Number" field should contain "CQA99.3"
        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then "CQA99.3" should not appear in the "Related Cataloging Records" area 

        And clicks on result with text "CQA99.2" 
        Then an "Edit Cataloging Record" form should be displayed 
        Then the "Identification Number" field should contain "CQA99.2"
        And clicks the "Delete this relation." button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then "CQA99.2" should not appear in the "Related Cataloging Records" area 
        Then close the browser

	Scenario: Warning when navigating away from new cataloging records  
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA99_NE"
        Then "CQA99_NE" should be in the "Identification Number" field
        And selects the "Cataloging" tab 
        
        And clicks the "Add record" button
        And clicks the "Create New" button
        
        Then the dialog should be dismissed
        Then the message "Creating new record..." should be displayed
        
        Then the "Identification Number" field should be empty
        And enters "CQA99.4" in the "Identification Number" field

        #Variation A
        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear 
        And clicks the "close" button  
        Then the "Identification Number" field should contain "CQA99.4"

        #Variation B
        And selects the "Current Record" tab
        Then a leave confirmation dialog should appear  
        And clicks the "cancel" button
        Then the "Identification Number" field should contain "CQA99.4"

        ## Variation D
        And selects the "Current Record" tab
        And clicks the "Don't save" button 
        And selects the "Cataloging" tab 
        Then "CQA99.4" should not appear in the "Related Cataloging Records" area

        #Variation C
        And clicks the "Add record" button
        And clicks on the Create button
        And enters "CQA99.4" in the "Identification Number" field 
        And selects the "Current Record" tab
        And clicks on the "Save" button

        And selects the "Cataloging" tab 
        Then "CQA99.4" should appear in the "Related Cataloging Records" area 

        And navigates to the record with identification number "CQA99.4"
        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then close the browser

	Scenario: Cancel changes button #9 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA99_NE"
        And selects the "Cataloging" tab
        And clicks the "Add record" button 
        And clicks the "Create new" button

        # Variation A
        Then the message "Creating new record..." should be displayed
        Then the "cancel changes" button at the "bottom" of the page "should not" be clickable
        Then the "cancel changes" button at the "top" of the page "should not" be clickable
        
        And enters "CQA99.5" in the "Identification Number" field
        And clicks the "cancel changes" button 
        Then the "Identification Number" field should be empty

        # Variation B
        And enters "CQA99.5" in the "Identification Number" field
        And clicks on the "Save" button 
        Then the "cancel changes" button at the "top" of the page "should not" be clickable 
        Then the "cancel changes" button at the "bottom" of the page "should not" be clickable 
   
        And clicks the "Go to record" button
        And clicks the "Delete" button 
        Then a delete confirmation dialog should appear
        And clicks the confirmation delete button
        Then the deletion should be confirmed in a dialog
        Then close the browser

	Scenario: Ensure all fields are properly saved #13 
        # Scenario: Test 11--> Successful save
        Given user is on the "My CollectionSpace" page 
        And navigates to the record with identification number "CQA99_NE" 
        And selects the "Cataloging" tab 

        And clicks the "+ Add Record" button
        And clicks on the Create button
        And clicks the "Save" button
        Then the message "Please specify an Identification Number" should appear
        And enters "CQA99.11" in the "Identification Number" field
        And clicks the "Save" button
        Then the message "Relation successfully created." should appear

        #Object ID Information
        And enters "99" in the "Number of Objects" field
        And enters "99.1" in the "Number" field        
        And selects "Lender" from the "Number Type" drop down        
        And selects "Antiquities" from the "Responsible Department" drop down
        And selects "Library collection" from the "Collection" drop down
        And selects "New" from the "Record Status" drop down
        And enters "CQA-99 Brief Description box" in the "Brief Description" field
        And enters "CQA-99 Distinguishing Features box" in the "Distinguishing Features" field
        And enters "CQA-99 Comments box" in the "Comments" field
        And enters "CQA-99 title field" in the "Title" field
        And selects "French" from the "Title Language" drop down
        And selects "Generic" from the "Title Type" drop down
        And selects "French" from the "Title Translation Language" drop down
        And enters "Fr" in the "Title Translation" field
        And enters "CQA99.11" in the "Object Name" field        
        And selects "Current" from the "Currency" drop down
        And selects "Group" from the "Level" drop down
        And selects "Nomenclature" from the "System" drop down
        And selects "Simple" from the "Type" drop down
        And selects "French" from the "Language" drop down
        And selects "CQA-99 Note box" from the "Note" drop down
        #Object Description Information Box
        And enters "99.1" in the "Copy Number" field
        And enters "99.2" in the "Edition Number" field                
        And selects "copy" from the "Object Status" drop down
        And enters "99" in the "Age" field
        And selects "older than" from the "Age Qualifier" drop down
        And selects "Years" from the "Unit" drop down
        And selects "male" from the "Sex" drop down
        And selects "adult" from the "Phase" drop down
        And selects "pinned" from the "Form" drop down
        And enters "French" in the "Style" field
        And enters "Blue" in the "Color" field
        And enters "Polyester" in the "Material" field
        And enters "Diamonds" in the "Material Component" field
        And enters "Blood Diamonds" in the "Material Component Note" field
        And enters "Polyester Doll" in the "Material Name" field
        And enters "Africa" in the "Material Source" field
        And enters "African Polyester doll with blood diamonds" in the "Physical Description" field
        And selects "handle" from the "Object Component Name" drop down
        And enters "Blue Handle" in the "Information" field
        And selects "record speed" from the "Technical Attribute" drop down
        And selects "metal" from the "Measurement" drop down
        And selects "rpm" from the "Unit" drop down
        And selects "base" from the "Part" drop down
        And selects "area" from the "Dimension" drop down
        And selects "Ruler" from the "Method" drop down
        And selects "carats" from the "Dimension Unit" drop down
        And enters "base of doll" in the "Summary" field
        And enters "99.3" in the "Value" field
        And enters "Cesar Villalobos" in the "Measured By" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "pounds" in the "Value Qualifier" field
        And enters "2016-01-01" in the "Date" field
        #Content Box
        And enters "African Polyester doll with blood diamonds" in the "Description" field
        And selects "French" from the "Language" drop down
        And enters "moving" in the "Activity" field        
        And enters "Testing" in the "Concept" field
        And selects "Testing" from autocomplete options
        And enters "2016-02-02" in the "Date" field
        And selects "back" from the "Position" drop down
        And selects "Furniture" from the "Object Type" drop down
        And enters "red chair" in the "Object" field
        And enters "Regina Xu, Jennifer Be" in the "People" field
        And enters "Cesar Villalobos" in the "Person" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Orange County" in the "Place" field
        And selects "Gothic script" from the "Script" drop down
        And enters "Water Tribe" in the "Organization" field
        And selects "Water Tribe" from autocomplete options
        And enters "CQA-99 Testing" in the "Event Name" field
        And enters "CQA-99 Test" in the "Event Name Type" field
        And enters "CQA-99 Other" in the "Other" field
        And enters "CQA-99 Other Type" in the "Other Type" field
        #Textual Inscription
        And enters "Il y a une baguette magique" in the "Inscription Content" field
        And enters "There's a magic wand" in the "Interpretation" field
        And enters "There is a magic wand" in the "Translation" field
        And enters "CQA-99 Transliteration box" in the "Transliteration" field
        And enters "X-Ray" in the "Method" field
        And enters "2016-03-03" in the "Date" field
        And enters "Cesar Villalobos" in the "Inscriber" field
        And selects "Cesar Villalobos" from autocomplete options
        And selects "back" from the "Position" drop down
        And selects "Gothic script" from the "Script" drop down
        And selects "decoration" from the "Type" drop down
        #Non-Textual Inscription
        And enters "CQA-99 Inscription Box" in the "Inscription Description" field
        And enters "CQA-99 Transliteration box" in the "Transliteration" field        
        And enters "X-Ray" in the "Method" field
        And enters "2016-03-03" in the "Date" field        
        And enters "Cesar Villalobos" in the "Inscriber" field
        And selects "Cesar Villalobos" from autocomplete options
        And selects "back" from the "Position" drop down                                          
        And selects "decoration" from the "Type" drop down                    
        #Obj Production Info
        And enters "2016-04-04" in the "Production Date" field
        And enters "Watering" in the "Technique Type" field
        And enters "Hydration" in the "Technique" field
        And enters "Mexico" in the "Production place" field
        And enters "Manufacture" in the "Role" field
        And enters "Aztecs" in the "Production people" field
        And enters "Manufacture" in the "Role" field
        And enters "Cesar Villalobos" in the "Production person" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Manufacture" in the "Role" field
        And enters "Aztecs United" in the "Production organization" field
        And selects "Aztecs United" from autocomplete options
        And enters "Manufacture" in the "Role" field
        And enters "CQA-99 Made by the Aztecs" in the "Production Note" field
        And enters "CQA-99 No Reason Found" in the "Production Reason" field
        #Obj History and Association Info
        And enters "waterbending" in the "Associated Activity" field
        And enters "water" in the "Associated Activity Type" field
        And enters "waterbent item" in the "Associated Activity Note" field
        And enters "water necklace" in the "Associated Object" field
        And enters "necklace" in the "Associated Object Type" field
        And enters "very expernsive" in the "Associated Object Note" field
        And enters "Testing" in the "Associated Concept" field
        And selects "Testing" from autocomplete options
        And enters "artisanship" in the "Associated Concept Type" field
        And enters "made with care" in the "Associated Concept Note" field
        And enters "water tribe" in the "Associated Cultural Affinity" field
        And enters "religious" in the "Associated Cultural Affinity Type" field
        And enters "religious item" in the "Associated Cultural Affinity Note" field
        And enters "Aztecs United" in the "Associated Organization" field
        And selects "Aztecs United" from autocomplete options
        And enters "tribe" in the "Associated Organization Type" field
        And enters "item from tribe" in the "Associated Organization Note" field
        And enters "airbenders" in the "Associated People" field
        And enters "air" in the "Associated People Type" field    
        And enters "gifted to the air nation" in the "Associated People Note" field
        And enters "Aang" in the "Associated Person" field
        And selects "Aang" from autocomplete options
        And enters "waterbender" in the "Associated Person Type" field
        And enters "from katara to aang" in the "Associated Person Note" field        
        And enters "nortwest temple" in the "Associated Place" field
        And enters "temple" in the "Associated Place Type" field
        And enters "to be kept here" in the "Associated Place Note" field
        And enters "aang funeral" in the "Associated Event Name" field
        And enters "funeral " in the "Associated Event Name type" field        
        And enters "Water Tribe" in the "Associated Event Organization" field                                    
        And selects "Water Tribe" from autocomplete options
        And enters "air nomads" in the "Associated Event People" field
        And enters "nortwestern air temple" in the "Associated Event Place" field
        And enters "Aang" in the "Associated Event Person" field
        And selects "Aang" from autocomplete options
        And enters "No note" in the "Associated Event Note" field
        And enters "2016-05-05" in the "Associated Date" field
        And enters "cinco de mayo" in the "Associated Date Type" field
        And enters "funeral on cinco de mayo" in the "Associated Date Note" field
        And enters "object gifted to aang on his funeral" in the "Object History Note" field
        And enters "decoration" in the "Usage" field
        And enters "to be used by the next avatar" in the "Usage Note" field
        And enters "Aang" in the "Owner" field
        And selects "Aang" from autocomplete options
        And enters "2016-07-06" in the "Ownership date" field
        And enters "worldwide" in the "Ownership place" field
        And selects "limited" from the "Ownership access" drop down                                          
        And selects "company" from the "Ownership category" drop down                                          
        And enters "CQA-99 No note" in the "Note" field
        And enters "99" in the "Price - value" field
        And selects "bequest" from the "Method" drop down                                          
        And selects "Euro" from the "Price - currency" drop down                                          
        #Associations
        #Object Owner's Contribution Information
        And enters "Never used it. He was dead." in the "Owner's Personal Experience" field
        And enters "Owner never saw it" in the "Owner's Personal Response" field
        And enters "Katara" in the "Owner's Reference" field
        And enters "My relic" in the "Owner's Contribution Note" field
        #Object Viewer's Contribution info
        And enters "Observation" in the "Viewer's Role" field
        And enters "Vivid, blue" in the "Viewer's Personal Experience" field
        And enters "amazed" in the "Viewer's Personal Response" field
        And enters "Katara" in the "Viewer's Reference" field        
        And enters "Made sure it was safe" in the "Viewer's Contribution Note" field
        #Reference Info
        And enters "Katara" in the "Reference" field
        And selects "Katara" from autocomplete options
        And enters "CQA-99 Reference note field" in the "Reference Note" field
        #Object Collection Info
        And enters "2016-07-07" in the "Field collection date" field
        And selects "borehole" from the "Field collection method" drop down
        And enters "It was actually stolen from air temple" in the "Field collection note" field
        And enters "CQA-99.11" in the "Field collection number" field
        And enters "North Temple" in the "Field collection place" field
        And selects "North Temple" from autocomplete options
        And enters "Cesar Villalobos" in the "Field collection collector" field
        And selects "Cesar Villalobos" from autocomplete options    
        And enters "Cesar Villalobos" in the "Field collection source" field
        And selects "Cesar Villalobos" from autocomplete options 
        And enters "Temple exploration" in the "Field collection event name" field
        #Object Hierarchy
        And clicks the "Save" button
        
        Then the "Number of Objects" field should contain "99"
        Then the "Number" field should contain "99.1"
        Then the "Number Type" field should contain "Lender"
        Then the "Responsible Department" field should contain "Antiquities"
        Then the "Collection" field should contain "Library collection"
        Then the "Record Status" field should contain "New"
        Then the "Brief Description" field should contain "CQA-99 Brief Description box"
        Then the "Distinguishing Features" field should contain "CQA-99 Distinguishing Features box"
        Then the "Comments" field should contain "CQA-99 Comments box"
        Then the "Title" field should contain "CQA-99 title field"
        Then the "Title Language" field should contain "French"
        Then the "Title Type" field should contain "Generic"
        Then the "Title Translation Language" field should contain "French"
        Then the "Title Translation" field should contain "Fr"
        Then the "Object Name" field should contain "CQA99.11"
        Then the "Currency" field should contain "Current"
        Then the "Level" field should contain "Group"
        Then the "System" field should contain "Nomenclature"
        Then the "Type" field should contain "Simple"
        Then the "Language" field should contain "French"
        Then the "Note" field should contain "CQA-99 Note box"
        Then the "Copy Number" field should contain "99.1"
        Then the "Edition Number" field should contain "99.2"
        Then the "Object Status" field should contain "copy"
        Then the "Age" field should contain "99"
        Then the "Age Qualifier" field should contain "older than"
        Then the "Unit" field should contain "Years"
        Then the "Sex" field should contain "male"
        Then the "Phase" field should contain "adult"
        Then the "Form" field should contain "pinned"
        Then the "Style" field should contain "French"
        Then the "Color" field should contain "Blue"
        Then the "Material" field should contain "Polyester"
        Then the "Material Component" field should contain "Diamonds"
        Then the "Material Component Note" field should contain "Blood Diamonds"
        Then the "Material Name" field should contain "Polyester Doll"
        Then the "Material Source" field should contain "Africa"
        Then the "Physical Description" field should contain "African Polyester doll with blood diamonds"
        Then the "Object Component Name" field should contain "handle"
        Then the "Information" field should contain "Blue Handle"
        Then the "Technical Attribute" field should contain "record speed"
        Then the "Measurement" field should contain "metal"
        Then the "Unit" field should contain "rpm"
        Then the "Part" field should contain "base"
        Then the "Dimension" field should contain "area"
        Then the "Method" field should contain "Ruler"
        Then the "Dimension Unit" field should contain "carats"
        Then the "Summary" field should contain "base of doll"
        Then the "Value" field should contain "99.3"
        Then the "Measured By" field should contain "Cesar Villalobos"
        Then the "Value Qualifier" field should contain "pounds"
        Then the "Date" field should contain "2016-01-01"
        Then the "Description" field should contain "African Polyester doll with blood diamonds"
        Then the "Language" field should contain "French"
        Then the "Activity" field should contain "moving"
        Then the "Concept" field should contain "Testing"
        Then the "Date" field should contain "2016-02-02"
        Then the "Position" field should contain "back"
        Then the "Object Type" field should contain "Furniture"
        Then the "Object" field should contain "red chair"
        Then the "Jennifer Be" field should contain "Regina Xu"
        Then the "Person" field should contain "Cesar Villalobos"
        Then the "Place" field should contain "Orange County"
        Then the "Script" field should contain "Gothic script"
        Then the "Organization" field should contain "Water Tribe"
        Then the "Event Name" field should contain "CQA-99 Testing"
        Then the "Event Name Type" field should contain "CQA-99 Test"
        Then the "Other" field should contain "CQA-99 Other"
        Then the "Other Type" field should contain "CQA-99 Other Type"
        Then the "Inscription Content" field should contain "Il y a une baguette magique"
        Then the "Interpretation" field should contain "There's a magic wand"
        Then the "Translation" field should contain "There is a magic wand"
        Then the "Transliteration" field should contain "CQA-99 Transliteration box"
        Then the "Method" field should contain "X-Ray"
        Then the "Date" field should contain "2016-03-03"
        Then the "Inscriber" field should contain "Cesar Villalobos"
        Then the "Position" field should contain "back"
        Then the "Script" field should contain "Gothic script"
        Then the "Type" field should contain "decoration"
        Then the "Inscription Description" field should contain "CQA-99 Inscription Box"
        Then the "Transliteration" field should contain "CQA-99 Transliteration box"
        Then the "Method" field should contain "X-Ray"
        Then the "Date" field should contain "2016-03-03"
        Then the "Inscriber" field should contain "Cesar Villalobos"
        Then the "Position" field should contain "back"
        Then the "Type" field should contain "decoration"
        Then the "Production Date" field should contain "2016-04-04"
        Then the "Technique Type" field should contain "Watering"
        Then the "Technique" field should contain "Hydration"
        Then the "Production place" field should contain "Mexico"
        Then the "Role" field should contain "Manufacture"
        Then the "Production people" field should contain "Aztecs"
        Then the "Role" field should contain "Manufacture"
        Then the "Production person" field should contain "Cesar Villalobos"
        Then the "Role" field should contain "Manufacture"
        Then the "Production organization" field should contain "Aztecs United"
        Then the "Role" field should contain "Manufacture"
        Then the "Production Note" field should contain "CQA-99 Made by the Aztecs"
        Then the "Production Reason" field should contain "CQA-99 No Reason Found"
        Then the "Associated Activity" field should contain "waterbending"
        Then the "Associated Activity Type" field should contain "water"
        Then the "Associated Activity Note" field should contain "waterbent item"
        Then the "Associated Object" field should contain "water necklace"
        Then the "Associated Object Type" field should contain "necklace"
        Then the "Associated Object Note" field should contain "very expernsive"
        Then the "Associated Concept" field should contain "Testing"
        Then the "Associated Concept Type" field should contain "artisanship"
        Then the "Associated Concept Note" field should contain "made with care"
        Then the "Associated Cultural Affinity" field should contain "water tribe"
        Then the "Associated Cultural Affinity Type" field should contain "religious"
        Then the "Associated Cultural Affinity Note" field should contain "religious item"
        Then the "Associated Organization" field should contain "Aztecs United"
        Then the "Associated Organization Type" field should contain "tribe"
        Then the "Associated Organization Note" field should contain "item from tribe"
        Then the "Associated People" field should contain "airbenders"
        Then the "Associated People Type" field should contain "air"
        Then the "Associated People Note" field should contain "gifted to the air nation"
        Then the "Associated Person" field should contain "Aang"
        Then the "Associated Person Type" field should contain "waterbender"
        Then the "Associated Person Note" field should contain "from katara to aang"
        Then the "Associated Place" field should contain "nortwest temple"
        Then the "Associated Place Type" field should contain "temple"
        Then the "Associated Place Note" field should contain "to be kept here"
        Then the "Associated Event Name" field should contain "aang funeral"
        Then the "Associated Event Name type" field should contain "funeral "
        Then the "Associated Event Organization" field should contain "Water Tribe"
        Then the "Associated Event People" field should contain "air nomads"
        Then the "Associated Event Place" field should contain "nortwestern air temple"
        Then the "Associated Event Person" field should contain "Aang"
        Then the "Associated Event Note" field should contain "No note"
        Then the "Associated Date" field should contain "2016-05-05"
        Then the "Associated Date Type" field should contain "cinco de mayo"
        Then the "Associated Date Note" field should contain "funeral on cinco de mayo"
        Then the "Object History Note" field should contain "object gifted to aang on his funeral"
        Then the "Usage" field should contain "decoration"
        Then the "Usage Note" field should contain "to be used by the next avatar"
        Then the "Owner" field should contain "Aang"
        Then the "Ownership date" field should contain "2016-07-06"
        Then the "Ownership place" field should contain "worldwide"
        Then the "Ownership access" field should contain "limited"
        Then the "Ownership category" field should contain "company"
        Then the "Note" field should contain "CQA-99 No note"
        Then the "Price - value" field should contain "99"
        Then the "Method" field should contain "bequest"
        Then the "Price - currency" field should contain "Euro"
        Then the "Owner's Personal Experience" field should contain "Never used it. He was dead."
        Then the "Owner's Personal Response" field should contain "Owner never saw it"
        Then the "Owner's Reference" field should contain "Katara"
        Then the "Owner's Contribution Note" field should contain "My relic"
        Then the "Viewer's Role" field should contain "Observation"
        Then the "blue" field should contain "Vivid"
        Then the "Viewer's Personal Response" field should contain "amazed"
        Then the "Viewer's Reference" field should contain "Katara"
        Then the "Viewer's Contribution Note" field should contain "Made sure it was safe"
        Then the "Reference" field should contain "Katara"
        Then the "Reference Note" field should contain "CQA-99 Reference note field"
        Then the "Field collection date" field should contain "2016-07-07"
        Then the "Field collection method" field should contain "borehole"
        Then the "Field collection note" field should contain "It was actually stolen from air temple"
        Then the "Field collection number" field should contain "CQA-99.11"
        Then the "Field collection place" field should contain "North Temple"
        Then the "Field collection collector" field should contain "Cesar Villalobos"
        Then the "Field collection source" field should contain "Cesar Villalobos"
        Then the "Field collection event name" field should contain "Temple exploration"   

    ### 13

        #Object ID Information
        And enters "99.13" in the "Number of Objects" field
        And enters "99.13.1" in the "Number" field        
        And selects "Obsolte" from the "Number Type" drop down        
        And selects "Paleobotany" from the "Responsible Department" drop down
        And selects "Permanent collection" from the "Collection" drop down
        And selects "In process" from the "Record Status" drop down
        And enters "CQA-99.13 Brief Description box" in the "Brief Description" field
        And enters "CQA-99.13 Distinguishing Features box" in the "Distinguishing Features" field
        And enters "CQA-99.13 Comments box" in the "Comments" field
        And enters "CQA-99.13 title field" in the "Title" field
        And selects "German" from the "Title Language" drop down
        And selects "Generic" from the "Title Type" drop down
        And selects "German" from the "Title Translation Language" drop down
        And enters "Ger" in the "Title Translation" field
        And enters "CQA99.13.11" in the "Object Name" field        
        And selects "Current" from the "Currency" drop down
        And selects "Group" from the "Level" drop down
        And selects "Nomenclature" from the "System" drop down
        And selects "Simple" from the "Type" drop down
        And selects "German" from the "Language" drop down
        And selects "CQA-99.13 Note box" from the "Note" drop down
        #Object Description Information Box
        And enters "99.13.1" in the "Copy Number" field
        And enters "99.13.2" in the "Edition Number" field                
        And selects "forgery" from the "Object Status" drop down
        And enters "99.13" in the "Age" field
        And selects "older than" from the "Age Qualifier" drop down
        And selects "Years" from the "Unit" drop down
        And selects "female" from the "Sex" drop down
        And selects "larva" from the "Phase" drop down
        And selects "dry" from the "Form" drop down
        And enters "German" in the "Style" field
        And enters "Purple" in the "Color" field
        And enters "Fabric" in the "Material" field
        And enters "Diamonds" in the "Material Component" field
        And enters "Blood Diamonds" in the "Material Component Note" field
        And enters "Fabric Doll" in the "Material Name" field
        And enters "Africa" in the "Material Source" field
        And enters "African Fabric doll with blood diamonds" in the "Physical Description" field
        And selects "handle" from the "Object Component Name" drop down
        And enters "Purple Handle" in the "Information" field
        And selects "record speed" from the "Technical Attribute" drop down
        And selects "78" from the "Measurement" drop down
        And selects "rpm" from the "Unit" drop down
        And selects "base" from the "Part" drop down
        And selects "area" from the "Dimension" drop down
        And selects "Ruler" from the "Method" drop down
        And selects "carats" from the "Dimension Unit" drop down
        And enters "base of doll" in the "Summary" field
        And enters "99.13.3" in the "Value" field
        And enters "Cesar Villalobos" in the "Measured By" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "pounds" in the "Value Qualifier" field
        And enters "2017-01-01" in the "Date" field
        #Content Box
        And enters "African Fabric doll with blood diamonds" in the "Description" field
        And selects "German" from the "Language" drop down
        And enters "moving" in the "Activity" field        
        And enters "Testing" in the "Concept" field
        And selects "Testing" from autocomplete options
        And enters "2017-02-02" in the "Date" field
        And selects "back" from the "Position" drop down
        And selects "Furniture" from the "Object Type" drop down
        And enters "red chair" in the "Object" field
        And enters "Regina Xu, Jennifer Be" in the "People" field
        And enters "Cesar Villalobos" in the "Person" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Orange County" in the "Place" field
        And selects "Gothic script" from the "Script" drop down
        And enters "Water Tribe" in the "Organization" field
        And selects "Water Tribe" from autocomplete options 
        And enters "CQA-99.13 Testing" in the "Event Name" field
        And enters "CQA-99.13 Test" in the "Event Name Type" field
        And enters "CQA-99.13 Other" in the "Other" field
        And enters "CQA-99.13 Other Type" in the "Other Type" field
        #Textual Inscription
        And enters "Il y a une baguette magique" in the "Inscription Content" field
        And enters "There's a magic wand" in the "Interpretation" field
        And enters "There is a magic wand" in the "Translation" field
        And enters "CQA-99.13 Transliteration box" in the "Transliteration" field        
        And enters "X-Ray" in the "Method" field
        And enters "2017-03-03" in the "Date" field        
        And enters "Cesar Villalobos" in the "Inscriber" field
        And selects "Cesar Villalobos" from autocomplete options
        And selects "back" from the "Position" drop down                        
        And selects "Gothic script" from the "Script" drop down                        
        And selects "decoration" from the "Type" drop down                        
        #Non-Textual Inscription
        And enters "CQA-99.13 Inscription Box" in the "Inscription Description" field
        And enters "CQA-99.13 Transliteration box" in the "Transliteration" field        
        And enters "X-Ray" in the "Method" field
        And enters "2017-03-03" in the "Date" field        
        And enters "Cesar Villalobos" in the "Inscriber" field
        And selects "Cesar Villalobos" from autocomplete options
        And selects "back" from the "Position" drop down                                          
        And selects "decoration" from the "Type" drop down                    
        #Obj Production Info
        And enters "2017-04-04" in the "Production Date" field
        And enters "Watering" in the "Technique Type" field
        And enters "Hydration" in the "Technique" field
        And enters "Mexico" in the "Production place" field
        And enters "Production" in the "Role" field
        And enters "Aztecs" in the "Production people" field
        And enters "Production" in the "Role" field
        And enters "Cesar Villalobos" in the "Production person" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Production" in the "Role" field
        And enters "Water Tribe" in the "Production organization" field
        And selects "Water Tribe" from autocomplete options
        And enters "Production" in the "Role" field
        And enters "CQA-99.13 Made by the Aztecs" in the "Production Note" field
        And enters "CQA-99.13 No Reason Found" in the "Production Reason" field
        #Obj History and Association Info
        And enters "waterbending" in the "Associated Activity" field
        And enters "water" in the "Associated Activity Type" field
        And enters "waterbent item" in the "Associated Activity Note" field
        And enters "water necklace" in the "Associated Object" field
        And enters "necklace" in the "Associated Object Type" field
        And enters "very expernsive" in the "Associated Object Note" field
        And enters "Testing" in the "Associated Concept" field
        And selects "Testing" from autocomplete options
        And enters "artisanship" in the "Associated Concept Type" field
        And enters "made with care" in the "Associated Concept Note" field
        And enters "water tribe" in the "Associated Cultural Affinity" field
        And enters "religious" in the "Associated Cultural Affinity Type" field
        And enters "religious item" in the "Associated Cultural Affinity Note" field
        And enters "Water Tribe" in the "Associated Organization" field
        And selects "Water Tribe" from autocomplete options
        And enters "tribe" in the "Associated Organization Type" field
        And enters "item from tribe" in the "Associated Organization Note" field
        And enters "airbenders" in the "Associated People" field
        And enters "air" in the "Associated People Type" field    
        And enters "gifted to the air nation" in the "Associated People Note" field
        And enters "Aang" in the "Associated Person" field
        And selects "Aang" from autocomplete options
        And enters "waterbender" in the "Associated Person Type" field
        And enters "from Aang to aang" in the "Associated Person Note" field        
        And enters "nortwest temple 13" in the "Associated Place" field
        And enters "temple" in the "Associated Place Type" field
        And enters "to be kept here" in the "Associated Place Note" field
        And enters "aang funeral" in the "Associated Event Name" field
        And enters "funeral " in the "Associated Event Name type" field        
        And enters "Water Tribe" in the "Associated Event Organization" field                                    
        And selects "Water Tribe" from autocomplete options
        And enters "air nomads" in the "Associated Event People" field
        And enters "nortwestern air temple" in the "Associated Event Place" field
        And enters "Aang" in the "Associated Event Person" field
        And selects "Aang" from autocomplete options
        And enters "No note" in the "Associated Event Note" field
        And enters "2017-05-05" in the "Associated Date" field
        And enters "cinco de mayo" in the "Associated Date Type" field
        And enters "funeral on cinco de mayo" in the "Associated Date Note" field
        And enters "object gifted to aang on his funeral" in the "Object History Note" field
        And enters "decoration" in the "Usage" field
        And enters "to be used by the next avatar" in the "Usage Note" field
        And enters "Aang" in the "Owner" field
        And selects "Aang" from autocomplete options
        And enters "2017-07-06" in the "Ownership date" field
        And enters "worldwide" in the "Ownership place" field
        And selects "limited" from the "Ownership access" drop down                                          
        And selects "company" from the "Ownership category" drop down                                          
        And enters "CQA-99.13 No note" in the "Note" field
        And enters "99.13" in the "Price - value" field
        And selects "bequest" from the "Method" drop down                                          
        And selects "Euro" from the "Price - currency" drop down                                          
        #Associations
        #Object Owner's Contribution Information
        And enters "Never used it. He was dead." in the "Owner's Personal Experience" field
        And enters "Owner never saw it" in the "Owner's Personal Response" field
        And enters "Aang" in the "Owner's Reference" field
        And enters "My relic" in the "Owner's Contribution Note" field
        #Object Viewer's Contribution info
        And enters "Observation" in the "Viewer's Role" field
        And enters "Vivid, Purple" in the "Viewer's Personal Experience" field
        And enters "amazed" in the "Viewer's Personal Response" field
        And enters "Aang" in the "Viewer's Reference" field        
        And enters "Made sure it was safe" in the "Viewer's Contribution Note" field
        #Reference Info
        And enters "Aang" in the "Reference" field
        And selects "Aang" from autocomplete options
        And enters "CQA-99.13 Reference note field" in the "Reference Note" field
        #Object Collection Info
        And enters "2017-07-07" in the "Field collection date" field
        And selects "borehole" from the "Field collection method" drop down
        And enters "It was actually stolen from air temple" in the "Field collection note" field
        And enters "CQA-99.13.11" in the "Field collection number" field
        And enters "North Temple" in the "Field collection place" field
        And selects "North Temple" from autocomplete options
        And enters "Cesar Villalobos" in the "Field collection collector" field
        And selects "Cesar Villalobos" from autocomplete options    
        And enters "Cesar Villalobos" in the "Field collection source" field
        And selects "Cesar Villalobos" from autocomplete options 
        And enters "Temple exploration" in the "Field collection event name" field
        #Object Hierarchy
        And clicks the "Save" button
        
        Then the "Number of Objects" field should contain "99.13"
        Then the "Number" field should contain "99.13.1"
        Then the "Number Type" field should contain "Obsolte"
        Then the "Responsible Department" field should contain "Paleobotany"
        Then the "Collection" field should contain "Permanent collection"
        Then the "Record Status" field should contain "In process"
        Then the "Brief Description" field should contain "CQA-99.13 Brief Description box"
        Then the "Distinguishing Features" field should contain "CQA-99.13 Distinguishing Features box"
        Then the "Comments" field should contain "CQA-99.13 Comments box"
        Then the "Title" field should contain "CQA-99.13 title field"
        Then the "Title Language" field should contain "German"
        Then the "Title Type" field should contain "Generic"
        Then the "Title Translation Language" field should contain "German"
        Then the "Title Translation" field should contain "Ger"
        Then the "Object Name" field should contain "CQA99.13.11"
        Then the "Currency" field should contain "Current"
        Then the "Level" field should contain "Group"
        Then the "System" field should contain "Nomenclature"
        Then the "Type" field should contain "Simple"
        Then the "Language" field should contain "German"
        Then the "Note" field should contain "CQA-99.13 Note box"
        Then the "Copy Number" field should contain "99.13.1"
        Then the "Edition Number" field should contain "99.13.2"
        Then the "Object Status" field should contain "forgery"
        Then the "Age" field should contain "99.13"
        Then the "Age Qualifier" field should contain "older than"
        Then the "Unit" field should contain "Years"
        Then the "Sex" field should contain "female"
        Then the "Phase" field should contain "larva"
        Then the "Form" field should contain "dry"
        Then the "Style" field should contain "German"
        Then the "Color" field should contain "Purple"
        Then the "Material" field should contain "Fabric"
        Then the "Material Component" field should contain "Diamonds"
        Then the "Material Component Note" field should contain "Blood Diamonds"
        Then the "Material Name" field should contain "Fabric Doll"
        Then the "Material Source" field should contain "Africa"
        Then the "Physical Description" field should contain "African Fabric doll with blood diamonds"
        Then the "Object Component Name" field should contain "handle"
        Then the "Information" field should contain "Purple Handle"
        Then the "Technical Attribute" field should contain "record speed"
        Then the "Measurement" field should contain "78"
        Then the "Unit" field should contain "rpm"
        Then the "Part" field should contain "base"
        Then the "Dimension" field should contain "area"
        Then the "Method" field should contain "Ruler"
        Then the "Dimension Unit" field should contain "carats"
        Then the "Summary" field should contain "base of doll"
        Then the "Value" field should contain "99.13.3"
        Then the "Measured By" field should contain "Cesar Villalobos"
        Then the "Value Qualifier" field should contain "pounds"
        Then the "Date" field should contain "2017-01-01"
        Then the "Description" field should contain "African Fabric doll with blood diamonds"
        Then the "Language" field should contain "German"
        Then the "Activity" field should contain "moving"
        Then the "Concept" field should contain "Testing"
        Then the "Date" field should contain "2017-02-02"
        Then the "Position" field should contain "back"
        Then the "Object Type" field should contain "Furniture"
        Then the "Object" field should contain "red chair"
        Then the "People" field should contain "Regina Xu, Jennifer Be"
        Then the "Person" field should contain "Cesar Villalobos"
        Then the "Place" field should contain "Orange County"
        Then the "Script" field should contain "Gothic script"
        Then the "Organization" field should contain "Water Tribe"
        Then the "Event Name" field should contain "CQA-99.13 Testing"
        Then the "Event Name Type" field should contain "CQA-99.13 Test"
        Then the "Other" field should contain "CQA-99.13 Other"
        Then the "Other Type" field should contain "CQA-99.13 Other Type"
        Then the "Inscription Content" field should contain "Il y a une baguette magique"
        Then the "Interpretation" field should contain "There's a magic wand"
        Then the "Translation" field should contain "There is a magic wand"
        Then the "Transliteration" field should contain "CQA-99.13 Transliteration box"
        Then the "Method" field should contain "X-Ray"
        Then the "Date" field should contain "2017-03-03"
        Then the "Inscriber" field should contain "Cesar Villalobos"
        Then the "Position" field should contain "back"
        Then the "Script" field should contain "Gothic script"
        Then the "Type" field should contain "decoration"
        Then the "Inscription Description" field should contain "CQA-99.13 Inscription Box"
        Then the "Transliteration" field should contain "CQA-99.13 Transliteration box"
        Then the "Method" field should contain "X-Ray"
        Then the "Date" field should contain "2017-03-03"
        Then the "Inscriber" field should contain "Cesar Villalobos"
        Then the "Position" field should contain "back"
        Then the "Type" field should contain "decoration"
        Then the "Production Date" field should contain "2017-04-04"
        Then the "Technique Type" field should contain "Watering"
        Then the "Technique" field should contain "Hydration"
        Then the "Production place" field should contain "Mexico"
        Then the "Role" field should contain "Production"
        Then the "Production people" field should contain "Aztecs"
        Then the "Role" field should contain "Production"
        Then the "Production person" field should contain "Cesar Villalobos"
        Then the "Role" field should contain "Production"
        Then the "Production organization" field should contain "Water Tribe"
        Then the "Role" field should contain "Production"
        Then the "Production Note" field should contain "CQA-99.13 Made by the Aztecs"
        Then the "Production Reason" field should contain "CQA-99.13 No Reason Found"
        Then the "Associated Activity" field should contain "waterbending"
        Then the "Associated Activity Type" field should contain "water"
        Then the "Associated Activity Note" field should contain "waterbent item"
        Then the "Associated Object" field should contain "water necklace"
        Then the "Associated Object Type" field should contain "necklace"
        Then the "Associated Object Note" field should contain "very expernsive"
        Then the "Associated Concept" field should contain "Testing"
        Then the "Associated Concept Type" field should contain "artisanship"
        Then the "Associated Concept Note" field should contain "made with care"
        Then the "Associated Cultural Affinity" field should contain "water tribe"
        Then the "Associated Cultural Affinity Type" field should contain "religious"
        Then the "Associated Cultural Affinity Note" field should contain "religious item"
        Then the "Associated Organization" field should contain "Water Tribe"
        Then the "Associated Organization Type" field should contain "tribe"
        Then the "Associated Organization Note" field should contain "item from tribe"
        Then the "Associated People" field should contain "airbenders"
        Then the "Associated People Type" field should contain "air"
        Then the "Associated People Note" field should contain "gifted to the air nation"
        Then the "Associated Person" field should contain "Aang"
        Then the "Associated Person Type" field should contain "waterbender"
        Then the "Associated Person Note" field should contain "from Aang to aang"
        Then the "Associated Place" field should contain "nortwest temple 13"
        Then the "Associated Place Type" field should contain "temple"
        Then the "Associated Place Note" field should contain "to be kept here"
        Then the "Associated Event Name" field should contain "aang funeral"
        Then the "Associated Event Name type" field should contain "funeral "
        Then the "Associated Event Organization" field should contain "Water Tribe"
        Then the "Associated Event People" field should contain "air nomads"
        Then the "Associated Event Place" field should contain "nortwestern air temple"
        Then the "Associated Event Person" field should contain "Aang"
        Then the "Associated Event Note" field should contain "No note"
        Then the "Associated Date" field should contain "2017-05-05"
        Then the "Associated Date Type" field should contain "cinco de mayo"
        Then the "Associated Date Note" field should contain "funeral on cinco de mayo"
        Then the "Object History Note" field should contain "object gifted to aang on his funeral"
        Then the "Usage" field should contain "decoration"
        Then the "Usage Note" field should contain "to be used by the next avatar"
        Then the "Owner" field should contain "Aang"
        Then the "Ownership date" field should contain "2017-07-06"
        Then the "Ownership place" field should contain "worldwide"
        Then the "Ownership access" field should contain "limited"
        Then the "Ownership category" field should contain "company"
        Then the "Note" field should contain "CQA-99.13 No note"
        Then the "Price - value" field should contain "99.13"
        Then the "Method" field should contain "bequest"
        Then the "Price - currency" field should contain "Euro"
        Then the "Owner's Personal Experience" field should contain "Never used it. He was dead."
        Then the "Owner's Personal Response" field should contain "Owner never saw it"
        Then the "Owner's Reference" field should contain "Aang"
        Then the "Owner's Contribution Note" field should contain "My relic"
        Then the "Viewer's Role" field should contain "Observation"
        Then the "Viewer's Personal Experience" field should contain "Vivid, Purple"
        Then the "Viewer's Personal Response" field should contain "amazed"
        Then the "Viewer's Reference" field should contain "Aang"
        Then the "Viewer's Contribution Note" field should contain "Made sure it was safe"
        Then the "Reference" field should contain "Aang"
        Then the "Reference Note" field should contain "CQA-99.13 Reference note field"
        Then the "Field collection date" field should contain "2017-07-07"
        Then the "Field collection method" field should contain "borehole"
        Then the "Field collection note" field should contain "It was actually stolen from air temple"
        Then the "Field collection number" field should contain "CQA-99.13.11"
        Then the "Field collection place" field should contain "North Temple"
        Then the "Field collection collector" field should contain "Cesar Villalobos"
        Then the "Field collection source" field should contain "Cesar Villalobos"
        Then the "Field collection event name" field should contain "Temple exploration"   

        And clicks the "Go To Record" button       
        And clicks the "Delete" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog   
        Then close the browser


	Scenario: Testing links and "Go To Record" works #23 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA99_NE"
        And selects the "Cataloging" tab
        And clicks on result with text "CQA99.1"
        Then the "Identification Number" field should contain "CQA99.1"
        And clicks the "Go to record" button
        Then the titlebar should contain "CQA99.1"
        Then the "Identification Number" field should contain "CQA99.1"
        Then close the browser

	Scenario: Deleting relation via list #25 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA99_NE"
        And selects the "Cataloging" tab 

        And clicks the "Add record" button
        And clicks on the Create button
        And enters "CQA99.7" in the "Identification Number" field
        And clicks the "Save" button
        
        And clicks the "Delete Relation" button on the row that reads "CQA99.7"
        Then a delete confirmation dialog should appear 
        And clicks cancel button
        Then the dialog should be dismissed
        Then the "Related Cataloging Records" area should contain "CQA99.7"

        And clicks the "Delete Relation" button on the row that reads "CQA99.7"
        Then a delete confirmation dialog should appear
        And clicks the "close" button
        Then the dialog should be dismissed
        Then the "Related Cataloging Records" area should contain "CQA99.7"

        And clicks the "Delete Relation" button on the row that reads "CQA99.7"
        Then a delete confirmation dialog should appear
        And clicks on the delete button 

        Then "CQA99.7" should not appear in the "Procedures" area
        Then "CQA99.7" should not appear in the "Related Cataloging Records" area

        And navigates to the record with identification number "CQA99.7"
        And selects the "Cataloging" tab 
        Then "CQA99_NE" should not appear in the "Related Cataloging Records" area   
        And selects the "Current Record" tab

        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then close the browser

	Scenario: Deleting relation via record editor #27 
        Given user is in the "My CollectionSpace" page
        And navigates to the record with identification number "CQA99_NE"
        Then "CQA99_NE" should be in the "Identification Number" field

        And selects the "Cataloging" tab 
        And clicks the "Add record" button
        And clicks on the Create button
        And enters "CQA99.8" in the "Identification Number" field
        And clicks the "Save" button
        And clicks on result with text "CQA99.8"
        
        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear
        And clicks cancel button
        Then the dialog should be dismissed
        Then the "Related Cataloging Records" area should contain "CQA99.8"

        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear  
        And clicks close button
        Then the dialog should be dismissed  
        Then the "Related Cataloging Records" area should contain "CQA99.8"

        And clicks the "Delete this relation" button
        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        # Then the record editor should no longer be displayed (below list)
        Then "CQA99.8" should not appear in the "Procedures" area   
        Then "CQA99.8" should not appear in the "Related Cataloging Records" area

        And navigates to the record with identification number "CQA99.8"
        And selects the "Cataloging" tab 
        Then the "Related Cataloging Records" area should be empty
        
        And selects the "Current Record" tab 
        And clicks on the delete button 

        Then a delete confirmation dialog should appear
        And clicks on the delete button 
 
        Then the deletion should be confirmed in a dialog
        Then close the browser 


	    
