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
  end
end
