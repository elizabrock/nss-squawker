Then(/^the URL will display as "(.*?)"$/) do |prettyurl|
  current_path.should == prettyurl
end
