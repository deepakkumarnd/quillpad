require 'rails_helper'

RSpec.describe User do

  let(:user) { create(:user) }

  it "sets a random username to user record if the username is blank" do
    user.subdomain = ""
    user.save
    expect(user.subdomain).not_to be_empty
  end
end
