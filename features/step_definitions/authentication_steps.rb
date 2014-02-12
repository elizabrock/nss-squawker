Given(/^the user "(.*?)"\/"(.*?)" with "(.*?)"$/) do |username, email, password|
  User.create(username: username, email: email, password: password, password_confirmation: password)
end
