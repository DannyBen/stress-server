# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# FIXME: version 4 brings updated rack, which has a problem with thin
gem 'sinatra', '< 4' 
gem 'sinatra-contrib'
gem 'thin'
# gem 'rackup' # needed with sinatra 4...

group :development do
  gem 'debug'
  gem 'rack-test'
  gem 'rspec'
  gem 'rspec_approvals'
  gem 'simplecov'
end
