Feature: Viewing activity feed with pagination
  In order to ease navigation
  As a visitor
  I want to see squeeks split into pages

  Background:
    Given the following squeeks:
      | body     |
      | Squeek 1 |
      | Squeek 2 |
      | Squeek 3 |
      | Squeek 4 |

  Scenario: Squeeks per page is limited
    When I go to the homepage
    Then I should see 3 squeeks

  Scenario: Pagination links are shown
    When I go to the homepage
    Then I should see pagination links

  Scenario: Page one should show the right squeeks
    When I go to the homepage
    Then I should see "Squeek 1"

  Scenario: Previous and Next links change pages correctly
    When I go to the homepage
    And I click "Next"
    Then I should see "Squeek 4"
    And I click "Prev"
    Then I should see "Squeek 1"

  Scenario: Page number links take you to the correct page
    When I go to the homepage
    And I click "2"
    Then I should see "Squeek 4"

  Scenario: Previous should not be on home page
    When I go to the homepage
    Then I should not see "Prev"

  Scenario: Next should not be on the last page
    When I go to the homepage
    And I click "Last"
    Then I should not see "Next"
