Feature: Administrative Portal
  As an admin
  I want the admin panel to list all squawks and users
  so I can moderate squawker

  Background: 
    Given an admin exists with email "admin@example.com" and password "password"
    Given the squeek "Hello" by "mary"
    When I go to the Admin Portal
    And I fill in "admin@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Login"

  Scenario: Dashboard should have Squeek index
    Then I should see "Squeeks"
    Then I click "Squeeks"
    Then I should see "Hello"

  Scenario: Admin should be able to delete Squeeks
    Then I should see "Squeeks"
    Then I click "Squeeks"
    Then I click "Delete"
    Then I should see 0 squeeks in the database

  Scenario: Admin should have User Index
    Then I click "Users"
    Then I should see "mary"

  Scenario: Admin should be able to edit Users
    Then I click "Users"
    Then I should see "mary"
    Then I click "Edit"
    Then I fill in "newemail@mail.com" for "Email"
    And I fill in "newUser" for "Username"
    And I press "Update User"
    Then I should see "User was successfully updated"
    Then I go to the admin section for "users"
    And I should see "newemail@mail.com"
    And I should see "newUser"