Given(/^I login as an admin$/) do
  AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
  visit "/admin"
  
  click_button "Sign in"
end