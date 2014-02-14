# Feature: Add Friend
#   As a user
#   I want to be able to add a friend

#   -Standard can only add one friend at a time
#   -Standard email is sent when Add Friend is clicked
#   -Confirmation of acceptance is sent via. email


# Scenario: User clicks Add Friend Button
#  Given the following user: 
#  | username   |     joe         |
#  | email      | joe@example.com |

#  When I go to "sally's" page
#  Then I should see an "Add Friend" button
#  When I click the "Add Friend" button
#  Then "sally@example.com" should recieve an email
#  And when "sally" opens the email
#  Then "sally" should see "You have a new freind request from @joe"
#  When "sally" clicks "View joes page"
#  Then "sally" should see "joe's" page
#  When "sally" clicks the "Add Friend" button on "joe's" page
#  Then "joe" and "sally" are now "Friends"
