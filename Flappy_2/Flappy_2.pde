Vogel vogel;
Hindernis h1;
Hindernis h2;


String zustand;  // startbildschirm, spielen, gameover

void setup()
{
  size(600, 400);
  zustand = "startbildschirm";
}

void starten()
{
  vogel = new Vogel(50, 200); 
  h1 = new Hindernis(600);
  h2 = new Hindernis(900);
  zustand = "spielen";
}

void draw()
{
  
  switch(zustand)
  {
  case "startbildschirm": 
    {
      background(255);
      fill(0);
      textSize(32);
      text("Startbildschirm", 100, 100);
      text("Mit einem Klick geht es los!", 100, 150);
    }
    break;
  case "spielen":
    {
      //Alle Figuren bewegen
      vogel.bewegen();
      h1.bewegen();
      h2.bewegen();


      // Kollision mit Rand / Kollision mit Hindernis?
      if (vogel.kollisionMitRand())
      {
        zustand = "gameover";
      }
      if (h1.kollisionPruefen(vogel))
      {
        zustand = "gameover";
      }
      if (h2.kollisionPruefen(vogel))
      {
        zustand = "gameover";
      }

      //Alle Figuren zeichnen
      background(255);
     
      h1.zeichnen();
      h2.zeichnen();
       vogel.zeichnen();
    }
    break;

  case "gameover":
    {
      textSize(32);
      fill(255,0,0);
      text("Game Over", 100, 100);
      text("Weiter mit einem Klick!", 100, 150);
    }
    break;
  }
}



void mouseClicked()
{
  switch(zustand)
  {
  case "startbildschirm":
    {
      starten();
    }
    break;
    
  case "spielen":
    {
      vogel.flattern();
    }
    break;

  case "gameover":
    {
      zustand = "startbildschirm";
    }
  }
}
