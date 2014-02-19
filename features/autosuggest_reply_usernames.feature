
@javascript
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
    When I key in "Squeek here" with "@nim"
    Then I should see "TheRealNimoy"
    And I should see "CanadianImage"
    And I should not see "LilNemo"

  Scenario: User continues typing someone
    When I key in "Squeek here" with "@nimo"
    Then I should see "TheRealNimoy"
    And I should not see "CanadianImage"

  Scenario: User selects someone
    When I key in "Squeek here" with "@nimoy"
    When I click the text link "TheRealNimoy"
    Then "Squeek here" should be filled in with "@TheRealNimoy "
