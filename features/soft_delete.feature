Feature: Delete a squeek
  As a person who likes to drink ’n’ squeek,
  I want to delete one of my squeeks so it no longer appears in feeds
  in order to protect my dignity

  Scenario: Deleting unwanted squeek from my feed
    Given I'm signed in as "jane"
    When I go to the homepage
    And I fill in "Squeek here" with "Big pile of sticks!"
    And I press "Squawk"
    Then I should see "Your squeek has been posted"
    And I should see "Big pile of sticks!"
    And I press "Delete"
    Then I should see "Your squeek has been deleted"
    Then I should not see "Big pile of sticks!"

  Scenario: Deleting unwanted squeek also removies it from everyone else's feed
    Given I'm signed in as "jane"
    When I go to the homepage
    And I fill in "Squeek here" with "You're not my son, Lando."
    And I press "Squawk"
    And I press "Delete"
    And I follow "Sign Out"
    When I'm signed in as "joe"
    Then I should not see "You're not my son, Lando."

  Scenario: Deleting correct squeek and not deleting others
    Given I'm signed in as "jane"
    When I go to the homepage
    And I fill in "Squeek here" with "Big pile of sticks!"
    And I press "Squawk"
    Then I should see "Your squeek has been posted"
    Then I fill in "Squeek here" with "Orange you glad I didn't say banana?"
    And I press "Squawk"
    Then I should see "Your squeek has been posted"
    And I should see "Big pile of sticks!"
    And I should see "Orange you glad I didn't say banana?"
    And I press the first "Delete"
    Then I should see "Your squeek has been deleted"
    Then I should not see "Big pile of sticks!"
    And I should see "Orange you glad I didn't say banana?"

  Scenario: Delete button not present for someone else's squeek
    Given I'm signed in as "jane"
    When I go to the homepage
    And I fill in "Squeek here" with "The dog said 'Man, that's my shoe"    
    And I press "Squawk"
    And I follow "Sign Out"
    When I'm signed in as "joe"
    Then I should see "The dog said 'Man, that's my shoe"
    And I should not see "Delete"
