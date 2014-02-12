World(FabricationMethods)

Fabrication::Config.register_with_steps = true

Then(/^I should see (\d+) squeeks$/) do |number|
  page.should have_css("ul.squeeks li", count: number)
end

Then(/^I should see pagination links$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^sequential (\d+) squeeks$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end
