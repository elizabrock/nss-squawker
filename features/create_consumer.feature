Feature: Add Consumer
  As a user
  In order to communicate with and keep track of consumers
  I want to be able to add a Consumer

  -Standard can only add one Consumer at a time

  Scenario: Consumer button appears for non-Consumer
    Given I'm signed in as "joe"
    And a user named "sally" is created
    When I go to the user page of "sally"
    Then I should see an "Broadcast to @sally" button

  Scenario: Consumer button does not appear on my profile
    Given I'm signed in as "joe"
    When I go to the user page of "joe"
    Then I should not see an "Broadcast to @joe" button

  Scenario: Clicking "Add Consumer" will replace form with success message
    Given I'm signed in as "joe"
    And a user named "sally" is created
    When I go to the user page of "sally"
    And I press "Broadcast to @sally"
    Then I should see "You are broadcasting to @sally."
    And I should not see an "Broadcast to @sally" button
    And a relationship between "sally" and "joe" should be created in the database