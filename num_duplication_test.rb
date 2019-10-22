# frozen_string_literal: true

require 'test/unit'
require_relative 'num_duplication'

class DuplicationTest < Test::Unit::TestCase
  def test_simple_duplication
    assert_equal 112233, metodas(123), 'should return duplicated value 112233'
  end

  def test_zero_duplication
    assert_equal 0, metodas(0), 'should return value zero'
  end

  def test_input_check
    assert_equal false, check('adwgwaw'), 'should return false as input is not integer'
  end
end
