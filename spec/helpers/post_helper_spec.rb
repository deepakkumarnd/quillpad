require 'rails_helper'

RSpec.describe PostsHelper do

  let(:helper) { Class.new.include(PostsHelper).new }
  
  it "Converts markdown text to html" do
    expect(helper.render_markdown("*Hello*")).to eq("<p><em>Hello</em></p>\n")
  end
end
