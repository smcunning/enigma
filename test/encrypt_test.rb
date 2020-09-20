require './test/test_helper'
require 'mocha/minitest'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new("hello world", "12345", "120787")
    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_attributes
    encrypt = Encrypt.new("hello world", "12345", "120787")
    assert_equal "12345", encrypt.key
    assert_equal "hello world", encrypt.message
    assert_equal "120787", encrypt.date
    assert_equal [:a, :b, :c, :d], encrypt.shift_categories

    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    assert_equal expected, encrypt.characters
  end

  def test_it_can_generate_key
    encrypt = Encrypt.new("hello world", "120787")
    encrypt.stubs(:generate_key).returns("12345")
    assert_equal "12345", encrypt.generate_key
  end

  def test_it_can_find_todays_date
    encrypt = Encrypt.new("hello world", "12345")
    assert_equal "190920", encrypt.date
    assert_equal "190920", encrypt.todays_date
  end

  def test_it_can_set_key_shifts
    encrypt = Encrypt.new("hello world", "12345", "120787")
    assert_equal ({a: 12, b: 23, c: 34, d: 45}), encrypt.set_key_shifts(encrypt.key)
  end

  def test_it_can_square_date
    encrypt = Encrypt.new("hello world", "12345", "120787")
    assert_equal 14589499369, encrypt.find_squared_date(encrypt.date)
  end

  def test_it_can_find_last_four_digits
    encrypt = Encrypt.new("hello world", "12345", "120787")
    date_squared = encrypt.find_squared_date(encrypt.date)
    assert_equal "9639", encrypt.last_four_digits(date_squared)
  end

  def test_it_can_set_offset_shifts
    encrypt = Encrypt.new("hello world", "12345", "120787")
    date_squared = encrypt.find_squared_date(encrypt.date)
    last_four = encrypt.last_four_digits(date_squared)
    assert_equal ({a: 9, b: 6, c: 3, d: 9}), encrypt.set_offset_shifts(last_four)
  end

  def test_it_can_find_total_shifts
    encrypt = Encrypt.new("hello world", "12345", "120787")
    assert_equal ({a: 21, b: 29, c: 37, d: 54}), encrypt.total_shifts("12345", "9639")
  end

  def test_it_can_assign_shift_categories_to_message
    encrypt = Encrypt.new("hello world", "12345", "120787")
    expected = ({:a=>['h','o','r'], :b=>['e',' ','l'], :c=>['l','w','d'], :d=>['l', 'o']})
    assert_equal expected, encrypt.set_message_to_shift_categories(encrypt.message)
  end

  def test_it_can_create_shifted_character_sets
    encrypt = Encrypt.new("hello world", "12345", "120787")
    expected = {
      :a =>{'a'=>'v', 'b'=>'w', 'c'=>'x', 'd'=>'y', 'e'=>'z', 'f'=>' ', 'g'=>'a', 'h'=>'b', 'i'=>'c', 'j'=>'d', 'k'=>'e', 'l'=>'f', 'm'=>'g', 'n'=>'h', 'o'=>'i', 'p'=>'j', 'q'=>'k', 'r'=>'l', 's'=>'m', 't'=>'n', 'u'=>'o', 'v'=>'p', 'w'=>'q', 'x'=>'r', 'y'=>'s', 'z'=>'t', ' '=>'u'},
      :b =>{'a'=>'c', 'b'=>'d', 'c'=>'e', 'd'=>'f', 'e'=>'g', 'f'=>'h', 'g'=>'i', 'h'=>'j', 'i'=>'k', 'j'=>'l', 'k'=>'m', 'l'=>'n', 'm'=>'o', 'n'=>'p', 'o'=>'q', 'p'=>'r', 'q'=>'s', 'r'=>'t', 's'=>'u', 't'=>'v', 'u'=>'w', 'v'=>'x', 'w'=>'y', 'x'=>'z', 'y'=>' ', 'z'=>'a', ' '=>'b'},
      :c =>{'a'=>'k', 'b'=>'l', 'c'=>'m', 'd'=>'n', 'e'=>'o', 'f'=>'p', 'g'=>'q', 'h'=>'r', 'i'=>'s', 'j'=>'t', 'k'=>'u', 'l'=>'v', 'm'=>'w', 'n'=>'x', 'o'=>'y', 'p'=>'z', 'q'=>' ', 'r'=>'a', 's'=>'b', 't'=>'c', 'u'=>'d', 'v'=>'e', 'w'=>'f', 'x'=>'g', 'y'=>'h', 'z'=>'i', ' '=>'j'},
      :d =>{'a'=>'a', 'b'=>'b', 'c'=>'c', 'd'=>'d', 'e'=>'e', 'f'=>'f', 'g'=>'g', 'h'=>'h', 'i'=>'i', 'j'=>'j', 'k'=>'k', 'l'=>'l', 'm'=>'m', 'n'=>'n', 'o'=>'o', 'p'=>'p', 'q'=>'q', 'r'=>'r', 's'=>'s', 't'=>'t', 'u'=>'u', 'v'=>'v', 'w'=>'w', 'x'=>'x', 'y'=>'y', 'z'=>'z', ' '=>' '},
    }
    assert_equal expected, encrypt.shifted_character_sets(encrypt.key, "9639")
  end
end
