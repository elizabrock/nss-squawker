When /^I key in "(.*?)" with "(.*?)"$/ do |field, content|
  content.each_char do |char|
    find_field(field).native.send_keys(char)
  end
end

When(/^I wait for the request to complete$/) do
  Timeout.timeout(Capybara.default_wait_time) do
    loop do
      active = page.evaluate_script('jQuery.active')
      break if active == 0
    end
  end
end

Then(/^"(.*?)" should be filled in with "(.*?)"$/) do |field_name, text|
  page.should have_field(field_name, with: text)
end

When /^I click the text link "(.*?)"$/ do |text|
  find('a', :text => text).click
  # click_link(link) requires an href,
  # while this simply searches for an <a> tag by text.
end
