Feature: view friends post only
	As a user 
	I want to only see post by my friends
	
	-Standard email/password signup without email confirmation
	-Standard password reset via. email
	-Standard login/logout
	-Standard add friends 

	Background:
		Given the following user:
			| username | billy	|
			| friends  | joe    |

	Scenario: Confirm user only sees post by friends
		Given I have friends
		And 'joe' is my friend 
		And 'sally' is not
		And the squeek "Hey man" by "joe"
		And the squeek "You are lame.." by "sally"
		When I go to the homepage
		Then I should only see "@joe: Hey man" within the squeeks feed
		And I should not see "@sally: You are lame.." within the squeeks feed
