And("show me the page") do
  save_and_open_page
end

When(/^I (?:click|follow) "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I press "(.*?)"$/) do |text|
  click_button(text)
end

When(/^I press the first "(.*?)"$/) do |text|
  first(:button, text).click
end

Then(/^I should see(?::)? "(.*)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see(?::)? "([^"]*)"$/) do |text|
  page.should_not have_content(text)
end

Then(/^I should see an "(.*?)" button$/) do |button_text|
  page.should have_selector("input[value='#{button_text}']")
end

Then(/^I should not see an "(.*?)" button$/) do |button_text|
  page.should_not have_selector("input[value='#{button_text}']")
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |content, field|
  fill_in(field, with: content)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, content|
  fill_in(field, with: content)
end

Then(/^"(.*?)" should be filled in with "(.*?)"$/) do |field_name, text|
  page.should have_field(field_name, with: text)
end

When (/^I upload a file "(.*?)"$/) do |file|
  attach_file("squeek_image", File.join(Rails.root, "/features/support/files/#{file}"))
end

When (/^I upload a file with an invalid extension$/) do
  attach_file(:image_url, '../support/files/cat.txt')
end
