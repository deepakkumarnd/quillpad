require 'rails_helper'

RSpec.describe Post do
  describe "Validations for Post kind field" do
    let(:post) { build(:post) }

    it 'responds to all the kind? methods' do
      Post::KINDS.each do |kind|
        expect(post.respond_to?("#{kind}?".to_sym)).to be true
      end
    end

    it 'checks if the post is default' do
      expect(post.default?).to be true
    end

    it 'checks if the post is secure' do
      post.kind = 'secure'
      expect(post.secure?).to be true
    end

    it 'checks if the post is bookmark' do
      post.kind = 'bookmark'
      expect(post.bookmark?).to be true
    end

    it 'fails if the post is not bookmark' do
      expect(post.bookmark?).to be false
    end

    it 'does not pass the validation for invalid kinds' do
      post.kind = 'foo'
      expect(post.valid?).to be false
    end

    it 'ensures the presence of a kind' do
      post.kind = nil
      expect(post.valid?).to be false
      post.kind = ""
      expect(post.valid?).to be false
    end
  end
end
