Then(/^the squeek should contain "(.*?)" in the database$/) do |text|
  squeek_count = Squeek.where(body: text).count
  squeek_count.should == 1
end

When(/^I press "(.*?)" within the squeeks feed$/) do |link|
  click_link(link)
end

Then(/^I should be on joe's profile page$/) do
  user = User.where(username: "joe").first
  current_path.should == user_path(user)
end