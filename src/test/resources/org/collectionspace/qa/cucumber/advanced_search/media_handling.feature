#Created by Forest Yang on 12/30/2015
# Working as of June 14 2016

@advancedsearch @media_handling
Feature: Advanced Search - Media Handling

#Decided to disinclude uploading an image, because an automated way of doing so seems.... dodgy

  #Test1
  Scenario: Advanced Search Fields
    #   And selects the "Media Handling" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Media Handling" record
      And enters "hailstorm" in the "Media Handling" "Title" field
      And enters "CQA82685934" in the "Media Handling" "Identification Number" field
      And selects "Dataset" from the "Media Handling" "Types" dropdown
      And enters "Lord Jesus" in the "Media Handling" "Creator" autocomplete field
      And selects "Hebrew" from the "Media Handling" "Languages" dropdown

      And enters "0-0-0" in the "Media Handling" "Dates" field
      And enters "0" in the "Media Handling" "Earliest/Single Dates Year" field
      And enters "0" in the "Media Handling" "Earliest/Single Dates Month" field
      And enters "0" in the "Media Handling" "Earliest/Single Dates Day" field

      And enters "Lord Lucifer" in the "Media Handling" "Publisher" autocomplete field
      And enters "Pearly Gates" in the "Media Handling" "Source" field
      And enters "Yahweh" in the "Media Handling" "Rights holder" autocomplete field
      # And uploads an image
      And enters "textbook" in the "Media Handling" "Subjects" field
      And clicks the "Save" button

      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters "CQA82685934" in the "Media Handling" "Identification Number" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by Title
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters "hailstorm" in the "Media Handling" "Title" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by Types
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And selects "Dataset" from the "Media Handling" "Types" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by Creator
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters "Lord Jesus" in the "Advanced Search" "Creator Search" autocomplete field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by Languages
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And selects "Hebrew" from the "Media Handling" "Languages" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters "0-0-0" in the "Media Handling" "Earliest Dates" field
      And enters "0-0-0" in the "Media Handling" "Latest Dates" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by Publisher
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters "Lord Lucifer" in the "Advanced Search" "Publisher Search" autocomplete field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by Source
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters "Pearly Gates" in the "Media Handling" "Source" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by Rights holder
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters "Yahweh" in the "Media Handling" "Rights holder search" autocomplete field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by subjects
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters "textbook" in the "Media Handling" "Subjects" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by Modified Date
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters today's date in the "Media Handling" "Earliest Modified Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: Search by username
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters "admin@core.collectionspace.org" in the "Media Handling" "Record last modified by" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  Scenario: textb**
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And enters "textb*" in the "Media Handling" "Subjects" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA82685934"
    Then close the browser

  #Test2
  Scenario: Boolean field-based search
    # Given user is on the "Create New" page
    #   And selects the "Media Handling" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Media Handling" record
      And enters "CQA824639" in the "Media Handling" "Identification Number" field
      And enters "Jane Doe" in the "Media Handling" "Creator" autocomplete field
      And enters "Jane Doe" in the "Media Handling" "Publisher" autocomplete field
      And enters "testtest" in the "Media Handling" "Coverage" field
      And clicks the "Save" button
    # Then the record is successfully saved

    # Given user is on the "Create New" page
    #   And selects the "Media Handling" radio button on the Create New page
    #   And clicks on the Create button
    And user is on a blank "Media Handling" record
      And enters "CQA823246" in the "Media Handling" "Identification Number" field
      And enters "Jane Doe" in the "Media Handling" "Creator" autocomplete field
      And enters "Jane Doe" in the "Media Handling" "Publisher" autocomplete field
      And enters "testtest" in the "Media Handling" "Coverage" field
      And clicks the "Save" button
    # Then the record is successfully saved

    # Given user is on the "Create New" page
    #   And selects the "Media Handling" radio button on the Create New page
    #   And clicks on the Create button
    And user is on a blank "Media Handling" record
      And enters "CQA824245" in the "Media Handling" "Identification Number" field
      And enters "Jane Doe" in the "Media Handling" "Creator" autocomplete field
      And enters "James Dean" in the "Media Handling" "Publisher" autocomplete field
      And enters "testtest" in the "Media Handling" "Coverage" field
      And clicks the "Save" button
    # Then the record is successfully saved

    And clicks on the "Advanced Search" button
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Media Handling" "Creator Search" autocomplete field
      And enters "Jane Doe" in the "Media Handling" "Publisher Search" autocomplete field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA824639"
    Then the search results should contain "CQA823246"
    Then the search results should contain "CQA824245"

      And clicks on the "Advanced Search" button
      And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Media Handling" "Creator Search" autocomplete field
      And enters "Jane Doe" in the "Media Handling" "Publisher Search" autocomplete field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA824639"
    Then the search results should contain "CQA823246"
    Then the search results should not contain "CQA824245"
    Then close the browser

  #Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button

      And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Media Handling" "Creator Search" autocomplete field
      And enters "Jane Doe" in the "Media Handling" "Publisher Search" autocomplete field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA824639"
    Then the search results should contain "CQA823246"
    Then the search results should contain "CQA824245"

      And clicks the "Advanced Search" button
      And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
     And selects "Media Handling" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "Jane Doe" in the "Media Handling" "Creator Search" autocomplete field
      And enters "Jane Doe" in the "Media Handling" "Publisher Search" autocomplete field
      And clicks the "Advanced Search search" button
    Then the search results should contain "CQA824639"
    Then the search results should contain "CQA823246"
    Then the search results should not contain "CQA824245"
    Then close the browser

  Scenario: Record Deletion
      Given user is on the "My CollectionSpace" page
        And navigates to the record with identification number "CQA82685934"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Media Handling" deletion should be confirmed in a dialog
      And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA824639"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Media Handling" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA823246"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Media Handling" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA824245"
        And clicks on the "Delete" button
      Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
      Then "Media Handling" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button
      Then close the browser
