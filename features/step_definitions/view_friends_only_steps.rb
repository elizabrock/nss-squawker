Given(/^a user named "(.*?)"$/) do |name|
  Fabricate(:user, username: name)
end

Given(/^"(.*?)" is friends with "(.*?)"$/) do |name1, name2|
  broadcaster = User.find_by(username: name1)
  consumer = User.find_by(username: name2)
  Fabricate(:relationship, broadcaster: broadcaster, consumer: consumer)
end

Given(/^a friends\-only squeek with content "(.*?)" created by "(.*?)"$/) do |squeek, name|
  user = User.find_by(username: name)
  Squeek.create!(body: squeek, user: user, friends_only: true)
end


Given(/^I am logged in as "(.*?)"$/) do |username|
  visit new_user_session_path
  fill_in "Email / Username", with: username
  fill_in "Password", with: "password"
  click_button "Sign in"
  page.should have_content("Signed in successfully")
end

Then(/^I should not see "(.*?)" within the squeeks feed$/) do |text|
  within(".squeeks") do
    page.should_not have_content(text)
  end
end
