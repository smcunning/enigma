require './lib/enigma'
require './lib/encryptor'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new

encrypt = enigma.encrypt(message)
encryption = File.open(ARGV[1], "w")
encryption.write(encrypt[:encryption])
encryption.close

puts "Created 'encrypted.txt' with the key #{enigma.key} and date #{enigma.date}"
