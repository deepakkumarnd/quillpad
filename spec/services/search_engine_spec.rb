require 'rails_helper'

RSpec.describe SearchEngine do

  let(:user) { build(:user) }
  let(:query) { double('query') }
  let(:page) { 1 }
  let(:user_signed_in) { false }

  it 'has a search method' do
    expect(SearchEngine).to respond_to(:search)
  end

  context '#new' do
    it 'throws InvalidSearchError for a blank user' do
      expect { SearchEngine.new(nil, query, user_signed_in, page) }.to raise_error(InvalidSearchError)
    end
  end

  context 'SearchEngine' do
    subject { SearchEngine.new(user, query, user_signed_in, page) }

    it 'has a perform method' do
      expect(subject).to respond_to(:perform)
    end
  end

  context '#search' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }

    before do
      2.times { create(:post, user: user1) }
      1.times { create(:published_post, user: user1) }
      3.times { create(:post, user: user2) }
    end

    it 'returns zero records if there is no match' do
      expect(SearchEngine.search(user1, 'random string').count).to eq(0)
    end

    it 'returns all published documents for blank search string' do
      expect(SearchEngine.search(user1, ' ').count).to eq(1)
    end

    it 'returns the matching published documents for non sigend in user' do
      actual  = SearchEngine.search(user1, 'ipsum').map(&:id).sort
      expected = user1.posts.where(is_published: true).map(&:id).sort
      expect(actual).to eq(expected)
    end

    it 'returns the all matching documents for sigend in user' do
      actual  = SearchEngine.search(user1, 'ipsum', true).map(&:id).sort
      expected = user1.posts.map(&:id).sort
      expect(actual).to eq(expected)
    end
  end
end