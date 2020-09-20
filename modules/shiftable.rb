module Shiftable
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
    squared.to_s[-4..-1]
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
