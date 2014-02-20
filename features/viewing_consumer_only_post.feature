Feature: Viewing a consumer-only post
  As a user
  I want to view global and consumer-only posts
  And I don't want to see consumer-only posts from users who are not my consumer

  Background:
    Given the following user:
      | username | bill |
    And that user has the following consumer only squeek:
      | body | This is for consumer only. |

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
    When I go to bill's profile page
    Then I should see "@bill: This is for consumer only." within the squeeks feed

  Scenario: A user who is not a consumer viewing the post
    Given I'm signed in as "sally"
    When I go to bill's profile page
    Then I should not see "@bill: This is for consumer only." within the squeeks feed

  Scenario: An anonymous user should not see the consumer-only squeek
    When I go to bill's profile page
    Then I should not see "@bill: This is for consumer only." within the squeeks feed
