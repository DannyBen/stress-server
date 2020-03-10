require 'sinatra'
require 'byebug' if ENV['BYEBUG']

get '/:options' do
  options = params[:options]
  system "stress #{options}"
end

run Sinatra::Application
