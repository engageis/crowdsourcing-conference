source 'https://rubygems.org'

gem 'rails', '3.2.2'

#DB
gem 'pg'
gem 'foreigner'

# Views
gem "slim"
gem "slim-rails"

# Translations
gem 'globalize3'
gem 'routing-filter'

gem 'jquery-rails'
gem 'inherited_resources'
gem 'activeadmin'
gem "paperclip", '~> 2.7.0'
gem 'aws-sdk'
gem 'enumerate_it'
gem 'simple_form'
gem 'auto_html'
gem 'video_info'
gem "formtastic", "~> 2.0.0"

# Payment
gem 'moip', :git => 'git://github.com/joaomilho/moip-ruby.git'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
  gem 'bootstrap-sass'
  gem "rails-backbone"
end

group :development, :test do
  gem "rspec-rails", "~> 2.9.0"
  gem "machinist"
  gem "database_cleaner"
  gem "shoulda-matchers"
  gem "ffaker"
  gem "jasmine"
end

group :production do
  gem "execjs"
  gem "therubyracer"
end

group :development, :production do
  gem "thin"
end
