Given(/^I'm signed in as "(.*?)"$/) do |username|
  Fabricate(:user, username: username)
  visit new_user_session_path
  fill_in "Email / Username", with: username
  fill_in "Password", with: "password"
  click_button "Sign in"
  page.should have_content("Signed in successfully")
end

#OmniAuth through Twitter
