Given(/^the squeek "(.*?)"$/) do |body|
  Squeek.create(body: body)
end

Then(/^there should be a squeek "(.*?)" in the database$/) do |text|
  squeek_count = Squeek.where(body: text).count
  # Equivalent to: assert_equal 1, squeek_count
  squeek_count.should == 1

Then(/^I should see "(.*?)" within the squeeks feed$/) do |text|
  within(".squeeks") do
    page.should have_content(text)
  end
end
end
