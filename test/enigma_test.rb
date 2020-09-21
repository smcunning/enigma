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
    assert_equal "hello world", enigma.date
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
  end

  def test_it_can_decrypt_message
    enigma = Enigma.new
    expected = ({
                encryption: "hello world",
                key: '02715',
                date: '040895'
                })
    assert_equal expected, enigma.decrypt("keder ohulw", '02715', '040895')
  end
end
