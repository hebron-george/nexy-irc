require 'openssl'
require 'crypt/blowfish'

# This module is WIP and broken
# use at your own risk.
#
# Feel free to open up a PR if you can
# get it working with fishlim in Hexchat

module Blowfish
  def self.blowfish_instance
    Crypt::Blowfish.new("testkey")
  end

  def self.cipher(mode, key, data)
    cipher = OpenSSL::Cipher::Cipher.new('bf-ecb').send(mode)
    cipher.key_len = Digest::SHA256.digest(key).length
    cipher.key = Digest::SHA256.digest(key)
    cipher.update(data) << cipher.final
  end

  def self.encrypt(key, data)
    cipher(:encrypt, key, data)
  end

  def self.decrypt(key, text)
    cipher(:decrypt, key, text)
  end

  def self.new_encrypt(data)
    blowfish_instance.encrypt_string(data)
  end

  def self.new_decrypt(data)
    binding.pry
    blowfish_instance.decrypt_string(data)
  end
end