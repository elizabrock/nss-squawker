Then(/^I go to the admin section for "(.*?)"$/) do |section|
  visit "/admin/#{section}"
end