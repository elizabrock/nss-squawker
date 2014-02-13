When(/^I fill in squeek_body with "(.*?)"$/) do |text|
  fill_in("squeek_body", with: text)
end

Then(/^the squeek should contain "(.*?)" in the database$/) do |text|
  squeek_count = Squeek.where(body: text).count
  squeek_count.should == 1
end

When(/^I press "(.*?)" within the squeeks feed$/) do |link|
  click_link(link)
end