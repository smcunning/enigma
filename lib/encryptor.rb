require 'date'

class Encryptor
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
    shift_message_characters.values.join
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
     Hash[@characters.zip(@characters.rotate(total_shifts[category]))]
   end
   category_to_character_sets
 end

#-----ShiftGeneration
  def generate_key
    numbers = [0,1,2,3,4,5,6,7,8,9]
    key = []
    5.times do (key << numbers.sample)
    end
    key.join
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def set_key_shifts
    {
      a: @key[0..1].to_i,
      b: @key[1..2].to_i,
      c: @key[2..3].to_i,
      d: @key[3..4].to_i
    }
  end

  def transform_date
    squared = @date.to_i ** 2
    squared.digits[0..3].join
  end

  def set_offset_shifts
    last_four = transform_date
    {
      a: last_four[0].to_i,
      b: last_four[1].to_i,
      c: last_four[2].to_i,
      d: last_four[3].to_i
    }
  end

  def total_shifts
    key_shifts = set_key_shifts
    offset_shifts = set_offset_shifts
    key_shifts.merge!(offset_shifts) { |cat, key, offset| key + offset }
  end
end
