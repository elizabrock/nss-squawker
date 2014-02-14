Given(/^a user with username "(.*?)" exists$/) do |username|
  user = Fabricate(:user, username: username)
end

Given(/^the squeek with an IP address "(.*?)"$/) do |ip|
  user = User.first
  # we don't pass ip_address because ip_address is obtained from rails internally
  # request.remote_ip

  # ** magic here to simulate whatever request.remote_ip = ip
  # then create squeak (which will generate it's own location field)
  ###
  ENV['RAILS_TEST_ADDRESS'] = ip
  ###
  visit root_path
 click_link("Sign In")
 fill_in("Email / Username", :with => user.username)
 fill_in("Password", :with => "password")
click_button("Sign in")
fill_in("Squeek here", :with => "This is some sample text.")
click_button("Squawk")
  # Squeek.create!(body: "This is some sample text.", user: user)
end

Then(/^the squeek should be labeled "(.*?)"$/) do |city|
  within(".location") do
    page.should have_content(city)
  end
end

Then(/^the squeek model's location field should be "(.*?)"$/) do |location_string|
  Squeek.first.location.should == location_string
end
