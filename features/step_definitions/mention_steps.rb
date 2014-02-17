Then(/^there should be a squeek "(.*?)" that links to the mentioned user's profile in the database$/) do |text|
  reg = /(?:@\w+)/
  mention = text.scan(reg).uniq[0]
  if mention
    mention[0] = ''
    user = User.find_by_username(mention)
    new_string = "<a href='#{user_path(user)}'>@#{mention}</a>"
    text = text.gsub("@#{mention}",new_string)
  end
  squeek_count = Squeek.where(body: text).count
  squeek_count.should == 1
end