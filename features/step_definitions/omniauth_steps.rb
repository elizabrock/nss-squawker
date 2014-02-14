#Twitter Mock Login

When(/^I login to "(.*?)"$/) do |provider|
  visit "/users/auth/#{provider.downcase}"
end
