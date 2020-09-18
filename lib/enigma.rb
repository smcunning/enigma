class Enigma
  attr_reader :message
  def initialize
    @message = File.open('message.txt', "r")
  end
end
