Feature: Create a squeek
  In order to vent my spleen
  As an internet heathen
  I want to anonymously post a message

  Scenario: Not being logged in
    When I go to the homepage
    Then I should see "Sign in or Sign up to post a squeek"
    And I should not see "Squeek here"

  Scenario: Logged in users aren't prompted to log in
    Given I'm signed in as "joe"
    Then I should not see "Sign in or Sign up to post a squeek"
    And I should see "Squeek here"

  Scenario: Trying to create a blank message fails
    Given I'm signed in as "joe"
    When I go to the homepage
    When I press "Squawk"
    Then I should see: "Your squeek can't be blank"

  Scenario: Creating a message with a body succeeds
    Given I'm signed in as "jane"
    When I go to the homepage
    Then I should see "Squeek here"
    When I fill in "Squeek here" with "I hate everything"
    And I press "Squawk"
    Then I should see: "Your squeek has been posted"
    And I should see the following squeek in the database:
      | body | I hate everything |
    And I should see "@jane: I hate everything" within the squeeks feed
