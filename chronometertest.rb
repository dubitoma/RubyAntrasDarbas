# frozen_string_literal: true

require 'test/unit'
require_relative 'chronometras_fixed_tikrai'
# :nodoc:
class TestChronometer < Test::Unit::TestCase
  def test_start
    s = Stopwatch.new
    num = s.start.to_s
    assert_not_nil(num, 'Item is nil')
  end

  def test_showtime
    s = Stopwatch.new
    s.start
    num = s.show_time.to_s
    assert_not_nil(num, 'Item is nil')
  end

  def test_elapsedtime
    s = Stopwatch.new
    s.start
    num = s.elapsed_time.to_s
    assert_not_nil(num, 'Item is nil')
  end
end
