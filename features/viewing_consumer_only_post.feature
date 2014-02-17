Feature: Viewing a consumer-only post
  As a user
  I want to view global and consumer-only posts
  And I don't want to see consumer-only posts from users who are not my consumer

  Background:
    Given a user named "bill" is created
    Given a consumer-only squeek with content "This is for consumer only." created by "bill"

  Scenario: A consumer viewing the post
    Given I'm signed in as "joe"
    And "bill" is broadcasting to "joe"
    When I go to the homepage
    Then I should see "@bill: This is for consumer only." within the squeeks feed

  Scenario: A user who is not a consumer viewing the post
    Given I'm signed in as "sally"
    When I go to the homepage
    Then I should not see "@bill: This is for consumer only." within the squeeks feed

  Scenario: An anonymous user should not see the consumer-only squeek
    When I go to the homepage
    Then I should not see "@bill: This is for consumer only." within the squeeks feed

  Scenario: A consumer viewing the post on bill's user page
    Given I'm signed in as "joe"
    And "bill" is broadcasting to "joe"
    When I go to the user page of "bill"
    Then I should see "@bill: This is for consumer only." within the squeeks feed

  Scenario: A user who is not a consumer viewing the post
    Given I'm signed in as "sally"
    When I go to the user page of "bill"
    Then I should not see "@bill: This is for consumer only." within the squeeks feed

  Scenario: An anonymous user should not see the consumer-only squeek
    When I go to the user page of "bill"
    Then I should not see "@bill: This is for consumer only." within the squeeks feed