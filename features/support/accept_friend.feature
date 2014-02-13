Feature: Accept Friend Request
  As a user
  I want to be able to accept a friend request

  -Standard email is sent when Add Friend is clicked
  -Confirmation of acceptance is sent via. email

Background: 
	Given a user named "joe"
	And a user named "sally"
	And "joe" has sent a friend request 

Scenario: User Accepts Friend Request
 Given I am logged in as "sally"
 When I view my email 
 Then I should see "Visit @joes profile"
 And when I click "Visit @joes profile"
 Then I should see "joe's" profile
 And when I click "Add friend"
 Then I should see "Friend Request Accepted"

