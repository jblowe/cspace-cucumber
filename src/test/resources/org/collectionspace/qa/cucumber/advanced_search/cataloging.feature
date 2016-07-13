# Created by Cesar Villalobos on 01/07/2016

@advancedsearch @cataloging
Feature: Advanced Search - Cataloging

    Scenario: Advanced Search Fields
        # To do: Change selects to clicks on result for autocomplete

        # Given user is on the "Create New" page
        # And selects the "Cataloging" radio button on the Create New page
        Given user is on a blank "Cataloging" record

        And enters "CQA72.1" in the "Cataloging" "Identification Number" field
        And enters "Nameless Object" in the "Cataloging" "Object Name" field
        And selects "Antiquities" from the "Cataloging" "Responsible Department" dropdown
        And selects "Study Collection" from the "Cataloging" "Collection" dropdown

        And enters "CQA72 Test 1" in the "Cataloging" "Title" field
        And selects "New" from the "Cataloging" "Record Status" dropdown
        And enters "72.1.1" in the "Cataloging" "Copy Number" field
        And enters "72.1.2" in the "Cataloging" "Edition Number" field

        And selects "dry" from the "Cataloging" "Form" dropdown
        And enters "Cesar Villalobos" in the "Cataloging" "Inscriber" field
        And selects "Cesar Villalobos" from autocomplete options
        And enters "Drawings" in the "Cataloging" "Inscription Method" field

        And enters "Polyester" in the "Cataloging" "Material" field
        And selects "forgery" from the "Cataloging" "Object Status" dropdown
        And selects "larva" from the "Cataloging" "Phase" dropdown
        And selects "female" from the "Cataloging" "Sex" dropdown

        And enters "French" in the "Cataloging" "Style" field
        And selects "record speed" from the "Cataloging" "Technical Attribute" dropdown
        And selects "handle" from the "Cataloging" "Object Component Name" dropdown
        And enters "2016-01-01" in the "Cataloging" "Production Date" field
        And enters "Water Tribe" in the "Cataloging" "Production organization" field
        And selects "Water Tribe" from autocomplete options

        And enters "Southern Water Tribe" in the "Cataloging" "Production people" field
        And enters "Cesar Villalobos" in the "Cataloging" "Production person" field
        And selects "Cesar Villalobos" from autocomplete options

        And enters "Mexico" in the "Cataloging" "Production place" field
        And enters "Hydration" in the "Cataloging" "Technique" field
        And enters "textbook" in the "Cataloging" "Field collection event name" field
        And clicks the "Save" button
        And clicks the "Ok" button

        # Identification Number
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "CQA72.1" in the "Cataloging" "Identification Number" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Object Name
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "Nameless Object" in the "Cataloging" "Object Name" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Responsible Department
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "Antiquities" from the "Cataloging" "Responsible Department" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Collection
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "Study Collection" from the "Cataloging "Collection" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Title
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "CQA72 Test 1" in the "Title" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Record Status
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "New" from the "Cataloging "Record Status" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Copy Number
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "72.1.1" in the "Cataloging" "Copy Number" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Edition Number
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "72.1.2" in the "Cataloging" "Edition Number" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Form
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "dry" from the "Cataloging "Form" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Inscriber (Non­Textual Inscription)
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "Cesar Villalobos" in the "Cataloging" "Inscriber" field
        And selects "Cesar Villalobos" from autocomplete options
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Inscription Method (Non­Textual Inscription)
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "Drawings" in the "Cataloging" "Inscription Method" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Material
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "Polyester" in the "Cataloging" "Material" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Object Status
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "forgery" from the "Cataloging "Object Status" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Phase
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "larva" from the "Cataloging" "Phase" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Sex
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "female" from the "Cataloging "Sex" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Style
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "French" in the "Cataloging" "Style" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Technical Attribute
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "record speed" from the "Cataloging "Technical Attribute" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Object Component Name
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "handle" from the "Cataloging "Object Component Name" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Production Date
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "2016-01-01" in the "Cataloging" "Production Date" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Production Organization
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "Water Tribe" in the "Cataloging" "Production organization" field
        And selects "Water Tribe" from autocomplete options
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Production People
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "Southern Water Tribe" in the "Cataloging" "Production people" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Production Person
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "Cesar Villalobos" in the "Cataloging" "Production person" field
        And selects "Cesar Villalobos" from autocomplete options
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Production Place
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "Mexico" in the "Cataloging" "Production place" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Production Technique
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "Hydration" in the "Cataloging" "Technique" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        # Last edited
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters today's date in the "Earliest Modified Date" field
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "admin@CollectionSpace.org" in the "Cataloging" "Record last modified by" date
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"

        #wildcard
        And clicks the "Advanced Search" button
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And enters "textb*" in the "Cataloging" "Field collection event name" date
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.1"
        Then close the browser


    Scenario: Boolean field-­based
        # Given user is on the "Create New" page
        # And selects the "Cataloging" radio button on the Create New page
        Given user is on a blank "Cataloging" record
        And enters "CQA72.2" in the "Cataloging" "Cataloging/Assessment Reference Number" field
        And selects "Study Collection" from the "Cataloging "Collection" dropdown
        And selects "New" from the "Cataloging "Record Status" dropdown
        And enters "testtest" in the "Cataloging" "Brief Description" field
        And clicks the "Save" button

        # And navigates to the "Create New" page
        # And selects the "Cataloging" radio button on the Create New page
        And user is on a blank "Cataloging" record
        And enters "CQA72.3" in the "Cataloging" "Cataloging/Assessment Reference Number" field
        And selects "Study Collection" from the "Cataloging "Collection" dropdown
        And selects "New" from the "Cataloging "Record Status" dropdown
        And enters "testtest" in the "Cataloging" "Distinguishing Features" field
        And clicks the "Save" button

        # And navigates to the "Create New" page
        # And selects the "Cataloging" radio button on the Create New page
        And user is on a blank "Cataloging" record
        And enters "CQA72.4" in the "Cataloging" "Cataloging/Assessment Reference Number" field
        And selects "Study Collection" from the "Cataloging "Collection" dropdown
        And selects "Temporary" from the "Cataloging "Record Status" dropdown
        And enters "testtest" in the "Cataloging" "Comments" field
        And clicks the "Save" button

        And clicks the "Advanced Search button"
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
        And selects "Study Collection" from the "Cataloging "Collection" dropdown
        And selects "New" from the "Cataloging "Record Status" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.2"
        Then the search results should contain "CQA72.3"
        Then the search results should contain "CQA72.4"

        And clicks the "Advanced Search button"
        And selects "Cataloging" from the "AdvancedSearch" "record type" dropdown
        And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
        And selects "Study Collection" from the "Cataloging "Collection" dropdown
        And selects "New" from the "Cataloging "Record Status" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.2"
        Then the search results should contain "CQA72.3"
        Then the search results should not contain "CQA72.4"
        Then close the browser


    Scenario: Boolean and Keyword Search
        Given user is in the "My CollectionSpace" page
        And clicks the "Advanced Search" button
        And enters "testtest" in the "Keyword Search" field
        And selects "any (OR)" from the "AdvancedSearch" "Field-based search" dropdown
        And selects "Study Collection" from the "Cataloging "Collection" dropdown
        And selects "New" from the "Cataloging "Record Status" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.2"
        Then the search results should contain "CQA72.3"
        Then the search results should contain "CQA72.4"

        And clicks the "Advanced Search" button
        And enters "testtest" in the "Keyword Search" field
        And selects "all (AND)" from the "AdvancedSearch" "Field-based search" dropdown
        And selects "Study Collection" from the "Cataloging "Collection" dropdown
        And selects "New" from the "Cataloging "Record Status" dropdown
        And clicks the "Advanced Search search" button
        Then the search results should contain "CQA72.2"
        Then the search results should contain "CQA72.3"
        Then the search results should not contain "CQA72.4"

    Scenario: Temproary Record Deletion
        And navigates to the record with identification number "CQA72.1"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Cataloging" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA72.2"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Cataloging" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA72.3"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Cataloging" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        And navigates to the record with identification number "CQA72.4"
        And clicks on the "Delete" button
        Then delete confirmation dialogue should appear
        And clicks the confirmation delete button
        Then "Cataloging" deletion should be confirmed in a dialog
        And clicks delete confirmation OK button

        Then close the browser
