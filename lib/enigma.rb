class Enigma
  attr_reader :message
  def initialize
    @message = File.open('message.txt', "r")
  end

  def encrypt(message, key, date)
    encryptor = Encryptor.new(message, key, date)

    {
      encryption: encryptor.encrypt_message,
      key: encryptor.key,
      date: encryptor.date
    }
  end

  def decrypt(message, key, date)
    decryptor = Decryptor.new(message, key, date)

    {
      encryption: decryptor.decrypt_cipher_text,
      key: decryptor.key,
      date: decryptor.date
    }
  end 
end
