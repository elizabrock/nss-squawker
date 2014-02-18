
Then(/^I should see an "(.*?)" button$/) do |button_text|
  page.should have_selector("input[value='#{button_text}']")
end

Then(/^I should not see an "(.*?)" button$/) do |button_text|
  page.should_not have_selector("input[value='#{button_text}']")
end

Then(/^a relationship between "(.*?)" and "(.*?)" should be created in the database$/) do |name1, name2|
  user1 = User.find_by(username: name1)
  user2 = User.find_by(username: name2)
  assert user1.consumers.first == user2
end
