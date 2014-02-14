Feature: Permalink
  In order to see the URL in human-readable keywords
  As a user
  I want see the correct URL for the page and post that I am viewing

Background:
  Given a user named "arielle919" signs up

Scenario: User "arielle919" visits their profile page
  Given I am on the homepage
  When I press "My Profile" link
  And I am redirected to my profile page at "/users/arielle919"
  Then the URL will display as "/users/arielle919"