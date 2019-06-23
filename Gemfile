ruby '2.6.3'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers', '~> 0.10.0'
gem 'administrate', '~> 0.11.0'
gem 'bootsnap', '~> 1.4.4'
gem 'bourbon', '~> 4.3.4'
gem 'bugsnag', '~> 6.11.1'
gem 'devise', '~> 4.6.0'
gem 'encrypted_strings', require: false
gem 'factory_girl_rails', '~> 4.0'
gem 'foreman'
gem 'kaminari'
gem 'octicons_helper'
gem 'omniauth-spotify'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.2.3'
gem 'rspotify', '~> 1.27.0'
gem 'sass-rails', '~> 5.0'
gem 'sendgrid-ruby'
gem 'sidekiq', '~> 5.2.7'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', '~> 11.0.1', platform: :mri
  gem 'dotenv-rails', '~> 2.6.0'
  gem 'rspec-rails', '~> 3.8'
end

group :development do
  gem 'bullet', '~> 5.9.0'
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner', '~> 1.7.0'
  gem 'timecop', '~> 0.9.1'
  gem 'vcr', '~> 5.0.0'
  gem 'webmock', '~> 3.6.0'
end
