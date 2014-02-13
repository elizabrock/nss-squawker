@wip @javascript
Feature: Automatically suggesting usernames
  As a squawker
  In order to easily reference other squawkers
  I want to get username suggestions as type them

  Background:
    Given the following users:
      | username      |
      | TheRealNimoy  |
      | CanadianImage |
      | LilNemo       |

  Scenario: User starts typing @someone
    When I type the squeek "@nim"
    Then I should see "@TheRealNimoy" within the username dropdown field
    And I should see "@CanadianImage" within the username dropdown field
    And I should not see "@LilNemo" within the username dropdown field

  Scenario: User continues typing @someone
    When I type the squeek "@nimo"
    Then I should see "@TheRealNimoy" within the username dropdown field
    And I should not see "@CanadianImage" within the username dropdown field
