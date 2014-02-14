Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I press "(.*?)" link$/) do |arg1|
  click_link('My Profile')
end

When(/^I am redirected to my profile page$/) do
	visit('/users/millerkatiej')
end

Then(/^the URL will display as "(.*?)"$/) do |arg1|
page.has_xpath?('/users/millerkatiej')
end

