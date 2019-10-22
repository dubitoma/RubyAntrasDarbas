require "test/unit"
require_relative 'vigenere'

class VigenereTest < Test::Unit::TestCase
  def test_encrypt
    assert_equal 'sfbal', encrypt('zodis', 'trys', 'encrypt')
  end

  def test_each_in_text_encrypt
    assert_equal ['z','o','d','i','s'], each_in_text_encrypt('zodis'.split(''), [], 0, 'trys', 'encrypt')
  end

  def test_get_joined_string
    assert_equal 'zodis', get_joined_string(['z','o','d','i','s'])
  end

  def test_check_upper
    assert_equal false, check_upper('zodis', 0)
  end

  def test_get_m_k
    assert_equal [14,0], get_m_k('ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split(''), 1, ['z','o','d','i','s'], ['t','r','y','s'], 0)
  end

  def test_encrypt_method
    assert_equal 't', encrypt_method([19, 19, 0, 0], 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split(''), [], false)
  end

  def test_decipher_method
    assert_equal 'K', decipher_method([10, 16, 6, 0], 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split(''), [0], true)
  end
end
