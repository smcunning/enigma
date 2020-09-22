require "minitest/autorun"
require "minitest/pride"
require './test/test_helper'
require "./lib/enigma"

class EnigmaTest < Minitest::Test

  def test_it_exists_with_attributes
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_message_and_change_attributes
    enigma = Enigma.new
    expected = ({
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                })
    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')
    assert_equal "hello world", enigma.message
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
  end

  def test_it_can_decrypt_message
    enigma = Enigma.new
    expected = ({
                decryption: "hello world",
                key: '02715',
                date: '040895'
                })
    assert_equal expected, enigma.decrypt("keder ohulw", '02715', '040895')
    assert_equal "keder ohulw", enigma.cipher_text
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
  end

  def test_it_can_generate_key
    enigma = Enigma.new
    assert_instance_of String, enigma.generate_key
    assert_equal 5, enigma.generate_key.length
    assert_instance_of Integer, enigma.generate_key.to_i
  end

  def test_it_can_encrypt_with_key_and_todays_date
    enigma = Enigma.new
    Date.any_instance.stubs(:strftime).returns("040895")
    expected = ({
                encryption: "keder ohulw",
                key: '02715',
                date: Date.today.strftime("%d%m%y")
                })
    assert_equal expected, enigma.encrypt("hello world", '02715')
  end

  def test_it_can_decrypt_with_key_and_todays_date
    enigma = Enigma.new
    Date.any_instance.stubs(:strftime).returns("040895")
    expected = ({
                decryption: "hello world",
                key: '02715',
                date: Date.today.strftime("%d%m%y")
                })
    assert_equal expected, enigma.decrypt("keder ohulw", '02715')
  end

  def test_it_does_nothing_with_weird_characters
    enigma = Enigma.new
    expected = ({
                encryption: "ke7e% o1u-w",
                key: '02715',
                date: '040895'
                })
    assert_equal expected, enigma.encrypt('he7l% w1r-d', '02715', '040895')

    expected_2 = ({
                decryption: "he7l% w1r-d",
                key: '02715',
                date: '040895'
                })
    assert_equal expected_2, enigma.decrypt('ke7e% o1u-w', '02715')
  end
end
