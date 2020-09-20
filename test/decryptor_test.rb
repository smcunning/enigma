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

  def test_it_can_assign_shift_categories_to_message
    decryptor = Decryptor.new("keder ohulw", "02715", "040895")
    expected = ({:a=>['k','r','u'], :b=>['e',' ','l'], :c=>['d','o','w'], :d=>['e', 'h']})
    assert_equal expected, decryptor.set_message_to_shift_categories
  end

  def test_it_can_shift_character_sets
    decryptor = Decryptor.new("keder ohulw", "02715", "040895")
    expected = {
                :a=>{"a"=>"y", "b"=>"z", "c"=>" ", "d"=>"a", "e"=>"b", "f"=>"c", "g"=>"d", "h"=>"e", "i"=>"f", "j"=>"g", "k"=>"h", "l"=>"i", "m"=>"j", "n"=>"k", "o"=>"l", "p"=>"m", "q"=>"n", "r"=>"o", "s"=>"p", "t"=>"q", "u"=>"r", "v"=>"s", "w"=>"t", "x"=>"u", "y"=>"v", "z"=>"w", " "=>"x"},
                :b=>{"a"=>"a", "b"=>"b", "c"=>"c", "d"=>"d", "e"=>"e", "f"=>"f", "g"=>"g", "h"=>"h", "i"=>"i", "j"=>"j", "k"=>"k", "l"=>"l", "m"=>"m", "n"=>"n", "o"=>"o", "p"=>"p", "q"=>"q", "r"=>"r", "s"=>"s", "t"=>"t", "u"=>"u", "v"=>"v", "w"=>"w", "x"=>"x", "y"=>"y", "z"=>"z", " "=>" "},
                :c=>{"a"=>"i", "b"=>"j", "c"=>"k", "d"=>"l", "e"=>"m", "f"=>"n", "g"=>"o", "h"=>"p", "i"=>"q", "j"=>"r", "k"=>"s", "l"=>"t", "m"=>"u", "n"=>"v", "o"=>"w", "p"=>"x", "q"=>"y", "r"=>"z", "s"=>" ", "t"=>"a", "u"=>"b", "v"=>"c", "w"=>"d", "x"=>"e", "y"=>"f", "z"=>"g", " "=>"h"},
                :d=>{"a"=>"h", "b"=>"i", "c"=>"j", "d"=>"k", "e"=>"l", "f"=>"m", "g"=>"n", "h"=>"o", "i"=>"p", "j"=>"q", "k"=>"r", "l"=>"s", "m"=>"t", "n"=>"u", "o"=>"v", "p"=>"w", "q"=>"x", "r"=>"y", "s"=>"z", "t"=>" ", "u"=>"a", "v"=>"b", "w"=>"c", "x"=>"d", "y"=>"e", "z"=>"f", " "=>"g"}
              }
    assert_equal expected, decryptor.shifted_character_sets
  end

  def test_it_can_shift_message_characters
    decryptor = Decryptor.new("keder ohulw", "02715", "040895")
    expected = ({:a=>['h','o','r'], :b=>['e',' ','l'], :c=>['l','w','d'], :d=>['l', 'o']})
    assert_equal expected, decryptor.shift_message_characters

    encrypt_2 = Encryptor.new("o33m", "02715", "040895")
    expected_2 = ({:a=>["l"], :b=>["3"], :c=>["3"], :d=>["t"]})
    assert_equal expected_2, encrypt_2.shift_message_characters
  end
end
