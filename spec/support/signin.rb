def signin_as user
  visit new_user_session_path
  fill_in "Email / Username", with: user.username
  fill_in "Password", with: "password"
  click_button "Sign in"
  page.should have_content("Signed in successfully")
end
