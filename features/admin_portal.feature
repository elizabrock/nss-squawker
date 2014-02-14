Feature: Administrative Portal
  As an admin
  I want the admin panel to list all squawks and users
  so I can moderate squawker

  Scenario: Dashboard should have Squeek index
    Given the squeek "Hello" by "John"
    And the squeek "Goodbye" by "Mary"
    Given an admin exists with email "admin@example.com" and password "password"
    When I go to Admin Portal
    And I fill in "admin@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Login"
    Then I should see "Squeeks"
    Then I click "Squeeks"
    Then I should see "Hello"
    And I should see "Goodbye"

  Scenario: Admin should be able to delete Squeeks
    Given the squeek "Delete me!" by "John"
    Then there should be a squeek "Delete me!" in the database
    Given an admin exists with email "admin@example.com" and password "password"
    When I go to Admin Portal
    And I fill in "admin@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Login"
    Then I should see "Squeeks"
    Then I click "Squeeks"
    Then I click "Delete"
    Then I should see 0 squeeks in the database

  Scenario: Admin should have User Index
    Given the squeek "Hello" by "John"
    And the squeek "Goodbye" by "Mary"
    Given an admin exists with email "admin@example.com" and password "password"
    When I go to Admin Portal
    And I fill in "admin@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Login"
    Then I should see "User"
    Then I click "Users"
    Then I should see "John"
    And I should see "Mary"

  Scenario: Admin should be able to edit Users
    Given the following user:
      | username              | joe             |
      | email                 | joe@example.com |
    Given an admin exists with email "admin@example.com" and password "password"
    When I go to Admin Portal
    And I fill in "admin@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Login"
    Then I should see "User"
    Then I click "Users"
    Then I should see "joe"
    Then I click "Edit"
    Then I fill in "newemail@mail.com" for "Email"
    And I fill in "newUser" for "Username"
    And I press "Update User"
    Then I should see "User was successfully updated"
    Then I go to Users Index
    And I should see "newemail@mail.com"
    And I should see "newUser"

