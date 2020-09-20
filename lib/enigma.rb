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


end
