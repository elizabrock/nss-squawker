Given(/^a set of (\d+) squeeks$/) do |number|
  user = Fabricate(:user, username: "username")
  number.to_i.times do |num|
    Squeek.create!(body: "Squeek #{num + 1}", user: user, friends_only: false)
  end
end

Then(/^I should see (\d+) squeeks$/) do |number|
  page.should have_css("ul.squeeks li", count: number)
end

Then(/^I should see pagination links$/) do
  page.should have_css("nav.pagination", count: 1)
end
