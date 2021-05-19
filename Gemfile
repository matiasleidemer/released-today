# frozen_string_literal: true

ruby '2.6.3'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers', '~> 0.10.0'
gem 'administrate', '>= 0.13.0'
gem 'bootsnap', '~> 1.4.4'
gem 'bourbon', '~> 4.3.4'
gem 'bugsnag', '~> 6.11.1'
gem 'devise', '~> 4.7.0'
gem 'encrypted_strings', require: false
gem 'foreman', '~> 0.85.0'
gem 'kaminari', '~> 1.2.1'
gem 'octicons_helper', '~> 9.1.1'
gem 'omniauth-spotify'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 4.3.8'
gem 'rails', '~> 5.2.5'
gem 'rspotify', '~> 1.27.0'
gem 'rubocop-rails', require: false
gem 'rubocop-rspec', require: false
gem 'sass-rails', '~> 5.0'
gem 'sendgrid-ruby'
gem 'sidekiq', '~> 5.2.7'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', '~> 11.0.1', platform: :mri
  gem 'dotenv-rails', '~> 2.6.0'
  gem 'factory_bot_rails', '~> 5.0.2'
end

group :development do
  gem 'bullet', '~> 5.9.0'
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner', '~> 1.7.0'
  gem 'rspec-rails', '~> 3.8'
  gem 'simplecov', require: false
  gem 'timecop', '~> 0.9.1'
  gem 'vcr', '~> 5.0.0'
  gem 'webmock', '~> 3.8.3'
end
