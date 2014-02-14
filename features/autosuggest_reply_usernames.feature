@wip @javascript
Feature: Automatically suggesting usernames
  As a squawker
  In order to easily reference other squawkers
  I want to get username suggestions as type them

  Background:
    Given I'm signed in as "joe"
    And the following users:
      | username      |
      | TheRealNimoy  |
      | CanadianImage |
      | LilNemo       |

  Scenario: User starts typing someone
    When I fill in "Squeek here" with "nim"
    Then I should see "TheRealNimoy"
    And I should see "CanadianImage"
    And I should not see "LilNemo"
    Then show me the page

  Scenario: User continues typing someone
    When I fill in "Squeek here" with "nimo"
    Then I should see "TheRealNimoy"
    And I should not see "CanadianImage"

  Scenario: User selects someone
    When I fill in "Squeek here" with "sa"
    Then I should see "Sally"
    And I should see "Sarah"
    When I click "Sally"
    Then I should see "@Sally" filled in "Squeek here"