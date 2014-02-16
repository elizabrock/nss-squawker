Given(/^I am at IP address "(.*?)"$/) do |ip_address|
  ENV['IP'] = ip_address
end

Given(/^I post a squeek$/) do
  visit root_path
  fill_in("Squeek here", :with => "This is some sample text.")
  click_button("Squawk")
end

Then(/^the squeek should be labeled "(.*?)"$/) do |city|
  within(".location") do
    page.should have_content(city)
  end
end

Then(/^the squeek model's location field should be "(.*?)"$/) do |location_string|
  Squeek.first.location.should == location_string
end
