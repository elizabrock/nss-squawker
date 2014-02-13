@wip
Feature: Automatically suggesting usernames
  As a squawker with connections
  In order to easily type the usernames of those who I'm connected with
  I want to get username suggestions as type them

  Scenario: User starts typing @someone
    Given the squeek "@leo"
    Then I should see "Leonard Nimoy @TheRealNimoy" within the username dropdown field
    And I should see "Leonardo da Vinci @daVinciSecrets" within the username dropdown field
    And I should see "David @leo" within the username dropdown field
    When I follow "Leonard Nimoy @TheRealNimoy"
    Then I should see "@TheRealNimoy" within the squeek.

