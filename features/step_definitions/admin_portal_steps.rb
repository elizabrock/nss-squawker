Then(/^there should be no squeeks in the database$/) do
  Squeek.count.should == 0
end

