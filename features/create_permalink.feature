Feature: Permalink
	In order to see the URL in human-readable keywords
	As a user
	I want see the correct URL for the page and post that I am viewing

Background:
	When I go to the homepage
  And I follow "Sign Up"
  And I fill in "millerkatiej" for "Username"
  And I fill in "millerkatiej@gmail.com" for "Email"
  And I fill in "password" for "user_password"
  And I fill in "password" for "Password confirmation"
  And I press "Sign up"
  Then I should see "Welcome! You have signed up successfully."


Scenario: User "millerkatiej" visits their profile page
	Given I am on the homepage
	When I press "My Profile" link
	And I am redirected to my profile page
	Then the URL will display as "localhost:3000/users/millerkatiej" 