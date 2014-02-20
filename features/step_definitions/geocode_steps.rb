Given(/^I am at IP address "(.*?)"$/) do |ip_address|
  ENV['IP'] = ip_address
end

Then(/^the squeek's location should be recorded as "(.*?)"$/) do |location_string|
  Squeek.last.location.should == location_string
end

