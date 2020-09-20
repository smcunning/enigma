require './test/test_helper'
require 'date'
require 'mocha/minitest'

class EncryptorTest < Minitest::Test

  def test_it_exists
    encrypt = Encryptor.new("hello world", "02715", "040895")
    assert_instance_of Encryptor, encrypt
  end

  def test_it_has_attributes
    encrypt = Encryptor.new("hello world", "02715", "040895")
    assert_equal "02715", encrypt.key
    assert_equal "hello world", encrypt.message
    assert_equal "040895", encrypt.date
    assert_equal [:a, :b, :c, :d], encrypt.shift_categories

    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    assert_equal expected, encrypt.characters
  end

  def test_it_can_generate_key
    encrypt = Encryptor.new("hello world", "120787")
    encrypt.stubs(:generate_key).returns("12345")
    assert_equal "12345", encrypt.generate_key
  end

  def test_it_can_find_todays_date
    encrypt = Encryptor.new("hello world", "12345")
    expected = (Date.today.strftime("%d%m%y"))
    assert_equal expected, encrypt.date
    assert_equal expected, encrypt.todays_date
  end

  def test_it_can_set_key_shifts
    encrypt = Encryptor.new("hello world", "02715", "040895")
    assert_equal ({a: 02, b: 27, c: 71, d: 15}), encrypt.set_key_shifts
  end

  def test_it_can_transform_date
    encrypt = Encryptor.new("hello world", "02715", "040895")
    assert_equal "1025", encrypt.transform_date
  end

  def test_it_can_set_offset_shifts
    encrypt = Encryptor.new("hello world", "02715", "040895")
    assert_equal ({a: 1, b: 0, c: 2, d: 5}), encrypt.set_offset_shifts
  end

  def test_it_can_find_total_shifts
    encrypt = Encryptor.new("hello world", "02715", "040895")
    assert_equal ({a: 3, b: 27, c: 73, d: 20}), encrypt.total_shifts
  end

  def test_it_can_assign_shift_categories_to_message
    encrypt = Encryptor.new("hello world", "02715", "040895")
    expected = ({:a=>['h','o','r'], :b=>['e',' ','l'], :c=>['l','w','d'], :d=>['l', 'o']})
    assert_equal expected, encrypt.set_message_to_shift_categories
  end

  def test_it_can_create_shifted_character_sets
    encrypt = Encryptor.new("hello world", "02715", "040895")
    expected = {
      :a =>{'a'=>'d', 'b'=>'e', 'c'=>'f', 'd'=>'g', 'e'=>'h', 'f'=>'i', 'g'=>'j', 'h'=>'k', 'i'=>'l', 'j'=>'m', 'k'=>'n', 'l'=>'o', 'm'=>'p', 'n'=>'q', 'o'=>'r', 'p'=>'s', 'q'=>'t', 'r'=>'u', 's'=>'v', 't'=>'w', 'u'=>'x', 'v'=>'y', 'w'=>'z', 'x'=>' ', 'y'=>'a', 'z'=>'b', ' '=>'c'},
      :b =>{'a'=>'a', 'b'=>'b', 'c'=>'c', 'd'=>'d', 'e'=>'e', 'f'=>'f', 'g'=>'g', 'h'=>'h', 'i'=>'i', 'j'=>'j', 'k'=>'k', 'l'=>'l', 'm'=>'m', 'n'=>'n', 'o'=>'o', 'p'=>'p', 'q'=>'q', 'r'=>'r', 's'=>'s', 't'=>'t', 'u'=>'u', 'v'=>'v', 'w'=>'w', 'x'=>'x', 'y'=>'y', 'z'=>'z', ' '=>' '},
      :c =>{'a'=>'t', 'b'=>'u', 'c'=>'v', 'd'=>'w', 'e'=>'x', 'f'=>'y', 'g'=>'z', 'h'=>' ', 'i'=>'a', 'j'=>'b', 'k'=>'c', 'l'=>'d', 'm'=>'e', 'n'=>'f', 'o'=>'g', 'p'=>'h', 'q'=>'i', 'r'=>'j', 's'=>'k', 't'=>'l', 'u'=>'m', 'v'=>'n', 'w'=>'o', 'x'=>'p', 'y'=>'q', 'z'=>'r', ' '=>'s'},
      :d =>{'a'=>'u', 'b'=>'v', 'c'=>'w', 'd'=>'x', 'e'=>'y', 'f'=>'z', 'g'=>' ', 'h'=>'a', 'i'=>'b', 'j'=>'c', 'k'=>'d', 'l'=>'e', 'm'=>'f', 'n'=>'g', 'o'=>'h', 'p'=>'i', 'q'=>'j', 'r'=>'k', 's'=>'l', 't'=>'m', 'u'=>'n', 'v'=>'o', 'w'=>'p', 'x'=>'q', 'y'=>'r', 'z'=>'s', ' '=>'t'},
    }
    assert_equal expected, encrypt.shifted_character_sets
  end

  def test_it_can_shift_message_characters
    encrypt = Encryptor.new("hello world", "02715", "040895")
    expected = ({:a=>["k", "r", "u"], :b=>["e", " ", "l"], :c=>["d", "o", "w"], :d=>["e", "h"]})
    assert_equal expected, encrypt.shift_message_characters
  end

  def test_it_can_encrypt_message
      encrypt = Encryptor.new("hello world", "02715", "040895")
      assert_equal "keder ohulw", encrypt.encrypt_message
  end
end
