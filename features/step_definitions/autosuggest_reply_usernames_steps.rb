When /^I key in "(.*?)" with "(.*?)"$/ do |field, content|
  content.each_char do |char|
    find_field(field).native.send_keys(char)
  end
end

When /^I click the link "(.*?)"$/ do |text|
  # click_link(link) requires an href,
  # while this simply searches for an <a> tag by text.
  find('a', :text => text).click
end
