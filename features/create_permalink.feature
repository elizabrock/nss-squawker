Feature: Permalink
  In order to see the URL in human-readable keywords
  As a user
  I want see the correct URL for the page and post that I am viewing

Scenario: User "arielle919" visits their profile page
  Given I have signed up as "arielle919"
  When I click "My Profile"
  Then the URL will display as "/users/arielle919"
