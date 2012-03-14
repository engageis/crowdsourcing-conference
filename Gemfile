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

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem "rspec-rails", "~> 2.6.0"
  gem "machinist"
  gem "database_cleaner"
  gem "shoulda-matchers"
  #gem "ffaker"
end

group :production do
  gem "execjs"
  gem "therubyracer"
end

group :development do
  gem "thin"
end