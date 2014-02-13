Feature: Upload Image to Squeek
  In order to share images with friends
  As an internet heathern
  I want to upload images to my squeeks

  Scenario: Not logged in
    When I go to the homepage
    Then I should not see "Select Photo"

  Scenario: Logged in users should see select photo button
    Given I'm signed in as "rachel"
    Then I should see "Select photo"

  Scenario: Logged in users should see upload photo button
    Given I'm signed in as "rachel"
    Then I should see "Upload"

  Scenario: Trying to upload nothing fails
    Given I'm signed in as "rachel"
    When I go to the homepage
    When I press "Upload"
    Then I should see: "Please choose an image"

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

  Scenario: Uploading a file without .jpeg or .png extensions fails
    Given I'm signed in as "rachel"
    When I go to the homepage
    Then I should see "Squeek here"
    When I fill in "Squeek here" with "Look at my cute cat!"
    And I choose a file "cat.txt"
    And I press "Upload"
    Then I should see: "Please choose a JPEG or PNG file"