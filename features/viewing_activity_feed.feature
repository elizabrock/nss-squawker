Feature: Viewing activity feed
  In for the application to be intuitive
  As a visitor
  I want to see the activity feed right away

  Scenario:
    Given the squeek "Hello there"
    And the squeek "Goodbye"
    When I go to the homepage
    Then I should see "Hello there" within the squeeks feed
    And I should see "Goodbye" within the squeeks feed
