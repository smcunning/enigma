require './test/test_helper'
require 'date'
require 'mocha/minitest'

class DecryptorTest < Minitest::Test

  def test_it_exists
    decryptor = Decryptor.new
    assert_instance_of Decryptor, decryptor
  end
end
