@wip
Feature: Viewing activity feed
  In for the application to be intuitive
  As a visitor
  I want to see the activity feed right away

  Scenario:
    Given the squeek "Hello there" by "joe"
    And the squeek "Goodbye" by "sally"
    When I go to the homepage
    Then I should see "@joe: Hello there" within the squeeks feed
    And I should see "@sally: Goodbye" within the squeeks feed
