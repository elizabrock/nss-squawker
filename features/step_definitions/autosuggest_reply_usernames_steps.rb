
Then(/^I should see(?::)? "(.*?)" filled in "(.*?)"$/) do |text, field_name|
  page.should have_field(field_name, with: text)
end

Then(/^I should not see(?::)? "(.*?)" filled in "(.*?)"$/) do |text, field_name|
  page.should_not have_field(field_name, with: text)
end