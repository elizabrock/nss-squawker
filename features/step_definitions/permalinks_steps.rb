Given(/^a user named "(.*?)" signs up$/) do |name|
  steps %Q{
      When I go to the homepage
      And I follow "Sign Up"
      And I fill in "#{name}" for "Username"
      And I fill in "arielle919@gmail.com" for "Email"
      And I fill in "password" for "user_password"
      And I fill in "password" for "Password confirmation"
      And I press "Sign up"
  }
end

Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I press "(.*?)" link$/) do |link|
  click_link(link)
end

When(/^I am redirected to my profile page at "(.*?)"$/) do |userpage|
  visit(userpage)
end

Then(/^the URL will display as "(.*?)"$/) do |prettyurl|
page.has_xpath?(prettyurl)
end

