Feature: @Mention sends email notification
  As a user
  I want to mention another user in a squeek
  Generating the following:
  - A link to that user's profile within the squeek
  - An email notification sent to that user
    Containing my username, the squeek, and the squeek createdAt timestamp

  Scenario: User submits squeek containing an @ symbol next to a user's name
    When I fill in "Squeek here" with "I can't stand @joe@example.com"
    And I press "Squawk"
    Then I should see: "Your squeek has been posted"
    And the squeek should contain "I can't stand <a href='#'>@joe@example.com</a>" in the database
    And I should see "I can't stand <a href='#'>@joe@example.com</a>" within the squeeks feed

  Scenario: Users should be notified by email when they are mentioned in a squeek
    Given:
    And an email should be automatically sent to "@joe@example.com" informing the user of the mention

  Scenario: User clicks on mentioned username within squeek
    When I go to the homepage
    And I follow "@joe@example.com" within the most recent squeek
    Then I should be taken to "@joe's" profile page
