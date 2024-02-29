require 'spec_helper'

describe 'GET /help' do
  it 'is successful' do
    get '/help'
    expect(last_response).to be_ok
    expect(last_response.body).to match_approval('help')
  end
end
