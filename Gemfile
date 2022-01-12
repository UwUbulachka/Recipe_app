# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rubocop', require: false

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

gem 'bcrypt'

gem 'cocoon'

gem 'dotiw'

gem 'faker'

gem 'rails-i18n', '~> 6'

gem 'carrierwave-i18n'

gem 'will_paginate'

gem 'will_paginate-bootstrap-style'

gem 'carrierwave', '~> 2.0'

gem 'mini_magick'

gem 'rails-controller-testing'

gem 'sqlite3', '~> 1.4', group: :development

gem 'puma', '~> 5.0'

gem 'sass-rails', '>= 6'

gem 'webpacker', '~> 5.0'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.7'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'byebug'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'mini_backtrace'
  gem 'minitest-reporters'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
