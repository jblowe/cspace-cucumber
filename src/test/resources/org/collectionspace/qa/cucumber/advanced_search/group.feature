# Created by Cesar Villalobos on 01/07/2016
# CQA-75
# Working as of 05/04/16 with occasional errors

@advancedsearch @group
Feature: Advanced Search - Group
    Searching for a recently made group

    Scenario: User Creates a Group Record and then Searches for it. The record is then deleted.
          Given user is on a blank "Group" record
          And enters "textbook75" in the "Group" "Title" field
          And enters "Cesar Villalobos" in the "Group" "Group Owner" autocomplete field

          And clicks the "Save" button
          And clicks the "Ok" button

          And clicks the "Advanced Search" button
          And selects "Group" from the "AdvancedSearch" "record type" dropdown
          And enters "textbook75" in the "Group" "Title" field
          And clicks the "Advanced Search search" button
          Then the search results should contain "textbook75"

          And clicks the "Advanced Search" button
          And selects "Group" from the "AdvancedSearch" "record type" dropdown
          And enters "Cesar Villalobos" in the "Group" "Group Owner" autocomplete field
          And clicks the "Advanced Search search" button
          Then the search results should contain "textbook75"

          And clicks the "Advanced Search" button
          And selects "Group" from the "AdvancedSearch" "record type" dropdown
          And enters "textb*" in the "Group" "Title" field
          And clicks the "Advanced Search search" button
          Then the search results should contain "textbook75"

          And navigates to the record with identification number "textbook75"
          And clicks on the "Delete" button
          Then delete confirmation dialogue should appear
          And clicks the confirmation delete button
          Then "Group" deletion should be confirmed in a dialog
          And clicks delete confirmation OK button
          Then close the browser
