Then(/^I should see a "(.*?)" with label "(.*?)" within the new squeek form$/) do |input_type, text|
  page.should have_selector("input[type='#{input_type}']")
  page.should have_selector("label", text)  
end

When(/^I press the checkbox within the new squeek form$/) do
  find(:css, "#squeek_friends_only").set(true)
end

