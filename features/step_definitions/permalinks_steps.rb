Given(/^a user named "(.*?)" signs up$/) do |name|
  steps %Q{
    When I go to the homepage
    And I follow "Sign Up"
    And I fill in "#{name}" for "Username"
    And I fill in "arielle919@gmail.com" for "Email"
    And I fill in "password" for "user_password"
    And I fill in "password" for "Password confirmation"
    And I press "Sign up"
    And I go to the homepage
  }
end

Then(/^the URL will display as "(.*?)"$/) do |prettyurl|
  current_path.should == prettyurl
end
