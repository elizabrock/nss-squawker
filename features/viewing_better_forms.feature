# Feature: Viewing sign-up, sign-in, and Forgot your password forms
#   In order for the login to be more intuitive
#   As a user
#   I want to see the sign-up / sign-in / reset password forms when I click the corresponding link



#   Scenario: User clicks Sign Up
#     When I go to the homepage
#     And I follow "Sign Up"
#     Then I should see a Sign Up form
#     And I should see a form header called "Sign Up"
#     And I should see a label "Username"
#     And I should see an email field :username
#     And I should see a label "Email"
#     And I should see an email field :email
#     And I should see a label "Password"
#     And I should see an password field :password
#     And I should see a label "Password confirmation"
#     And I should see an password field :password_confirmation
#     And I should see an submit button "Sign up"
#     And I should see a link to "Sign in"

#   Scenario: User clicks Sign In
#     When I go to the homepage
#     And I follow "Sign In"
#     Then I should see a Sign In form
#     And I should see a form header called "Sign in"
#     And I should see a label "Email / Username"
#     And I should see an email field :email
#     And I should see a label "Password"
#     And I should see a password field :password
#     And I should see a checkbox :remember_me
#     And I should see a label "Remember me"
#     And I should see a submit button "Sign in"
#     And I should see a link to "Sign up"
#     And I should see a link to "Forgot your password"

#   Scenario: User clicks Forgot your password
#     When I go to the sign in page
#     And I follow "Forgot your password"
#     Then I should see a form header called "Forgot your password?"
#     And I should see a label "Email"
#     And I should see an email field :email
#     And I should see a submit button "Send me reset password instructions"