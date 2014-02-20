Feature: @Mention sends email notification
  As a user
  I want to mention another user in a squeek
  Generating the following:
  - A link to that user's profile within the squeek
  - An email notification sent to that user
    Containing my username, the squeek, and the squeek createdAt timestamp

  Scenario: User submits squeek containing an @ symbol next to a user's name
    Given the following user:
      | username | joe |
      | email    | joe@example.com |
    And I'm signed in as jane
    When I go to the homepage
    And I fill in "Squeek here" with "I can't stand @joe"
    And I press "Squawk"
    Then I should see: "Your squeek has been posted"
    And there should be a squeek "I can't stand @joe" that links to the mentioned user's profile in the database
    And I should see "@jane: I can't stand @joe" within the squeeks feed
    When I click "@joe"
    Then I should be on joe's profile page

  Scenario: Users should be notified by email when they are mentioned in a squeek
    Given the following user:
      | username | joe |
      | email    | joe@example.com |
    And I'm signed in as "jane"
    When I go to the homepage
    And I fill in "Squeek here" with "I can't stand @joe"
    And I press "Squawk"
    Then "joe@example.com" should have an email
    And they open the email with subject "Someone has mentioned you in a squeek!"
    Then they should see "@jane" in the email body
    And they should see "mentioned you in a squeek!" in the email body
    And they should see "I can't stand" in the email body
    And they should see "@joe" in the email body
