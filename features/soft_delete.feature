Feature: Soft-delete a squeek
  As a person who likes to drink ’n’ squeek,
  I want to delete one of my squeeks so it no longer appears in feeds
  in order to protect my dignity
  But not have it disappear entirely <-- This feels tacked on, but we think something is necessary to differentiate between soft-delete and hard-delete

  Scenario: Deleting unwanted squeek from my feed
    Given I am logged in
    When I click the delete button
    Then I should not see the deleted squeek in the feed

  Scenario: Deleting unwanted squeek from everyone else's feed
    Given I am logged in
    When I click the delete button
    And I log out
    And I log back in as someone else
    Then I should not see the deleted squeek in the feed

  Scenario: Delete button not present for someone else's squeek
    Given I am logged in
    And I see someone else's squeek in my feed
    Then the delete button will not be present

  Scenario: Viewing deleted squeeks 
    Given I am logged in
    When I click the delete button
    And I click the “Show Deleted Squeeks” checkbox
    Then I should see the deleted squeek in the feed

  Scenario: Admin user can view deleted squeeks
    Given I am logged in
    When I click the delete button
    And I log out
    And I log in as an admin
    Then I should see the deleted squeek in the feed





