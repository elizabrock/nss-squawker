Feature: Geocode a Squeek
  As a user
  I want to see where a squeek was created

Scenario:
  Given the squeek with an IP address in Nashville, TN, 50.197.247.249
  Then the squeek should be labeled "Nashville, TN"
