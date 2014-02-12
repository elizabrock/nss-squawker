Feature: Viewing activity feed with pagination
  In order to ease navigation
  As a visitor
  I want to see squeeks split into pages

  # test that the number of squeeks per page is limited
  Scenario:
    Given 200 squeeks
    When I go to the homepage
    Then I should see 25 squeeks

  # test that pagination links are displayed
  Scenario:
    Given 200 squeeks
    When I go to the homepage
    Then I should see pagination links

  # test that the right squeeks are displayed for the first page
  Scenario:
    Given sequential 200 squeeks
    When I go to the homepage
    Then I should see "Squeek 1"

  # test that next takes you to page 2, previous to page 1
  Scenario:
    Given sequential 200 squeeks
    When I go to the homepage
    And I click "Next"
    Then I should see "Squeek 26"
    # assumes 25 squeeks per page
    And I click "Previous"
    Then I should see "Squeek 1"

  # test that clicking a page number displays the right squeeks
  Scenario:
    Given sequential 200 squeeks
    When I go to the homepage
    And I click "Next"
    Then I should see "Squeek 26"
    # assumes 25 squeeks per page

  # test that previous isn't on first page
  Scenario:
    Given sequential 200 squeeks
    When I go to the homepage
    Then I should not see "Previous"

  # test that next isn't on last page
    Scenario:
    Given sequential 200 squeeks
    When I go to the homepage
    Then I should not see "Next"
