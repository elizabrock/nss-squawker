
Feature: Logging into Application through Twitter
  In order for the user to circumvent making too many tedious online accounts
  As a user
  I want to be able to use existing Twitter account to login

  @wip
  Scenario: User signs in successfully through twitter account
    When I go to the homepage
    And I follow "Sign In"
    # And I follow "Sign in with Twitter"
    # WE DO FAKE SIGN IN (MOCK)
    And I login to "Twitter"
    # And I fill in "@petenjay1" for "Username"
    # And I fill in "eliza123" for "user_password"
    Then I should see "Successfully authenticated from Twitter account."

  Scenario: User signs in through twitter account automatically
    When I go to the homepage
    And I follow "Sign In"
    And I fill in "joe" for "Username"
    And I fill in "password" for "user_password"
    And I follow "Sign in with Twitter"
    Then I should see "Welcome! You have signed in successfully."
    When I follow "Sign Out"
    And I follow "Sign In"
    And I fill in "joe" for "Username"
    And I fill in "password" for "user_password"
    And I press "Sign In"
    Then I should see "Welcome! You have signed in successfully."
