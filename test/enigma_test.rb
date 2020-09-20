require "minitest/autorun"
require "minitest/pride"
require './test/test_helper'
require "./lib/enigma"

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_can_read_message
    enigma = Enigma.new
    assert_equal 'hello world', enigma.message.read.chomp
  end

  def test_it_can_encrypt_message
    enigma = Enigma.new
    expected = ({
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                })
    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')
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
