Feature: Create friends-only post
  As a user
  In order to keep certain posts private
  I want to create a post that only my friends can see

  Background:
    Given a user named "bill"

  Scenario: User has ability to make a friends only post
    Given I am logged in as "bill"
    When I go to the homepage
    Then I should see a dropdown menu within the new squeek form
    And I should see the 'Friends only' option in the dropdown menu

  Scenario: User creates a friends-only squeek
    Given I am logged in as "bill"
    When I go to the homepage
    And I fill in 'Squeek here' with 'This is for friends only.'
    And I select 'Friends only' from the dropdown menu in the squeek form
    And I press 'Squawk'
    Then I should see: "Your squeek has been posted"