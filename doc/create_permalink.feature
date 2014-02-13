Feature: Permalink
	In order to see the URL in human-readable keywords
	As a user
	I want see the correct URL for the page and post that I am viewing

Scenario: User "millerkatiej" logins in
	Given I have entered my username and password correctly
	When I press "login"
	Then I am redirected to my user homepage
	Then the URL will display as "http://squaker.com/millerkatiej" 