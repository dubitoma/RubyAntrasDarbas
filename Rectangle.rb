class Rectangle
    @@no_of_rectangles = 0
    def initialize(plot, ilg, xF, yF)
        @rect_plot = plot
        @rect_ilg = ilg
        @rect_xF = xF
        @rect_yF = yF
    end

    def getPlotas()
        @rect_ilg * @rect_plot
    end   
    
    def getPerimetras()
        (@rect_ilg + @rect_plot)*2
    end

    def getIstrizaine()
        Math.sqrt(@rect_ilg ** 2 + @rect_plot ** 2 )
    end

    def getCentreX()
        @rect_xF + (@rect_ilg).to_f / 2
    end

    def getCentreY()
        @rect_yF + (@rect_plot).to_f / 2
    end
    
end

rect1 = Rectangle.new(3,4,1,2)
puts "Plotas: #{rect1.getPlotas()} Perimetras: #{rect1.getPerimetras()} Istrizaine: #{rect1.getIstrizaine()} Centre Coordinates:
(#{rect1.getCentreX()}.#{rect1.getCentreY})"