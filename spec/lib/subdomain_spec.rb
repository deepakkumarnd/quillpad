require 'rails_helper'

RSpec.describe Subdomain do

  it 'checks if the request has a subdomain other than www' do
    request = double('request', subdomain: 'hello')
    expect(Subdomain.matches?(request)).to be true
  end

  it 'fails for subdomain www' do
    request = double('request', subdomain: 'www')
    expect(Subdomain.matches?(request)).to be false
  end

  it 'fails for empty subdomain' do
    request = double('request', subdomain: nil)
    expect(Subdomain.matches?(request)).to be false
  end

end
