Capybara.configure do |config|
  config.match = :prefer_exact
end

if ENV["CI"]
  # This resolves issues with autocomplete tests failing on CI servers
  Capybara.javascript_driver = :selenium
else
  require 'capybara/poltergeist'
  Capybara.javascript_driver = :poltergeist
end
