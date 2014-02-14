Feature: Viewing a friends-only post
  As a user
  I want to view global and friends-only posts
  And I don't want to see friends-only posts from users who are not my friends

  Background:
    Given a user named "bill"
    And a user named "joe"
    And a user named "sally"
    And "bill" is friends with "joe"
    And a friends-only squeek with content 'This is for friends only.' created by "bill"

  Scenario: A friend viewing the post
    Given I am logged in as "joe"
    When I go to the homepage
    Then I should see "@bill: This is for friends only." within the squeeks feed

  Scenario: A user who is not a friend viewing the post
    Given I am logged in as "sally"
    When I go to the homepage
    Then I should not see "@bill: This is for friends only." within the squeeks feed

  Scenario: An anonymous user should not she the friends-only squeek
    Given I am not currently logged in
    When I go to the homepage
    Then I should not see "@bill: This is for friends only." within the squeeks feed