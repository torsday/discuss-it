source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'puma'

gem 'httparty'
gem 'nokogiri'
gem 'hashie'
gem 'newrelic_rpm'

gem 'whenever'

group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'better_errors'
  gem 'jazz_hands'
  gem 'launchy'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec', :require => false
  gem 'guard-spork', :require => false
  gem 'guard-bundler'
  gem 'foreman'
end

group :test do
  gem 'spork', '~> 1.0rc'
  gem 'spork-rails', :require => false, :git => 'git://github.com/sporkrb/spork-rails'
  gem 'capybara'
  gem 'vcr'
  gem 'webmock'
  gem 'meta_request', :require => false
  gem 'simplecov', :require => false

  # for guard-test awesomeness
  gem 'rb-fsevent', :require => false
  gem 'growl', :require => false
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

# for pretty stuff
gem 'haml-rails'
gem 'twitter-bootstrap-rails'
gem 'flat-ui-rails'
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
