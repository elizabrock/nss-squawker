Feature: Add Friend
  As a user
  In order to communicate with and keep track of friends
  I want to be able to add a friend

  -Standard can only add one friend at a time

  Scenario: Friend button appears for non-friend
    Given I'm signed in as "joe"
    And a user named "sally" is created
    When I go to the user page of "sally"
    Then I should see an "Add Friend" button

  Scenario: Friend button does not appear on my profile
    Given I'm signed in as "joe"
    When I go to the user page of "joe"
    Then I should not see an "Add Friend" button

  Scenario: Clicking "Add Friend" will replace form with success message
    Given I'm signed in as "joe"
    And a user named "sally" is created
    When I go to the user page of "sally"
    And I press "Add Friend"
    Then I should see "You are friends!"
    And I should not see an "Add Friend" button
    And a relationship between "sally" and "joe" should be created in the database