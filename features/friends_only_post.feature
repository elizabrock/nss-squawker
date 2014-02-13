Feature: Create friends-only post
  As a user
  In order to keep certain posts private
  I want to create a post that only my friends can see

  Scenario: User creates friends-only squeek
    Given the following user:
    | username   |     Bill         |
    | email      | bill@example.com |
    And "joe" is my friend
    And "sally" is not my friend

    When I go to the homepage
    Then I should see a dropdown menu within the new squeek form
    When I fill in 'Squeek here' with 'This is for friends only.'
    And I select 'Friends only' from the dropdown menu in the squeek form
    And I press 'Squawk'
    Then I should see: "Your squeek has been posted"
    When I'm signed in as "joe"
    Then I should see "@bill: This is for friends only." within the squeeks feed
    When I'm signed in as "sally"
    Then I should not see "@bill: This is for friends only." within the squeeks feed
    
