require 'rails_helper'
require 'util/secure'

RSpec.describe Util do

  context Util::Secure do
    # Create a random object with module Util::Secure included
    let(:subject) { Util::Secure }
    let(:key) { subject.generate_key }
    let(:iv) { subject.generate_iv }


    it 'returns a cipher object of type AES-128-CBC' do
      expect(subject.cipher.name).to eq('AES-128-CBC')
    end

    it 'encrypt/decrypt data using key and iv' do
      data = 'quillpad'
      enc_data = subject.encrypt(data, key, iv)
      expect(subject.decrypt(enc_data, key, iv)).to eq(data)
    end

    it 'generates random key and iv' do
      expect(subject.generate_key).to be_present
      expect(subject.generate_iv).to be_present
    end

    it 'encodes and decodes the input' do
      data = 'quillpad'
      encoded_data = subject.encode(data)
      expect(encoded_data).not_to eq(data)
      expect(subject.decode(encoded_data)).to eq(data)
    end
  end
end