# @wip
Feature: @Mention sends email notification
  As a user
  I want to mention another user in a squeek
  Generating the following:
  - A link to that user's profile within the squeek
  - An email notification sent to that user
    Containing my username, the squeek, and the squeek createdAt timestamp

  Scenario: User submits squeek containing an @ symbol next to a user's name
    Given I'm signed in as "jane"
    When I go to the homepage
    And I fill in squeek_body with "I can't stand @joe@example.com"
    And I press "Squawk"
    Then I should see: "Your squeek has been posted"
    And the squeek should contain "I can't stand <a href='#'>@joe@example.com</a>" in the database
    And I should see "I can't stand <a href='#'>@joe@example.com</a>" within the squeeks feed

  Scenario: Users should be notified by email when they are mentioned in a squeek
    Given I'm signed in as "jane"
    When I go to the homepage
    And I fill in squeek_body with "I can't stand @joe@example.com"
    And I press "Squawk"
    Then they should receive an email with subject "Someone has mentioned you in a squeek!"
    And they open the email with subject "Someone has mentioned you in a squeek!"
    Then they should see "@jane@example.com mentioned you in a squeek!" in the email body
    Then they should see "I can't stand @joe@example.com" in the email body

  Scenario: User clicks on mentioned username within squeek
    When I go to the homepage
    And I press "@joe@example.com" within the squeeks feed
    Then I should see: "Profile"
    And I should see: "joe@example.com"