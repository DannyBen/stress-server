require 'spec_helper'

describe 'GET /stress' do
  it "works" do
    get '/stress?dry_run=1&c=2&verbose=1&t=10&m=2&d=2&vm-bytes=128M&vm_keep=1'
    expect(last_response).to be_ok
    expect(last_response.body).to match_approval('stress').except(/\d{3,6}/).diff(3)
  end
end