Feature: Add Consumer
  As a user
  In order to communicate with and keep track of consumers
  I want to be able to add a Consumer

  -Standard can only add one Consumer at a time

  Scenario: Consumer button appears for non-Consumer
    Given I'm signed in as "joe"
    And the following user:
      | username | sally |
    When I go to sally's profile page
    Then I should see an "Broadcast to @sally" button

  Scenario: Consumer button does not appear on my profile
    Given I'm signed in as "joe"
    When I go to joe's profile page 
    Then I should not see an "Broadcast to @joe" button

  Scenario: Clicking "Add Consumer" will replace form with success message
    Given I'm signed in as "joe"
    And the following user:
      | username | sally |
    When I go to sally's profile page
    And I press "Broadcast to @sally"
    Then I should see "You are broadcasting to @sally."
    And I should not see an "Broadcast to @sally" button
    And a relationship between "joe" and "sally" should be created in the database
