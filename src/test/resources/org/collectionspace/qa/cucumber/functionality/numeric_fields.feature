# Created by Jennifer Lynn Be on 11/21/2015
# works as of 6/16/2016

@functionality
Feature: Numeric Fields - QA Test Plan

  Scenario: User Tests Invalid Float Field Inputs
    Given user is on a blank "Cataloging" record
      And enters "Numeric Fields Test 1/5" in the "Cataloging" "Identification Number" field
      And enters "123a" in the "Cataloging" "Price - value" field
    Then the error message bar should appear with "Price - value: The number you have entered is invalid. Please try again."
      And clicks the "Ok" button
      And clears the "Cataloging" "Price - value" field
      And enters "0.123a" in the "Cataloging" "Price - value" field
    Then the error message bar should appear with "Price - value: The number you have entered is invalid. Please try again."
      And clicks the "Ok" button
      And clears the "Cataloging" "Price - value" field
      And enters "123.123.123" in the "Cataloging" "Price - value" field
    Then the error message bar should appear with "Price - value: The number you have entered is invalid. Please try again."
      And user clicks OK to cancel error message
      And close the browser

  Scenario: User Tests Valid Float Field Inputs
    Given user is on a blank "Cataloging" record
      And enters "Numeric Fields Test 2/5" in the "Cataloging" "Identification Number" field
      And enters ".1234" in the "Cataloging" "Value" field 
      And clicks the "Save" button
      And the record is successfully saved
      And clears the "Cataloging" "Value" field
      And enters "0.1234" in the "Cataloging" "Value" field 
      And clicks the "Save" button
      And the record is successfully saved
      And clears the "Cataloging" "Value" field
      And enters "1234.0" in the "Cataloging" "Value" field 
      And clicks the "Save" button
      And the record is successfully saved
      And clears the "Cataloging" "Value" field
      And enters "1234" in the "Cataloging" "Value" field 
      And clicks the "Save" button
      And the record is successfully saved
      And clears the "Cataloging" "Value" field
      And enters "0" in the "Cataloging" "Value" field 
      And clicks the "Save" button
      And the record is successfully saved
      And clears the "Cataloging" "Value" field
      And enters "-9.123" in the "Cataloging" "Value" field 
      And clicks the "Save" button
      And the record is successfully saved
      And close the browser

  Scenario: User Tests Invalid Integer Field Inputs
    Given user is on a blank "Cataloging" record
      And enters "Numeric Fields Test 3/5" in the "Cataloging" "Identification Number" field
      And enters "123.0" in the "Cataloging" "Number of Objects" field 
    Then the error message bar should appear with "Number of Objects: The number you have entered is invalid. Please try again."
      And clicks the "Ok" button
      And clears the "Cataloging" "Number of Objects" field
      And enters "1abc" in the "Cataloging" "Number of Objects" field 
    Then the error message bar should appear with "Number of Objects: The number you have entered is invalid. Please try again."
      And clicks the "Ok" button
      And clicks the "Save" button
    Then the error message bar should appear with "Number of Objects: The number you have entered is invalid. Please try again."
      And clicks the "Ok" button
      And close the browser

  Scenario: User Tests Valid Integer Field Inputs
    Given user is on a blank "Cataloging" record
      And enters "Numeric Fields Test 4/5" in the "Cataloging" "Identification Number" field
      And enters "1234" in the "Cataloging" "Number of Objects" field
      And clicks the "Save" button
      And the record is successfully saved
      And clears the "Cataloging" "Number of Objects" field
      And enters "0" in the "Cataloging" "Number of Objects" field
      And clicks the "Save" button
      And the record is successfully saved
      And clears the "Cataloging" "Number of Objects" field
      And enters "-1234" in the "Cataloging" "Number of Objects" field
      And clicks the "Save" button
      And the record is successfully saved
      And close the browser

  Scenario: User Tests Multiple Invalid Fields
    Given user is on a blank "Cataloging" record
      And enters "Numeric Fields Test 5/5" in the "Cataloging" "Identification Number" field
      And enters "123.0" in the "Cataloging" "Number of Objects" field 
    Then the error message bar should appear with "Number of Objects: The number you have entered is invalid. Please try again."
      And enters "123.123.123" in the "Cataloging" "Value" field 
      And clicks the "Save" button
    Then the error message bar should appear with "Number of Objects & Price - value: The number you have entered is invalid. Please try again."
    And close the browser
