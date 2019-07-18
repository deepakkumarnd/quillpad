module Util
  class Secure
    class << self
      # Cipher algorithm
      def cipher
        OpenSSL::Cipher::AES.new(128, :CBC)
      end

      # Generate a random key
      def generate_key
        encode(cipher.random_key)
      end

      # Generate a random iv
      def generate_iv
        encode(cipher.random_iv)
      end

      # Generate a random iv
      def encode
        encode(cipher.random_iv)
      end

      # Method to encrypt given data
      def encrypt(data, key = nil, iv = nil)
        cipher_obj = cipher
        cipher_obj.encrypt
        cipher_obj.key = decode(key)
        cipher_obj.iv  = decode(iv || key)
        encrypt_data = cipher_obj.update(data)
        encrypt_data << cipher_obj.final
        encode(encrypt_data)
      end

      # Method to decrypt given data
      def decrypt(data, key = nil, iv = nil)
        cipher_obj = cipher
        cipher_obj.decrypt
        cipher_obj.key = decode(key)
        cipher_obj.iv  = decode(iv || key)
        decoded_data = decode(data)
        plain_data = cipher_obj.update(decoded_data)
        plain_data << cipher_obj.final
        plain_data
      end

      def encode(data)
        Base64.strict_encode64(data)
      end

      def decode(data)
        Base64.strict_decode64(data)
      end
    end
  end
end
