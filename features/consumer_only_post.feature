Feature: Create consumer-only post
  As a user
  In order to keep certain posts private
  I want to create a post that only my consumer can see

  Scenario: User creates a consumer-only squeek
    Given I'm signed in as "bill"
    When I go to the homepage
    And I fill in "Squeek here" with "This is for consumer only."
    And I check "Consumers only?"
    And I press "Squawk"
    Then I should see: "Your squeek has been posted"
