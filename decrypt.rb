require './lib/enigma'
require './lib/encryptor'

handle = File.open(ARGV[0], "r")
cipher_text = handle.read
handle.close

enigma = Enigma.new

decrypt = enigma.decrypt(cipher_text, "02715", "040895")
decryption = File.open(ARGV[1], "w")
decryption.write(decrypt[:decryption])
encryption.close

puts "Created 'encrypted.txt' with the key #{enigma.key} and date #{enigma.date}"
