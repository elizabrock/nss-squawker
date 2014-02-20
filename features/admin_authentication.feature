Feature: Administration Authentication
  As an admin
  I want to be able to log in to the admin suite
  and prevent non-admins from doing so
  - Standard Login Form
  - No password reset

  Scenario: Admins can log into the portal
    Given an admin exists with email "admin@example.com" and password "password"
    When I go to the admin portal
    And I fill in "admin@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Login"
    Then I should see "Dashboard"

  Scenario: Non-admins can't log into the portal
    Given an admin exists with email "admin@example.com" and password "password"
    When I go to the admin portal
    And I fill in "notadmin@example.com" for "Email"
    And I fill in "notpassword" for "Password"
    And I press "Login"
    Then I should see "Invalid email or password."

  Scenario: Admins can log out of portal and are brough to login screen
   Given an admin exists with email "admin@example.com" and password "password"
    When I go to the admin portal
    And I fill in "admin@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Login"
    And I click "Logout"
    Then I should see "You need to sign in or sign up before continuing."
