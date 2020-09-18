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

  def test_it_can_set_key_shifts
    encrypt = mock("encrypt Object")
    encrypt.stubs(:generate_key).returns("12345")
    key = encrypt.generate_key
    assert_equal ({a: 12, b: 23, c: 34, d: 45}), encrypt.set_key_shifts(key)
  end
end
