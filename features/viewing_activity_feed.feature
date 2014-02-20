Feature: Viewing activity feed
  In order for the application to be intuitive
  As a visitor
  I want to see the activity feed right away

  Scenario:
    Given the following user:
      | username | joe |
    And that user has the following squeek:
      | body | Hello there |
    And the following user:
      | username | sally |
    And that user has the following squeek:
      | body | Goodbye |
    When I go to the homepage
    Then I should see "@joe: Hello there" within the squeeks feed
    And I should see "@sally: Goodbye" within the squeeks feed
