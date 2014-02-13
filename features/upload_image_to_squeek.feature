Feature: Upload Image to Squeek
  In order to share images with friends
  As an internet heathern
  I want to upload images to my squeeks

  Scenario: Uploading a file with .jpeg or .png extensions Succeeds
    Given I'm signed in as "rachel"
    When I go to the homepage
    Then I should see "Squeek here"
    When I fill in "Squeek here" with "Look at my cute cat!"
    And I choose a file "cat.png"
    And I press "Upload"
    And I press "Squawk"
    Then I should see: "Your squeek has been posted"
    And there should be an image "cat.png" in the database
    And I should see "cat.png" within the squeeks feed
    And "cat.png" should have a width "500px"

  Scenario: Uploading a file without .jpeg or .png extensions fails
    Given I'm signed in as "rachel"
    When I go to the homepage
    Then I should see "Squeek here"
    When I fill in "Squeek here" with "Look at my cute cat!"
    And I choose a file "cat.txt"
    And I press "Upload"
    Then I should see: "Please choose a JPEG or PNG file"