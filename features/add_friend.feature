Feature: Add Friend
  As a user
  I want to be able to add a friend

  -Standard can only add one friend at a time
  -Standard email is sent when Add Friend is clicked
  -Confirmation of acceptance is sent via. email

Background: 
	Given a user named "joe"
	And a user named "sally"

Scenario: User clicks Add Friend Button
 Given I am logged in as "joe"
 When I go to "sally's" profile
 And I click the "Add Friend" button on her page
 Then I should see "Your friend request has been sent"

Scenario: Recieve Accepted Friend Request
	Given I am logged in as "joe"
	When "sally" accepts my friend request
	Then I should see "@sally accepted your friend request"


