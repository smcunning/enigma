require_relative '../modules/shiftable'
class Enigma
  attr_reader :message, :cipher_text, :key, :date
  include Shiftable

  def initialize
    @message = message
    @cipher_text = cipher_text
    @key = key
    @date = date
  end

  def encrypt(message, key = self.generate_key, date = self.todays_date)
    @message = message
    @key = key
    @date = date
    encryptor = Encryptor.new(@message, @key, @date)

    {
      encryption: encryptor.encrypt_message,
      key: encryptor.key,
      date: encryptor.date
    }
  end

  def decrypt(cipher_text, key, date = self.todays_date)
    @cipher_text = cipher_text
    @key = key
    @date = date
    decryptor = Decryptor.new(@cipher_text, @key, @date)

    {
      decryption: decryptor.decrypt_cipher_text,
      key: decryptor.key,
      date: decryptor.date
    }
  end
end
