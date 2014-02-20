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
    When I click "Squeeks"
    Then I should see "Hello"

  Scenario: Admin should be able to delete Squeeks
    Then I should see "Squeeks"
    When I click "Squeeks"
    And I click "Delete"
    Then I should see 0 squeeks in the database

  Scenario: Admin should have User Index
    When I click "Users"
    Then I should see "mary"

  Scenario: Admin should be able to edit Users
    When I click "Users"
    Then I should see "mary"
    When I click "Edit"
    And I fill in "newemail@mail.com" for "Email"
    And I fill in "newUser" for "Username"
    And I press "Update User"
    Then I should see "User was successfully updated"
    When I go to the admin section for "users"
    Then I should see "newemail@mail.com"
    And I should see "newUser"

  Scenario: Admin should have Admin Index
    When I click "Admin Users"
    Then I should see "admin@example.com"

  Scenario: Admin should be able to add Admins
    When I click "Admin Users"
    And I click "New Admin User"
    And I fill in "newadmin@mail.com" for "Email"
    And I fill in "password1" for "Password"
    And I fill in "password1" for "Password confirmation"
    And I press "Create Admin user"
    Then I should see "Admin user was successfully created"
    When I click "Admin Users"
    Then I should see "newadmin@mail.com"
    And I should see "admin@example.com"
    When I follow "Logout"
    And I go to the Admin Portal
    And I fill in "newadmin@mail.com" for "Email"
    And I fill in "password1" for "Password"
    And I press "Login"
    Then I should see "Signed in successfully"

  Scenario: Admin should be able to edit Admins
    When I click "Admin Users"
    And I click "Edit"
    And I fill in "newemail@example.com" for "Email"
    And I fill in "password1" for "Password"
    And I fill in "password1" for "Password confirmation"
    And I press "Update Admin user"
    # You automatically get logged out..
    When I go to the Admin Portal
    And I fill in "newemail@example.com" for "Email"
    And I fill in "password1" for "Password"
    And I press "Login"
    Then I should see "Signed in successfully"
    When I click "Admin Users"
    Then I should see "newemail@example.com"
    And I should not see "admin@example.com"
