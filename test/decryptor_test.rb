require './test/test_helper'
require 'date'
require 'mocha/minitest'

class DecryptorTest < Minitest::Test

  def test_it_exists
    decryptor = Decryptor.new("keder ohulw", "02715", "040895")
    assert_instance_of Decryptor, decryptor
  end

  def test_it_has_attributes
    decryptor = Decryptor.new("keder ohulw", "02715", "040895")
    assert_equal "keder ohulw", decryptor.cipher_text
    assert_equal "02715", decryptor.key
    assert_equal "040895", decryptor.date
    assert_equal [:a, :b, :c, :d], decryptor.shift_categories
    expected = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', ' ']
    assert_equal expected, decryptor.characters
  end
end
