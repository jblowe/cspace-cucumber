#Created by Forest Yang on 12/22/2015

@administration
Feature: Permission Enforcement - Administration
  

  #crippling lack of step defs

  #Test1
  Scenario: No access to any administration
    Given user is logged in as "User I"
      And clicks the "Administration" menu item
    Then the "Users" tab is not present
    Then the "Roles & Permissions" tab is not present

  #Test2 continues from Test1
      And selects the "Term List Management" tab
      And clicks on a term list
    Then the details should be read only
    Then the "Save" button should not present
    Then the "Cancel" button should not present
    Then close the browser

  #Test3
  Scenario: Read only access to Users
    Given user is logged in as "User II"
      And clicks the "Administration" menu item
    Then "Users" tab should be selected by default
    Then the "+ User" button should not present
      And clicks on a user
    Then the "Save" button should not present
    Then the "Cancel" button should not present
    Then the "Delete" button should not present
    Then the details should be read only
  
  #Test5: Read only access to Roles and Permissions; continues from Test3
      And selects the "Roles & Permissions" tab
    Then the "+ Role" button should not present
      And clicks on a role
    Then the details should be read only
    Then the "Save" button should not present
    Then the "Cancel" button should not present
    Then the "Delete" button should not present
    Then close the browser

  #Test7
  Scenario: Write access to Users
    Given user is logged in as "User III"
      And clicks the "Administration" menu item
    Then the "+ User" button should be present
      And clicks on a user
    Then the details should be editable
    Then the "Delete" button should not present
      And clicks the "+ User" button
      And fills out required fields
      And assigns an existing role
      And clicks on the "Save" button
    Then user is successfully saved
    Then a confirmation dialog should appear
      And clicks the recently created user
      And assigns a different role
      And clicks on the "Save" button
    Then user is not successfully saved
    Then the message "You do not have permission to edit user roles" should appear

  #Continued from above: Test8: Write access to Roles & Permissions
      And selects the "Roles & Permissions" 
    Then the "+ Role" button should be present
      And clicks on a role
    Then the details should be editable
    Then the "Delete" button should not present
      And clicks the "+ Role" button
      And fills out required fields
      And changes a permission
      And clicks on the "Save" button
    Then the role is successfully saved
    Then a confirmation dialog should appear
      And clicks the recently created role
      And changes a role
      And clicks on the "Save" button
    Then the role is not successfully saved
    Then the message "You do not have permission to edit roles" should appear

  #Continued from above: Test10: Write access to Term List Management
      And selects the "Term List Management" tab
      And clicks on a term list
    Then the details should be editable
    Then the "Save" button should be present
    Then the "Cancel" button should be present
    Then the "Cancel" button "should not" be clickable
      And changes the "Name" field
      And changes the "Source" field
      And changes the "Destination" field
      And clicks the "+" button
      And fills out required fields
      And clicks on the "Save" button
    Then the term list is successfully saved
    Then close the browser

  #Test11
  Scenario: Checking Deletion of Roles
    Given user is logged in as "User IV"
      And selects the "Administration" tab
      And selects the "Roles & Permissions" tab
      And clicks the "+ Role" button
      And fills out required fields
      And clicks on the "Save" button
    Then the role is successfully saved
      And clicks the recently created role
      And clicks the "Delete" button
    Then the role should be deleted

  #Continued from above: Test13: Checking Deletion of Users
      And selects the "Users" tab
      And clicks the "+ User" button
      And enters "test@collectionspace.org" in the "Email Address" field
      And enters "test@collectionspace.org" in the "Full Name" field
      And enters "test@collectionspace.org" in the "Password" field
      And enters "test@collectionspace.org" in the "Confirm Password" field
      And assigns an existing role
      And clicks on the "Save" button
    Then user is successfully saved
      And opens a different browser
    Given user is logged in as "test@collectionspace.org" with the password "test@collectionspace.org" on the second browser
      And clicks the "test@collectionspace.org" user
    Then the "Delete" button should not present
    Then the "Term List Management" tab is not present
    Then close the browser
