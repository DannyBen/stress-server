require 'spec_helper'

describe 'GET /raw/:options' do
  it "works" do
    get '/raw/--help'
    expect(last_response).to be_ok
    expect(last_response.body).to match_approval('help')
  end

  it "runs" do
    get '/raw/--dry-run+-c+1'
    expect(last_response).to be_ok
    expect(last_response.body).to match_approval('raw').except(/\d{3,6}/).diff(3)
  end
end