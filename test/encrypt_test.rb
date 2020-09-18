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
    assert_equal 9639, encrypt.last_four_digits(date_squared)
  end
end
