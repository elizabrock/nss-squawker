Feature: Admin user can see deleted squeeks
  As an admin
  In order to audit accounts to address complaints
  I want to see all squeeks including deleted ones

  Scenario: Admin user can view deleted squeeks
    Given I'm signed in as "jane"
    When I go to the homepage
    And I fill in "Squeek here" with "She dropped him off at band practice."
    And I press "Squawk"
    And I press "Delete"
    And an admin exists with email "admin@example.com" and password "password"
    And I go to the Admin Portal
    And I fill in "admin@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Login"
    Then I click "Squeeks"
    Then I should see "She dropped him off at band practice."
