When(/^I click "(.*?)" within the squeeks feed$/) do |link|
  click_link(link)
end

Then(/^I should be on joe's profile page$/) do
  user = User.where(username: "joe").first
  current_path.should == user_path(user)
end