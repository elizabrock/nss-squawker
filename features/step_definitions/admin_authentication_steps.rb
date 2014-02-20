Given(/^an admin exists with email "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
end
