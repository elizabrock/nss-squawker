ruby '2.0.0'
#ruby-gemset=squawker
source 'https://rubygems.org'

gem 'activerecord-session_store'
gem 'coffee-rails', '~> 4.0.0'
gem 'devise'
gem 'gravtastic'
gem 'haml-rails'
gem 'honeybadger'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'kaminari'
gem 'omniauth-twitter'
gem 'pg'
gem 'postmark-rails'
gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_12factor'
end

group :test, :development do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'rspec'
  gem 'rspec-rails'
end

group :test do
  gem 'email_spec'
  gem 'launchy'
  gem "codeclimate-test-reporter", require: nil
end
