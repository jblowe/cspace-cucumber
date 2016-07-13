#Created by Forest Yang on 1/11/2016
# Passing as of June 15 2016

@advancedsearch @organization
Feature: Advanced Search - Organization

  #Test1
  Scenario: Advanced Search Fields
    # Given user is on the "Create New" page
    #   And selects the "Organization" radio button on the Create New page
    #   And clicks on the Create button
    Given user is on a blank "Local Organizations" record
      And enters "DAngelo" in the "Organization" "Display Name" field
      And enters "2011-01-01" in the "Organization" "Foundation Date" field
      And enters "2011" in the "Organization" "Earliest/Single Foundation Date Year" field
      And enters "01" in the "Organization" "Earliest/Single Foundation Date Month" field
      And enters "01" in the "Organization" "Earliest/Single Foundation Date Day" field

      And enters "2011-01-01" in the "Organization" "Dissolution Date" field
      And enters "2011" in the "Organization" "Earliest/Single Dissolution Date Year" field
      And enters "01" in the "Organization" "Earliest/Single Dissolution Date Month" field
      And enters "01" in the "Organization" "Earliest/Single Dissolution Date Day" field

      And enters "Valkyries" in the "Organization" "Group" field
      And enters "Ride" in the "Organization" "Function" field
      And selects "Under Review" from the "Organization" "Status" dropdown
      And enters "textbook" in the "Organization" "Foundation Place" field
      And clicks the "Save" button

    # Then the record is successfully saved
      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And enters "DAngelo" in the "Organization" "Display Name" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "DAngelo"
    # Then close the browser

  # Scenario: Search by Foundation Date
    # Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And enters "2011-01-01" in the "Organization" "Earliest Foundation Date" field
      And enters "2011-01-01" in the "Organization" "Latest Foundation Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "DAngelo"
    # Then close the browser

  # Scenario: Search by Dissolution Date
    # Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And enters "2011-01-01" in the "Organization" "Earliest Dissolution Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "DAngelo"
    # Then close the browser

  # Scenario: Search by Group
    # Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And enters "Valkyries" in the "Organization" "Group" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "DAngelo"
    # Then close the browser

  # Scenario: Search by Function
    # Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And enters "Ride" in the "Organization" "Function" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "DAngelo"
    # Then close the browser

  # Scenario: Search by Status
    # Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And selects "Under Review" from the "Organization" "Status" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "DAngelo"
    # Then close the browser

  # Scenario: Search by Foundation place
    # Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And enters "textbook" in the "Organization" "Foundation Place" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "DAngelo"
    # Then close the browser

  # Scenario: Search by Modified Date
    # Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And enters today's date in the "Organization" "Earliest Modified Date" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "DAngelo"
    # Then close the browser

  # Scenario: Search by username
    # Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And enters "admin@core.collectionspace.org" in the "Organization" "Record last modified by" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "DAngelo"
    # Then close the browser

  # Scenario: search by partial
    # Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And enters "textb*" in the "Organization" "Foundation Place" field
      And clicks the "Advanced Search search" button
    Then the search results should contain "DAngelo"
    Then close the browser


  #Test2
  Scenario: Boolean search
    Given user is on the "Create New" page
      And selects the "Organization" radio button on the Create New page
      And clicks on the Create button
    Given user is on a blank "Local Organizations" record
      And enters "Endless Ennui" in the "Organization" "Display Name" field
      And enters "1975-07-05" in the "Organization" "Foundation Date" field
      And enters "1975" in the "Organization" "Earliest/Single Foundation Date Year" field
      And enters "07" in the "Organization" "Earliest/Single Foundation Date Month" field
      And enters "05" in the "Organization" "Earliest/Single Foundation Date Day" field

      And selects "Accepted" from the "Organization" "Status" dropdown
      And enters "testtest" in the "Organization" "Foundation Place" field
      And clicks the "Save" button
    Then the record is successfully saved

    # Given user is on the "Create New" page
    #   And selects the "Organization" radio button on the Create New page
    #   And clicks on the Create button
    And user is on a blank "Local Organizations" record
      And enters "Pedestrian at Best" in the "Organization" "Display Name" field
      And enters "1975-07-05" in the "Organization" "Foundation Date" field
      And enters "1975" in the "Organization" "Earliest/Single Foundation Date Year" field
      And enters "07" in the "Organization" "Earliest/Single Foundation Date Month" field
      And enters "05" in the "Organization" "Earliest/Single Foundation Date Day" field
      And selects "Accepted" from the "Organization" "Status" dropdown
      And enters "testtest" in the "Organization" "Foundation Place" field
      And clicks the "Save" button
    Then the record is successfully saved

    # Given user is on the "Create New" page
    #   And selects the "Organization" radio button on the Create New page
    #   And clicks on the Create button
    And user is on a blank "Local Organizations" record
      And enters "Courtney Barnett" in the "Organization" "Display Name" field
      And enters "1975-07-05" in the "Organization" "Foundation Date" field
      And enters "1975" in the "Organization" "Earliest/Single Foundation Date Year" field
      And enters "07" in the "Organization" "Earliest/Single Foundation Date Month" field
      And enters "05" in the "Organization" "Earliest/Single Foundation Date Day" field
      And selects "Rejected" from the "Organization" "Status" dropdown
      And enters "testtest" in the "Organization" "Foundation Place" field
      And clicks the "Save" button
    Then the record is successfully saved

      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "1975-06-05" in the "Organization" "Earliest Foundation Date" field
      And selects "Rejected" from the "Organization" "Status" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "Courtney Barnett"
    Then the search results should contain "Endless Ennui"
    Then the search results should contain "Pedestrian at Best"

      And clicks the "Advanced Search" button
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "1975-06-05" in the "Organization" "Earliest Foundation Date" field
      And selects "Accepted" from the "Organization" "Status" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should not contain "Courtney Barnett"
    Then the search results should contain "Endless Ennui"
    Then the search results should contain "Pedestrian at Best"
    Then close the browser

  # Test3
  Scenario: Boolean and Keyword Search
    Given user is on the "My CollectionSpace" page
      And clicks the "Advanced Search" button
      And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "1975-06-05" in the "Organization" "Earliest Foundation Date" field
      And selects "Rejected" from the "Organization" "Status" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should contain "Courtney Barnett"
    Then the search results should contain "Endless Ennui"
    Then the search results should contain "Pedestrian at Best"

      And clicks the "Advanced Search" button
      And enters "testtest" in the "AdvancedSearch" "Keyword Search" field
      And selects "Organization" from the "AdvancedSearch" "record type" dropdown
      And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
      And enters "1975-06-05" in the "Organization" "Earliest Foundation Date" field
      And selects "Accepted" from the "Organization" "Status" dropdown
      And clicks the "Advanced Search search" button
    Then the search results should not contain "Courtney Barnett"
    Then the search results should contain "Endless Ennui"
    Then the search results should contain "Pedestrian at Best"
    Then close the browser

    Scenario: Delete Records we just created
        Given user is on the "My CollectionSpace" page
        And navigates to the record with identification number "DAngelo"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Organization" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "Endless Ennui"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Organization" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "Pedestrian at Best"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Organization" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "Courtney Barnett"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Organization" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button
        Then close the browser
