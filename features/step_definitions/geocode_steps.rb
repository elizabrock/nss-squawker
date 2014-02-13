Given(/^a user with username "(.*?)"$/) do |username|
  user = Fabricate(:user, username: username)
end

Given(/^the squeek with an IP address in Nashville, TN, "(.*?)"$/) do |ip|
  user = Fabricate(:user, username: "@SampleUser")
  Squeek.create!(body: "This is some sample text.", user: user, ip_address: ip)
end

Then(/^the squeek should be labeled "(.*?)"$/) do |city|
  within(".location")
    page.should have_content(city)
end

Then(/^the squeek model's location field should be "(.*?)"$/) do |arg1|
  Squeek.where(body: "This is some sample text.").location.should == arg1
end

Given(/^the squeek with an IP address in Knoxville, TN, "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the squeek's model's location field should be "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the geocoding feature is unable to find a location from an IP address$/) do
  pending # express the regexp above with the code you wish you had
end
