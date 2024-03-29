source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'    # required for Rails 4 on Heroku
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem "compass-rails", "~> 2.0.alpha.0"  # required for Rails 4 and Foundation

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'zurb-foundation', '~> 4.0.0'

gem 'google-analytics-rails'
gem 'google-analytics-turbolinks'

gem 'rankstar'
gem 'nokogiri'

gem 'PageRankr', '~> 3.1.0', :require => 'page_rankr'


group :development do
  gem "better_errors"
  gem "ruby-prof"
end

gem 'will_paginate', '~> 3.0'
gem 'foundation-will_paginate'

gem 'grabzit'

gem 'thin'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
