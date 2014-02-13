Feature: Viewing activity feed with pagination
  In order to ease navigation
  As a visitor
  I want to see squeeks split into pages

  Scenario: Squeeks per page is limited
    Given 26 squeeks
    When I go to the homepage
    Then I should see 25 squeeks

  Scenario: Pagination links are shown
    Given 26 squeeks
    When I go to the homepage
    Then I should see pagination links

  Scenario: Page one should show the right squeeks
    Given 26 squeeks
    When I go to the homepage
    Then I should see "Squeek 1"

  Scenario: Previous and Next links change pages correctly
    Given 26 squeeks
    When I go to the homepage
    And I click "Next"
    Then I should see "Squeek 26"
    # assumes 25 squeeks per page
    And I click "Previous"
    Then I should see "Squeek 1"

  Scenario: Page number links take you to the correct page
    Given 26 squeeks
    When I go to the homepage
    And I click "2"
    Then I should see "Squeek 26"
    # assumes 25 squeeks per page

  Scenario: Previous should not be on home page
    Given 26 squeeks
    When I go to the homepage
    Then I should not see "Previous"

  Scenario: Next should not be on the last page
    Given 25 squeeks
    When I go to the homepage
    Then I should not see "Next"
