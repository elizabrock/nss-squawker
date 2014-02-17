Then(/^I should see a "(.*?)" with label "(.*?)" within the new squeek form$/) do |input_type, text|
  within(".new_squeek") do
    page.should have_selector("input[type='#{input_type}']")
    page.should have_selector("label", text)  
  end
end

When(/^I press the checkbox within the new squeek form$/) do
  page.check('squeek_consumer_only')
end

