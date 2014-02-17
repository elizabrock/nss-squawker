When /^I key in "(.*?)" with "(.*?)"$/ do |field, content|
  content.each_char do |char|
    find_field(field).native.send_keys(char)
  end
end

Then /^I should see "(.*?)" filled in with "(.*?)"$/ do |field_name, text|
  page.should have_field(field_name, with: text)
end

When /^I click the text link "(.*?)"$/ do |text|
  find('a', :text => text).click
  # click_link(link) requires an href,
  # while this simply searches for an <a> tag by text.
end
