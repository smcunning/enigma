require 'date'
require_relative '../modules/shiftable'

class Decryptor
  include Shiftable
  attr_reader :cipher_text,
              :key,
              :date,
              :shift_categories,
              :characters
  def initialize(ciphertext, key, date = self.todays_date)
    @cipher_text = ciphertext
    @key = key
    @date = date
    @shift_categories = [:a, :b, :c, :d]
    @characters = ("a".."z").to_a << ' '
  end
end
