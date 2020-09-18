require './test/test_helper'
require 'mocha/minitest'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new
    assert_instance_of Encrypt, encrypt
  end

  def test_it_can_generate_key
    encrypt = mock("Encrypt Object")
    encrypt.stubs(:generate_key).returns("12345")
    assert_equal "12345", encrypt.generate_key
  end
end
