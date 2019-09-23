using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;



namespace AntrasDarbas
{
    class Chronometer
    {
        // atributai
        Stopwatch stopwatch = new Stopwatch();
        Stopwatch gettime = new Stopwatch();
        Stopwatch pauze = new Stopwatch();
        bool isrunning;
        bool pauzeslaikas;
        TimeSpan laikas;

        // konstruktoriai
        public Chronometer()
        {
            isrunning = false;
            pauzeslaikas = false;
          
        }


        // metodai
        public void Startas()
        {
       
            stopwatch.Start();

            Console.WriteLine("Laikas skaiciuoti pradetas!");
            Console.WriteLine("laikas: {0:hh\\:mm\\:ss}", stopwatch.Elapsed);

           

        }
      public TimeSpan Stopas()
        {
 
            stopwatch.Stop();
            gettime.Stop();        
            laikas = stopwatch.Elapsed;
            stopwatch.Reset(); //atstatomas laikas
            gettime.Reset();  // <------ SAME
            isrunning = false;
            return laikas;

           
        }

        public TimeSpan Getlaptime()
        {
            if (isrunning) // tikrinama ar jau pradedas getlap laikmatis
            {
                gettime.Stop();
                laikas = gettime.Elapsed;
                gettime.Reset();
                gettime.Start();
                return laikas;
            }
            else
            {
                
                isrunning = true; // nustatoma true reiksme tikrinimui
                gettime.Start();
                return stopwatch.Elapsed;

            }
            
  
        }


        public void pat()
        {
            Console.WriteLine("esamas laikas: {0:hh\\:mm\\:ss}", stopwatch.Elapsed);
        }


    }
}
