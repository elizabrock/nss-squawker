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
  And I press "Squawks"
  Then I should go to Squawks Index
  And I should see "delete"
  # This wording will change! Unclear how to word right now.
  Then I press "delete squawk"
  And Squawk should be deleted

Scenario: Admin should be able to edit user emails
  Given that I am on the admin portal
  Then I should press "Users"
  And I should see "edit email"
