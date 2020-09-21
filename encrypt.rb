require './lib/enigma'
require './lib/encryptor'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new

encryption = File.open(ARGV[1], "w")
encryption.write(enigma.encrypt(message))
encryption.close

puts "Created 'encrypted.txt' with the key #{enigma.encryptor.key} and date #{enigma.encryptor.date}"
