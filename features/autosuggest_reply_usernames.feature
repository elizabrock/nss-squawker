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

  Scenario: User starts typing @someone
    When I fill in "Squeek here" with "@nim"
    Then I should see "@TheRealNimoy" within the username dropdown field
    And I should see "@CanadianImage" within the username dropdown field
    And I should not see "@LilNemo" within the username dropdown field

  Scenario: User continues typing @someone
    When I type the squeek "@nimo"
    Then I should see "@TheRealNimoy" within the username dropdown field
    And I should not see "@CanadianImage" within the username dropdown field

  Scenario: User selects @someone
    When I fill in "Squeek here" with "@sa"
    Then I should see "@Sally" within the username dropdown field
    And I should see "@Sarah" within the username dropdown field
    When I choose "@Sally" in the autocomplete list
    Then the "Squeek here" field should contain "@Sally"


