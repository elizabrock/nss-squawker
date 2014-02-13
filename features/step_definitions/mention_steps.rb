Then(/^I should be on joe's profile page$/) do
  user = User.where(username: "joe").first
  current_path.should == user_path(user)
end