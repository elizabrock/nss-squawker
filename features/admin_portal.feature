Feature: Administrative Portal
  As an admin
  I want the admin panel to list all squawks and users
  so I can moderate squawker

  Scenario: Dashboard should have squawk index
    Given the squeek "Hello" by "John"
    And the squeek "Goodbye" by "Mary"
    Given I login as an admin
    Then I should see "Squeeks"
    Then I should click "Squeeks"
