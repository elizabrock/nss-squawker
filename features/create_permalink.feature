Feature: Permalink
	In order to see the URL in human-readable keywords
	As a user
	I want see the correct URL for the page and post that I am viewing

Background:
	Given a user named "millerkatiej" signs up

Scenario: User "millerkatiej" visits their profile page
	Given I am on the homepage
	When I press "My Profile" link
	And I am redirected to my profile page
	Then the URL will display as "/users/millerkatiej" 