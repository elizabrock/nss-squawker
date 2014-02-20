Feature: Logging into Application through Twitter
  In order for the user to circumvent making too many tedious online accounts
  As a user
  I want to be able to use existing Twitter account to login

  @wip
  Scenario: User signs in successfully through twitter account
    When I go to the homepage
    And I follow "Sign In"
    And I log in with Twitter
    Then I should see "Successfully authenticated from Twitter account."
