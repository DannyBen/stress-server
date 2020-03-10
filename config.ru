#\ -p 3000 -o 0.0.0.0

require 'sinatra'
require 'byebug' if ENV['BYEBUG']

get '/:options' do
  options = params[:options].gsub '+', ' '
  `stress #{options}`
end

run Sinatra::Application
