Feature: Geocode a Squeek
  As a user
  I want to see where a squeek was created

Background:
  Given a user with username "@SampleUser" exists

Scenario:
  Given the squeek with an IP address "50.197.247.249"
  Then the squeek should be labeled "Nashville, TN"
  And the squeek model's location field should be "Nashville, TN"

Scenario:
  Given the squeek with an IP address "160.36.179.25"
  Then the squeek should be labeled "Knoxville, TN"
  And the squeek's model's location field should be "Knoxville, TN"

Scenario:
  Given the squeek with an IP address "0.0.0.0"
  Then the squeek should be labeled "Unknown Location"
  And the squeek's model's location field should be "Unknown Location"


# Given a user exists