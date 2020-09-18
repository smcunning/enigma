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
end
