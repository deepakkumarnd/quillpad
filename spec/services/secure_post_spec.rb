require 'rails_helper'

RSpec.describe SecurePost do

  let(:user) { create(:user) }

  it 'encrypt the post content' do
    post = build(:post, kind: 'secure')
    plain_text_content = post.content
    enc_post = SecurePost.new(user, post).encrypt
    expect(enc_post).to eq(post)
    expect(enc_post.content).not_to eq(plain_text_content)
  end

  it 'decrypt the post and decrypted contend match with the plain text data' do
    post = build(:post, kind: 'secure')
    plain_text_content = post.content
    enc_post = SecurePost.new(user, post).encrypt
    dec_post = SecurePost.new(user, enc_post).decrypt
    expect(dec_post).to eq(post)
    expect(dec_post.content).to eq(plain_text_content)
  end
end