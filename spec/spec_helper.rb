# Simplecov coverage reports
require 'simplecov'
SimpleCov.start

# Require the Gemfile
require 'rubygems'
require 'bundler'
Bundler.require :default, :development

# Sinatra testing with Rack::Test
require 'rack/test'
ENV['RACK_ENV'] = 'test'
ENV['QUIET_SERVER'] = '1'

require File.expand_path '../server', __dir__

# Bootstrap Sinatra testing with rspec
module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

# Configure RSpec
RSpec.configure do |config|
  config.include RSpecMixin
end

