# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rack-cors'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'tty-spinner'

gem 'active_storage_base64'
gem 'aws-sdk-s3', require: false

gem 'devise'
gem 'devise-jwt'
gem 'pundit'

gem 'enumerize'
gem 'graphql'
gem 'kaminari'

group :development, :test do
  gem 'dotenv-rails'

  gem 'pry-byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'

  gem 'rails-erd'

  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 4.0.1'

  gem 'rubocop', '0.88.0'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 4.0'
end

group :production do
  gem 'sentry-raven'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
