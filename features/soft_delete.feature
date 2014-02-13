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
    And I click "Delete"
    Then I should see "Delete this squeek?"
    And I click "Yes"
    Then I should see "Your squeek has been deleted"
    Then I should not see "Big pile of sticks!"

  Scenario: Deleting unwanted squeek from everyone else's feed
    Given I'm signed in as "jane"
    When I go to the homepage
    And I fill in "Squeek here" with "You're not my son, Lando."
    And I press "Squawk"
    And I click "Delete"
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
    And I click "Delete" next to "Big pile of sticks!"
    Then I should see "Delete this squeek?"
    And I click "Yes"
    Then I should see "Your squeek has been deleted"
    Then I should not see "Big pile of sticks!"
    And I should see "Orange you glad I didn't say banana?"

  Scenario: Delete button not present for someone else's squeek
    Given I'm signed in as "jane"
    When I go to the homepage
    And I fill in "Squeek here" with "The dog said 'Man, that's my shoe"    
    And I press "Squawk"
    When I'm signed in as "joe"
    Then I should see "The dog said 'Man, that's my shoe"
    And I should not see "Delete"
 
Feature: Admin user can see deleted squeeks
  As an admin
  In order to audit accounts to address complaints
  I want to see all squeeks including deleted ones

  Scenario: Admin user can view deleted squeeks
    Given I'm signed in as "jane"
    When I go to the homepage
    And I fill in "Squeek here" with "She dropped him off at band practice."
    And I press "Squawk"
    And I click "Delete"
    When I'm signed in as "admin"
    Then I should see "She dropped him off at band practice."
