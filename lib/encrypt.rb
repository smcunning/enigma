class Encrypt
  attr_reader :key
  def initialize
    @key = self.generate_key
  end

  def generate_key
    numbers = [0,1,2,3,4,5,6,7,8,9]
    key = []
    5.times do (key << numbers.sample)
    end
    key.join
  end

  def set_key_shifts(key = @key)
    shift_categories = [:a, :b, :c, :d]
    shifts_to_keys = {}
    shifts_to_keys[shift_categories[0]] = key[0..1].to_i
    shifts_to_keys[shift_categories[1]] = key[1..2].to_i
    shifts_to_keys[shift_categories[2]] = key[2..3].to_i
    shifts_to_keys[shift_categories[3]] = key[3..4].to_i
    shifts_to_keys
  end
end
