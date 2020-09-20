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

  def set_message_to_shift_categories
    shift_to_chars = {}
    split_message = cipher_text.downcase.split('')
    split_message.each_with_index do |char, index|
     category = index % @shift_categories.count
     (shift_to_chars[@shift_categories[category]] ||= []) << char
    end
    shift_to_chars
  end
  
end
