Feature: User profiles
  As a user
  In order to cement my identity
  I want to have a profile page

  Scenario: Profiles are linked to from squeeks
    Given the following user:
      | username | jane |
    And that user has 1 squeek
    And I'm signed in as joe
    And I have 1 squeek
    When I go to the homepage
    And I click "joe"
    Then I should be on my profile page
    And I should see "@joe's profile"
    When I go to the homepage
    And I click "jane"
    Then I should be on jane's profile page
    And I should see "@jane's profile"

  Scenario: Viewing my profile
    Given 1 user
    And that user has the following squeek:
      | body | Susie rocks |
    And I'm signed in as joe
    And that user has the following squeeks:
      | body            |
      | I'm awesome     |
      | So, so awesome! |
    When I follow "My Profile"
    Then I should see "@joe's profile"
    And I should see my gravatar image
    And I should see "I'm awesome"
    And I should see "So, so awesome!"
    And I should not see "Susie rocks"

  Scenario: Editing my profile
    When I follow "My Profile"
    And I click "Edit"
    And I fill in "Here's to serendipity!" for "Bio"
    And I click "Save"
    Then I should be on my profile page
    And I should see "Your profile has been updated"
    And I should see "Here's to serendipity!"
