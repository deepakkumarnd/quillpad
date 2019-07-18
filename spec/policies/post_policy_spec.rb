require 'rails_helper'

RSpec.describe PostPolicy do

  let(:user) { build(:user) }

  context 'Secure kind of post' do
    let(:post) { build(:secure_post) }

    it 'prohibits publish action on a secure kind of post' do
      policy = PostPolicy.new(user, post)
      expect(policy.publish?).to be false
    end

    it 'prohibits unpublish action on a secure kind of post' do
      policy = PostPolicy.new(user, post)
      expect(policy.unpublish?).to be false
    end
  end

  context 'Default kind of post' do


    context 'Unpublished post' do
      let(:post) { build(:post) }

      it 'prohibits unpublish action on an unpublished post' do
        policy = PostPolicy.new(user, post)
        expect(policy.unpublish?).to be false
      end

      it 'permits publish action on a default kind of post' do
        policy = PostPolicy.new(user, post)
        expect(policy.publish?).to be true
      end
    end

    context 'Published post' do
      let(:post) { build(:published_post) }

      it 'prohibits publish action on an published post' do
        policy = PostPolicy.new(user, post)
        expect(policy.publish?).to be false
      end

      it 'permits unpublish action on a published post' do
        policy = PostPolicy.new(user, post)
        expect(policy.unpublish?).to be true
      end
    end
  end
end
