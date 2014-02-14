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
  Squeek.create!(body: "This is some sample text.", user: user)
end

Then(/^the squeek should be labeled "(.*?)"$/) do |city|
  within(".location")
    page.should have_content(city)
end

Then(/^the squeek model's location field should be "(.*?)"$/) do |location_string|
  Squeek.first.location.should == location_string
end
