Feature: Geocode a Squeek
  As a user
  I want to see where a squeek was created

  Background:
    Given I'm signed in as "joe"

  Scenario:
    Given I am at IP address "50.197.247.249"
    And I post a squeek
    When I go to the homepage
    Then the squeek should be labeled "Nashville, Tennessee"
    And the squeek's location should be recorded as "Nashville, Tennessee"

  Scenario:
    Given I am at IP address "160.36.179.25"
    And I post a squeek
    When I go to the homepage
    Then the squeek should be labeled "Knoxville, Tennessee"
    And the squeek's location should be recorded as "Knoxville, Tennessee"

  Scenario:
    Given I am at IP address "0.0.0.0"
    And I post a squeek
    When I go to the homepage
    Then the squeek should be labeled "Unknown Location"
    And the squeek's location should be recorded as "Unknown Location"
