Feature: Logging into Application
  In order for the user to circumvent making too many tedious online accounts
  As a user
  I want to be able to use existing Twitter account to login

  Scenario: User signs in through twitter account
    When I go to the homepage
    And I follow "Sign In"
    And I press "Sign In Through Twitter"
    And I fill in "joe" for "Username"
    And I fill in "password" for "user_password"
    And I press "Sign In"
    Then I should see "Welcome! You have signed in successfully."
    And I should see "Sign Out"
    And I should not see "Sign In"
    And I should not see "Sign Up"
    When I follow "Sign Out"
    Then I should not see "Sign Out"
    And I should see "Sign In"

