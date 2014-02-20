Given(/^I post a squeek$/) do
  visit root_path
  fill_in("Squeek here", :with => "This is some sample text.")
  click_button("Squawk")
end

Then(/^the squeek should be labeled "(.*?)"$/) do |city|
  within(".location") do
    page.should have_content(city)
  end
end

Then(/^I should see "(.*?)" within the squeeks feed$/) do |text|
  within(".squeeks.squawked") do
    page.should have_content(text)
  end
end

Then(/^I should not see "(.*?)" within the squeeks feed$/) do |text|
  within(".squeeks.squawked") do
    page.should_not have_content(text)
  end
end

Then(/^I should see the image "(.*?)" within the squeeks feed$/) do |image|
  page.should have_xpath("//img[contains(@src, 'cat.png')]")
end
