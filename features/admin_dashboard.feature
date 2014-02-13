Feature: Administrative Dashboard
  As an admin
  I want the admin panel to list all squawks and users
  so I can moderate squawker

Scenario: Dashboard should have squawk index
  Given that I am on the admin portal
  Then I should see "Squawks"
  And I should press "Squawks"
  Then I should see "All"
  And I should see "id"
  And I should see "date"
  And I should see "username"

Scenario: Admin should be able to delete tweets
  Given that I am on the admin portal
  Then I should press "Squawks"
  And I should see "Delete"

Scenario: Admin should be able to email user
  Given that I am on the admin portal
  Then I should press "Users"
  And I should see "Email"