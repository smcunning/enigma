require './lib/enigma'
require './lib/decryptor'

handle = File.open(ARGV[0], "r")
cipher_text = handle.read
handle.close

enigma = Enigma.new

decrypt = enigma.decrypt(cipher_text, ARGV[2], ARGV[3])
decryption = File.open(ARGV[1], "w")
decryption.write(decrypt[:decryption])
decryption.close

puts "Created 'decrypted.txt' with the key #{enigma.key} and date #{enigma.date}"
