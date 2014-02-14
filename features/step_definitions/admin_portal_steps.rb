Then(/^I go to admin section for "(.*?)"$/) do |section|
  visit "/admin/#{section}"
end