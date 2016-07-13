#Created by Forest Yang on 1/9/2016

@advancedsearchvocab @storage_location
Feature: Advanced Search - Storage Location

	#Test1
	Scenario: Advanced Search Fields
	#   Given user is on the "Create New" page
	    # And selects the "Storage Location" radio button on the Create New page
		# Click confirm button!!!
		Given user is on a blank "Storage Location" record
	    And enters "LanaDelRey" in the "Storage Location" "Display Name" field
	    And enters "SadGirl" in the "Storage Location" "Name" field
	    # And clicks on the "Storage Location" "Language" field
	#   Then a drop down list should appear in the "Language" row
	    # And selects "Italian" from dropdown in "Language" row
		And selects "Italian" from the "Storage Location" "Language" field
	    And enters "Rare Jazz Collection" in the "Storage Location" "Access Note" field
	    And enters "Your Heart" in the "Storage Location" "Address" field
	    And enters "Sedated" in the "Storage Location" "Condition Note" field
	    # And clicks on the "Storage Location" "Term Type" field
	#   Then a drop down list should appear in the "Term Type" row
	    # And selects "descriptor" from dropdown in "Term Type" row
		And selects "descriptor" from the "Storage Location" "Term Type" dropdown
	    # And clicks on the "Storage Location" "Term Status" field
	#   Then a drop down list should appear in the "Term Status" row
	    # And selects "Rejected" from dropdown in "Term Status" row
		And selects "Rejected" from the "Storage Location" "Term Status" dropdown
	    And enters "textbook" in the "Storage Location" "Security Note" field
	    And clicks the "Save" button
	  Then the record is successfully saved

	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And enters "LanaDelRey" in the "Storage Location" "Display Name" field
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Name
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And enters "SadGirl" in the "Storage Location" "Name" field
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Language
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    # And clicks on the "Advanced Search" "Language" field
	  #   Then a drop down list should appear in the "Language" row
	    And selects "Italian" from the "Storage Location" "Language" dropdown
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Access Note
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And enters "Rare Jazz Collection" in the "Storage Location" "Access Note" field
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Address
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And enters "Your Heart" in the "Storage Location" "Address" field
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Condition Note
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And enters "Sedated" in the "Storage Location" "Condition Note" field
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Term Type
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    # And clicks on the "Advanced Search" "Term Type" field
	  #   Then a drop down list should appear in the "Term Type" row
	    And selects "descriptor" from the "Storage Location" "Term Type" dropdown
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Term Status
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    # And clicks on the "Advanced Search" "Term Status" field
	 #   Then a drop down list should appear in the "Term Status" row
	    And selects "Rejected" from the "Storage Location" "Term Status" dropdown
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Security Note
      Given user is on the "My CollectionSpace" page
		And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
		And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And enters "textbook" in the "Storage Location" "Security Note" field
		And clicks the "Advanced Search search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	Scenario: Search by Modified Date
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And enters today's date in the "Storage Location" "Earliest Modified Date" field
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "Lana Del Rey"
	  Then close the browser

	Scenario: Search by username
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And enters "admin@core.collectionspace.org" in the "GeneralPages" "Record last modified by" field
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "Lana Del Rey"
	  Then close the browser

	Scenario: Search by partial Security Note
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And enters "textb*" in the "Storage Location" "Security Note" field
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "LanaDelRey"
	  Then close the browser

	#Test2
	Scenario: Boolean field based search
	#   Given user is on the "Create New" page
	    # And selects the "Storage Location" radio button on the Create New page
	    # And clicks on the Create button
	  Given user is on a blank "Storage Location" record
	  Then the titlebar should contain "Storage Location"
	    And enters "Top Shelf1" in the "Storage Location" "Display Name" field
	    # And clicks on the "Storage Location" "Term Status" field
	#   Then a drop down list should appear in the "Term Status" row
	    # And selects "Accepted" from dropdown in "Term Status" row
		And selects "Accepted" from the "Storage Location" "Term Status" dropdown
	    And enters "testtest" in the "Storage Location" "Security Note" field
	    And clicks the "Save" button
	  Then the record is successfully saved

	#   Given user is on the "Create New" page
	    # And selects the "Storage Location" radio button on the Create New page
	    # And clicks on the Create button
	  Given user is on a blank "Storage Location" record
	  Then the titlebar should contain "Storage Location"
	    And enters "Top Shelf2" in the "Storage Location" "Display Name" field
	    # And clicks on the "Storage Location" "Term Status" field
	#   Then a drop down list should appear in the "Term Status" row
	    # And selects "Accepted" from dropdown in "Term Status" row
		And selects "Accepted" from the "Storage Location" "Term Status" dropdown
	    And enters "testtest" in the "Storage Location" "Access Note" field
	    And clicks the "Save" button
	  Then the record is successfully saved

	#   Given user is on the "Create New" page
	    # And selects the "Storage Location" radio button on the Create New page
	    # And clicks on the Create button
	  Given user is on a blank "Storage Location" record
	  Then the titlebar should contain "Storage Location"
	    And enters "Top Shelf3" in the "Storage Location" "Display Name" field
	    # And clicks on the "Storage Location" "Term Status" field
	#   Then a drop down list should appear in the "Term Status" row
	    # And selects "Rejected" from dropdown in "Term Status" row
		And selects "Rejected" from the "Storage Location" "Term Status" dropdown
	    And enters "testtest" in the "Storage Location" "Condition Note" field
	    And clicks the "Save" button
	  Then the record is successfully saved

	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
	    And enters "Top Shelf3" in the "Storage Location" "Display Name" field
	    # And clicks on the "Advanced Search" "Term Status" field
	#   Then a drop down list should appear in the "Term Status" row
	    # And selects "Accepted" from dropdown in "Term Status" row
		And selects "Accepted" from the "Storage Location" "Term Status" dropdown
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "Top Shelf1"
	  Then the search results should contain "Top Shelf2"
	  Then the search results should contain "Top Shelf3"

	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
	    And enters "Top Shelf3" in the "Storage Location" "Display Name" field
	    # And clicks on the "Advanced Search" "Term Status" field
	#   Then a drop down list should appear in the "Term Status" row
	    # And selects "Accepted" from dropdown in "Term Status" row
		And selects "Accepted" from the "Storage Location" "Term Status" dropdown
	    And clicks the "Advanced Search search" button
	  Then the search results should not contain "Top Shelf3"
	  Then the search results should not contain "Top Shelf1"
	  Then the search results should not contain "Top Shelf2"
	  Then close the browser

	#Test3
	Scenario: Boolean and Keyword Search
	  Given user is on the "My CollectionSpace" page
	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
	    And enters "testtest" in the "AdvancedSearch" "search" field
	    And enters "Top Shelf3" in the "Storage Location" "Display Name" field
	    # And clicks on the "Advanced Search" "Term Status" field
	#   Then a drop down list should appear in the "Term Status" row
	    # And selects "Accepted" from dropdown in "Term Status" row
		And selects "Accepted" from the "Storage Location" "Term Status" dropdown
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "Top Shelf1"
	  Then the search results should contain "Top Shelf2"
	  Then the search results should contain "Top Shelf3"

	    And clicks the "Advanced Search" button
	  Then the titlebar should contain "Advanced Search"
	    And selects "Storage Location" from the "AdvancedSearch" "record type" dropdown
	    And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
	    And enters "testtest" in the "AdvancedSearch" "search" field
	    # And clicks on the "Advanced Search" "Term Status" field
	#   Then a drop down list should appear in the "Term Status" row
	    # And selects "Accepted" from dropdown in "Term Status" row
		And selects "Accepted" from the "Storage Location" "Term Status" dropdown
	    And clicks the "Advanced Search search" button
	  Then the search results should contain "Top Shelf1"
	  Then the search results should contain "Top Shelf2"
	  Then the search results should not contain "Top Shelf3"
	  Then close the browser

  Scenario: Record deletion
    Given user is on the "My CollectionSpace" page
      And navigates to the record with identification number "LanaDelRey"
      And clicks on the "Delete" button
    Then delete confirmation dialogue should appear
      And clicks the confirmation delete button
    Then "Work" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button

	  And navigates to the record with identification number "Top Shelf1"
	  And clicks on the "Delete" button
	Then delete confirmation dialogue should appear
	  And clicks the confirmation delete button
	Then "Work" deletion should be confirmed in a dialog
	  And clicks delete confirmation OK button

	  And navigates to the record with identification number "Top Shelf2"
	  And clicks on the "Delete" button
	Then delete confirmation dialogue should appear
	  And clicks the confirmation delete button
	Then "Work" deletion should be confirmed in a dialog
	  And clicks delete confirmation OK button

	  And navigates to the record with identification number "Top Shelf3"
	  And clicks on the "Delete" button
	Then delete confirmation dialogue should appear
	  And clicks the confirmation delete button
	Then "Work" deletion should be confirmed in a dialog
	  And clicks delete confirmation OK button
    Then close the browser
