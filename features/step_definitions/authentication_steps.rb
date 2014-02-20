Given(/^I have signed up as "(.*?)"$/) do |name|
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

Given(/^I'm signed in as "?(.*?)"?$/) do |username|
  @user = User.where(username: username).first || Fabricate(:user, username: username)
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
