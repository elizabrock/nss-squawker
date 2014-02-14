Given(/^the squeek with an IP address in Nashville, TN, "(.*?)"$/) do |arg1|
  user = Fabricate(:user, username: username)
  Squeek.create!(body: body, user: user, ip_address: arg1)
end

Then(/^the squeek should be labeled "(.*?)"$/) do |city|
  within(".location")
    page.should have_content(city)
end