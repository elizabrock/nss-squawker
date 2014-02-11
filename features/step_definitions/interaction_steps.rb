And "show me the page" do
  save_and_open_page
end

Given(/^the squeek "(.*?)"$/) do |body|
  Squeek.create(body: body)
end

When(/^I go to the homepage$/) do
  visit root_path
end

When(/^I press "(.*?)"$/) do |text|
  click_button(text)
end

Then(/^I should see(?::)? "(.*?)"$/) do |text|
  page.should have_content(text)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, content|
  fill_in(field, with: content)
end

Then(/^I should see "(.*?)" within the squeeks feed$/) do |text|
  within(".squeeks") do
    page.should have_content(text)
  end
end

Then(/^there should be a squeek "(.*?)" in the database$/) do |text|
  squeek_count = Squeek.where(body: text).count
  # Equivalent to: assert_equal 1, squeek_count
  squeek_count.should == 1
end
