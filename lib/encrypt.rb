class Encrypt
  attr_reader :key,
              :shift_categories,
              :characters
  def initialize
    @key = self.generate_key
    @shift_categories = [:a, :b, :c, :d]
    @characters = ("a".."z").to_a << (" ")
  end

#-----Encryption
  def set_message_to_shift_categories(message)
   split_message = message.split(//)
   shift_to_chars = {}
   split_message.each.with_index do |char, index|
     category = index % @shift_categories.count
     (shift_to_chars[@shift_categories[category]] ||= []) << char
     end
   shift_to_chars
 end

#-----ShiftGeneration
  def generate_key
    numbers = [0,1,2,3,4,5,6,7,8,9]
    key = []
    5.times do (key << numbers.sample)
    end
    key.join
  end

  def set_key_shifts(key = @key)
    shifts_to_keys = {}
    shifts_to_keys[@shift_categories[0]] = key[0..1].to_i
    shifts_to_keys[@shift_categories[1]] = key[1..2].to_i
    shifts_to_keys[@shift_categories[2]] = key[2..3].to_i
    shifts_to_keys[@shift_categories[3]] = key[3..4].to_i
    shifts_to_keys
  end

  def find_squared_date(date)
    date.to_i ** 2
  end

  def last_four_digits(date_squared)
    date_squared.digits[0..3].join
  end

  def set_offset_shifts(last_four)
    shifts_to_offsets = {}
    shifts_to_offsets[@shift_categories[0]] = last_four[0].to_i
    shifts_to_offsets[@shift_categories[1]] = last_four[1].to_i
    shifts_to_offsets[@shift_categories[2]] = last_four[2].to_i
    shifts_to_offsets[@shift_categories[3]] = last_four[3].to_i
    shifts_to_offsets
  end

  def total_shifts(key, last_four)
    key_shifts = set_key_shifts(key)
    offset_shifts = set_offset_shifts(last_four)
    key_shifts.merge!(offset_shifts) { |shift, old_val, new_val| old_val + new_val }
  end
end
