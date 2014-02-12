Given(/^the user "(.*?)"\/"(.*?)" with "(.*?)"$/) do |username, email, password|
  User.create(username: username, email: email, password: password, password_confirmation: password)
end

Given(/^I'm signed in as "(.*?)"$/) do |username|
  email = "#{username}@#{username}.org"
  User.create(username: username, email: email, password: "password", password_confirmation: "password")
  visit new_user_session_path
  fill_in "Email / Username", with: email
  fill_in "Password", with: "password"
  click_button "Sign in"
  page.should have_content("Signed in successfully")
end
