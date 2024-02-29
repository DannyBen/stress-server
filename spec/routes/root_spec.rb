require 'spec_helper'

describe 'GET /' do
  it 'is successful' do
    get '/'
    expect(last_response).to be_ok
  end
end
