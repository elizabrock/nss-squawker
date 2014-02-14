  @focus
  Feature: Geocode a Squeek
  As a user
  I want to see where a squeek was created

Background:
  Given a user with username "@SampleUser" exists

Scenario:
  Given the squeek with an IP address "50.197.247.249"
  When I go to the homepage
  Then the squeek should be labeled "Nashville, Tennessee"
  And the squeek model's location field should be "Nashville, Tennessee"

Scenario:
  Given the squeek with an IP address "160.36.179.25"
  When I go to the homepage
  Then the squeek should be labeled "Knoxville, Tennessee"
  And the squeek model's location field should be "Knoxville, Tennessee"

Scenario:
  Given the squeek with an IP address "0.0.0.0"
  When I go to the homepage
  Then the squeek should be labeled "Unknown Location"
  And the squeek model's location field should be "Unknown Location"


# Given a user exists