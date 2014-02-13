Given(/^the squeek "(.*?)" by "(.*?)"$/) do |body, username|
  user = Fabricate(:user, username: username)
  Squeek.create!(body: body, user: user)
end

Then(/^there should be a squeek "(.*?)" in the database$/) do |text|
  squeek_count = Squeek.where(body: text).count
  # Equivalent to: assert_equal 1, squeek_count
  squeek_count.should == 1
end

Then(/^I should see "(.*?)" within the squeeks feed$/) do |text|
  within(".squeeks") do
    page.should have_content(text)
  end
end

Given(/^I have (\d+) squeek$/) do |num|
  step %{that user has #{num} squeeks}
end
