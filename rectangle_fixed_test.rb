require "test/unit"
require_relative 'rectangle_fixed'

class TestRectangle < Test::Unit::TestCase
  def test_calculate_plotas
    assert_equal 12, Rectangle.new(3, 4, 1, 2).calculate_plotas, "Rectangle.calculate_plotas should return value 12"
  end

  def test_calculate_perimetras
    assert_equal 14, Rectangle.new(3, 4, 1, 2).calculate_perimetras, "Rectangle.calculate_perimetras should return value 14"
  end

  def test_calculate_istrizaine
    assert_equal 5.0, Rectangle.new(3, 4, 1, 2).calculate_istrizaine, "Rectangle.calculate_istrizaine should return value 5.0"
  end

  def test_calculate_centre_x
    assert_equal 3.0, Rectangle.new(3, 4, 1, 2).calculate_centre_x, "Rectangle.calculate_centre_x should return value 3.0"
  end

  def test_calculate_centre_y
    assert_equal 3.5, Rectangle.new(3, 4, 1, 2).calculate_centre_y, "Rectangle.calculate_centre_y should return value 3.5"
  end
end
