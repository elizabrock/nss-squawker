Feature: Upload Image to Squeek
  In order to share images with friends
  As an internet heathern
  I want to upload images to my squeeks

  Scenario: Uploading a file with .jpeg or .png extensions Succeeds
    Given I'm signed in as "rachel"
    When I go to the homepage
    Then I should see "Squeek here"
    When I fill in "Squeek here" with "Look at my cute cat!"
    And I upload a file "cat.png"
    And I press "Squawk"
    Then I should see: "Your squeek has been posted"
    And I should see the image "cat.png" within the squeeks feed

  Scenario: Uploading a file without .jpeg or .png extensions fails
    Given I'm signed in as "rachel"
    When I go to the homepage
    Then I should see "Squeek here"
    When I fill in "Squeek here" with "Look at my cute cat!"
    And I upload a file "cat.txt"
    And I press "Squawk"
    Then I should see: "You are not allowed to upload "txt" files, allowed types: jpg, jpeg, png"
