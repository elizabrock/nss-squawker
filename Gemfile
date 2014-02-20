ruby '2.0.0'
#ruby-gemset=squawker
source 'https://rubygems.org'

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'activerecord-session_store'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.0.0'
gem 'devise'
gem 'figaro'
gem 'fog'
gem 'foundation-rails'
gem 'geocoder'
gem 'gravtastic'
gem 'haml-rails'
gem 'honeybadger'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
# Note: You must have Imagemagick and MiniMagick installed to do image resizing.
# MiniMagick is a Ruby interface for Imagemagick which is a C program.
# This is why MiniMagick fails on 'bundle install' without Imagemagick installed.
# Found at: https://github.com/carrierwaveuploader/carrierwave
gem 'omniauth-twitter'
gem 'pg'
gem 'postmark-rails'
gem 'rails', '4.0.2'
gem 'rails3-jquery-autocomplete'
gem 'sass-rails', '~> 4.0.0'
gem 'selenium-webdriver'
gem 'simple_form'
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
  gem 'pry'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'letter_opener'
end

group :test do
  gem 'coveralls'
  gem 'email_spec'
  gem 'launchy'
  gem 'poltergeist'
  gem 'webmock'
end
