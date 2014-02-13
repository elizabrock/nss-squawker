@wip
Feature: Automatically suggesting usernames
  As a squawker with connections
  In order to easily type the usernames of those who I'm connected with
  I want to get username suggestions as type them

  Scenario: User starts typing @someone
    Given the squeek "leo"
    Then I should see "Leonard Nimoy" within the username dropdown field
    And I should see "Leonardo da Vinci" within the username dropdown field
    And I should see "Leo" within the username dropdown field
    When I follow "Leonard Nimoy"
    Then I should see "Leonard Nimoy" within the squeek.
    
  Scenario: Suggestions narrowed down when adding new characters
    Given the squeek "d"
    Then I should see "David" within the username dropdown field
    And I should see "Dean" within the username dropdown field
    And I should see "Daniel" within the username dropdown field
    When I add a character to the squeek so it reads "da"
    Then I should see "David" within the username dropdown field
    And I should see "Daniel" within the username dropdown field
    When I add a character to the squeek so it reads "dav"
    Then I should see "David" within the username dropdown field
    

