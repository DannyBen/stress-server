require 'spec_helper'

describe 'GET /' do
  it "works" do
    get '/'
    expect(last_response).to be_ok
  end
end