using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;



namespace RectanglePrgr1uzd
{
    static void Main(string[] args)
    {
        Rectangle rec = new Rectangle(3,4,1,2);
        Console.WriteLine($"Plotas: {rect.getPlotas()} \tPerimetras: {rect.getPerimetras()} \tIstrizaine: {rect.getIstrizaine()} \tCentre Coordinates:({rect.getCentreX()}.{rect.getCentreY()})");
      
    }
    
    class Rectangle
    {
        public double plotis;
        public double ilgis;
        public float x, y;

       public Rectangle(double plot, double ilg, float xF, float yF)
        {
            plotis = plot;
            ilgis = ilg;
            x = xF;
            y = yF;
        }

        public double getPlotas()
        {
            return ilgis * plotis;
        }


        public double getPerimetras()
        {
            double prm;
            prm = ilgis + plotis;
            return prm*2;
        }

        public double getIstrizaine()
        {
            return Math.Sqrt((Math.Pow(ilgis, 2) + Math.Pow(plotis, 2)));
        }

        public float getCentreX()
        {
            float d = (float)ilgis;
            return x + d / 2;
        }

        public float getCentreY()
        {
            float d = (float)plotis;
            return y + d/ 2;
        }

    }
}
