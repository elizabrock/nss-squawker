@wip
Feature: Auto suggesting usernames
  In the event you forget the full username
  As a user
  I want to start typing a name and get corresponding suggestions.

  Scenario: User starts typing @someone
    Given the squeek "@leo"
    Then I should see "Leonard Nimoy @TheRealNimoy" within the username dropdown field
    And I should see "Leonardo da Vinci @daVinciSecrets" within the username dropdown field
    And I should see "David @leo" within the username dropdown field
    When I follow "Leonard Nimoy @TheRealNimoy"
    Then I should see "@TheRealNimoy" within the squeek.

