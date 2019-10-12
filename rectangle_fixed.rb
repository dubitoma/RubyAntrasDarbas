# frozen_string_literal: true

# :nodoc:
class Rectangle
  def initialize(plot, ilg, x_f, y_f)
    @rect_plot = plot
    @rect_ilg = ilg
    @rect_xf = x_f
    @rect_yf = y_f
  end

  def calculate_plotas
    @rect_ilg * @rect_plot
  end

  def calculate_perimetras
    (@rect_ilg + @rect_plot) * 2
  end

  def calculate_istrizaine
    Math.sqrt(@rect_ilg**2 + @rect_plot**2)
  end

  def calculate_centre_x
    @rect_xf + @rect_ilg.to_f / 2
  end

  def calculate_centre_y
    @rect_yf + @rect_plot.to_f / 2
  end
end

rect1 = Rectangle.new(3, 4, 1, 2)
puts "Plotas: #{rect1.calculate_plotas}
Perimetras: #{rect1.calculate_perimetras}
Istrizaine: #{rect1.calculate_istrizaine}
Centre Coordinates: (#{rect1.calculate_centre_x}.#{rect1.calculate_centre_y})"
