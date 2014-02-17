Feature: User edits profile
  As a user
  In order to correct outdated information
  I want to update my profile

  Scenario: Editing my profile
    Given I'm signed in as joe
    When I follow "My Profile"
    And I click "Edit"
    And I fill in "Here's to serendipity!" for "Tagline"
    And I fill in "password" for "Current password"
    And I press "Save Changes"
    Then I should be on my profile page
    And I should see "Your profile has been updated"
    And I should see "Here's to serendipity!"

  Scenario: Changing my email/password
    Given I'm signed in as joe
    When I follow "My Profile"
    And I click "Edit"
    And I fill in "newemail@example.com" for "Email"
    And I fill in "newpassword" for "Password"
    And I fill in "newpassword" for "Password Confirmation"
    And I fill in "password" for "Current password"
    And I press "Save Changes"
    Then I should be on my profile page
    And I should see "Your profile has been updated"
    When I click "Sign Out"
    And I follow "Sign In"
    And I fill in "joe" for "Email / Username"
    And I fill in "newpassword" for "Password"
    And I press "Sign in"
    Then I should see "Signed in successfully."
    When I click "Sign Out"
    And I follow "Sign In"
    And I fill in "newemail@example.com" for "Email / Username"
    And I fill in "newpassword" for "Password"
    And I press "Sign in"
    Then I should see "Signed in successfully."

  Scenario: Changing my profile requires password
    Given I'm signed in as joe
    When I follow "My Profile"
    And I click "Edit"
    And I fill in "Here's to serendipity!" for "Tagline"
    And I press "Save Changes"
    Then I should see "Current password can't be blank"
