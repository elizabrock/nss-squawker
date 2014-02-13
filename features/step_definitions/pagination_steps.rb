Then(/^I should see (\d+) squeeks$/) do |number|
  page.should have_css("ul.squeeks li", count: number)
end

Then(/^I should see pagination links$/) do
  pending # express the regexp above with the code you wish you had
end
