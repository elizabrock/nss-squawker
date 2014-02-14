Given(/^I'm signed in as "?(.*?)"?$/) do |username|
  @user = Fabricate(:user, username: username)
  visit new_user_session_path
  fill_in "Email / Username", with: username
  fill_in "Password", with: "password"
  click_button "Sign in"
  page.should have_content("Signed in successfully")
end

Then(/^I should see my gravatar image$/) do
  gravatar_id = Digest::MD5.hexdigest(@user.email.downcase)
  page.should have_css("img[src='https://secure.gravatar.com/avatar/#{gravatar_id}.png?r=PG']")
end
