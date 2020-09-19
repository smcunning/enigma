require './test/test_helper'
require 'mocha/minitest'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new
    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_attributes
    encrypt = Encrypt.new
    encrypt.stubs(:key).returns("12345")
    assert_equal "12345", encrypt.key
    assert_equal [:a, :b, :c, :d], encrypt.shift_categories

    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    assert_equal expected, encrypt.characters
  end

  def test_it_can_generate_key
    encrypt = mock("Encrypt Object")
    encrypt.stubs(:generate_key).returns("12345")
    assert_equal "12345", encrypt.generate_key
  end

  def test_it_can_set_key_shifts
    encrypt = Encrypt.new
    key = "12345"
    assert_equal ({a: 12, b: 23, c: 34, d: 45}), encrypt.set_key_shifts(key)
  end

  def test_it_can_square_date
    encrypt = Encrypt.new
    date = "120787"
    assert_equal 14589499369, encrypt.find_squared_date(date)
  end

  def test_it_can_find_last_four_digits
    encrypt = Encrypt.new
    date = "120787"
    date_squared = encrypt.find_squared_date(date)
    assert_equal "9639", encrypt.last_four_digits(date_squared)
  end

  def test_it_can_set_offset_shifts
    encrypt = Encrypt.new
    date = "120787"
    date_squared = encrypt.find_squared_date(date)
    last_four = encrypt.last_four_digits(date_squared)
    assert_equal ({a: 9, b: 6, c: 3, d: 9}), encrypt.set_offset_shifts(last_four)
  end

  def test_it_can_find_total_shifts
    encrypt = Encrypt.new
    assert_equal ({a: 20, b: 17, c: 14, d: 20}), encrypt.total_shifts("111111", "9639")
  end

  def test_it_can_assign_shift_categories_to_message
    encrypt = Encrypt.new
    message = "hello world"
    expected = ({:a=>['h','o','r'], :b=>['e',' ','l'], :c=>['l','w','d'], :d=>['l', 'o']})
    assert_equal expected, encrypt.set_message_to_shift_categories
  end
end
