ruby '2.6.3'

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'devise-i18n'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'jbuilder', '~> 2.7'
gem 'pundit'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.1'
gem 'rails-i18n', '~> 6.0.0'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'sass-rails', '>= 6'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'webdrivers', '~> 4.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pundit-matchers', '~> 1.6.0'
  gem 'sqlite3', '~> 1.4'
  gem 'rspec-rails', '~> 4.0.0.beta3'
  gem 'rubocop-faker', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', '1.33.0', require: false
  gem 'simplecov'
end

group :development do
  gem 'capistrano', '~> 3.11', require: false
  gem 'capistrano-bundler', '~> 1.6'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara-screenshot'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
end

# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
