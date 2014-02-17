Feature: Permalink
	In order to see the URL in human-readable keywords
	As a user
	I want see the correct URL for the page and post that I am viewing


Scenario: User "millerkatiej" visits their profile page
	Given a user named "millerkatiej" signs up
	When I click "My Profile"
	Then the URL will display as "/users/1-millerkatiej" 