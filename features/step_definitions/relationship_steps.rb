Then(/^a relationship between "(.*?)" and "(.*?)" should be created in the database$/) do |name1, name2|
  user1 = User.find_by(username: name1)
  user2 = User.find_by(username: name2)
  user1.consumers.should include(user2)
end
