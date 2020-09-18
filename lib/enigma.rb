class Enigma

  def initialize
    @message = File.open('message.txt', "r")
  end
end
