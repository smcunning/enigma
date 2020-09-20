require 'date'
require_relative '../modules/shiftable'

class Encryptor
  include Shiftable
  attr_reader :message,
              :key,
              :date,
              :shift_categories,
              :characters
  def initialize(message, key = self.generate_key, date = self.todays_date)
    @key = key
    @message = message
    @date = date
    @shift_categories = [:a, :b, :c, :d]
    @characters = ("a".."z").to_a << ' '
  end

#-----Encryption

  def encrypt_message
    shift_message_characters.values.reduce(&:zip).join
  end

  def shift_message_characters
    shifted_characters = {}
    set_message_to_shift_categories.map do |cat, chars|
      chars.map do |char|
        if !@characters.include?(char)
          (shifted_characters[cat] ||= []) << char
        else
          (shifted_characters[cat] ||= []) << shifted_character_sets[cat][char]
        end
      end
    end
    shifted_characters
  end

  def set_message_to_shift_categories
    shift_to_chars = {}
    split_message = message.downcase.split('')
    split_message.each_with_index do |char, index|
     category = index % @shift_categories.count
     (shift_to_chars[@shift_categories[category]] ||= []) << char
    end
    shift_to_chars
 end

 def shifted_character_sets
   category_to_character_sets = {}
   @shift_categories.each do |category|
     category_to_character_sets[category] =
     Hash[@characters.zip(@characters.rotate(total_shifts[category] % 27))]
   end
   category_to_character_sets
 end
end
