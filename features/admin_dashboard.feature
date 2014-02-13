Feature: Administrative Dashboard
  As an admin
  I want the admin panel to list all squawks and users
  so I can moderate squawker

Scenario: Dashboard should have squawk index
  Given the squeek "Hello" by "John"
  And the squeek "Goodbye" by "Mary"
  Given I login as an admin
  Then I should see "Squawks"
  Then I should click "Squawks"

# Scenario: Admin should be able to delete tweets
#   Given that I am on the admin portal
#   And I press "Squawks"
#   Then I should go to Squawks Index
#   And I should see "delete"
#   # This wording will change! Unclear how to word right now.
#   Then I press "delete squawk"
#   And Squawk should be deleted

# Scenario: Admin should be able to edit user emails
#   Given that I am on the admin portal
#   And I should press "Users"
#   Then I should go to Users Index
#   And I should see "edit email"
#   # This wording will change like the feature above. Unsure of how this
#   # functionality works with activeadmin so unsure of steps to define
#   Then I press "edit email"
#   And I should go to Edit Email Form
#   And I  fill in "example@mail.com" for "email"
#   And I press "submit changes"
#   # Another pending step. Please help eliza!
#   Then email should be changed
