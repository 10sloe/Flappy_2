/* Ein Hindernis das aus einem Rechteck oben
*  und einem Rechteck unten besteht
*/
class Hindernis
{
  // Attribute
  float x;   // x-Koordinate
  float yo;  // obere Grenze des Zwischenraums
  float yu;  // untere Grenze des Zwischenraums
  float breite;  // Breite der Rechtecke
  float v;    // Geschwindigkeit des Hindernis
  
  // Konstruktor
  Hindernis(float x_)
  {
    x = x_;
    yo = random(150);    // Die obere Grenze des Zwischenraums wird
                         // zufällig gewählt
    yu = yo + random(100) + 100;   // Der Zwischenraum wird zufällig gewählt
    breite = 30;
    v = -2;
  }
  
  // Methoden
   // Das Hindernis wird nach links bewegt, wenn es 
   // den Bildschirm verlässt, wird es rechts wieder eingestellt
   void bewegen()    { 
    x = x + v;
    if(x < 0 - breite)
    { 
      x = 600;
      yo = random(150);    // Die obere Grenze des Zwischenraums wird
                           // zufällig gewählt
      yu = yo + random(100) + 100;   // Der Zwischenraum wird zufällig gewählt
      
    }
  }
  
  void zeichnen()
  {
    fill(0,255,0);
    rect(x,0,breite,yo);
    rect(x,yu,breite,400-yu);
  }
  
  // Hier wird geprüft, ob sich der Vogel und das Hindernis schneiden
  boolean kollisionPruefen(Vogel vogel)
  {
    boolean kollision = false;
    
    float vogelX = vogel.getX();
    float vogelY = vogel.getY();
    float vogelRadius = vogel.getRadius();
    
    
    if (x < vogelX+vogelRadius && x + breite > vogelX-vogelRadius)
    {
      if (vogelY - vogelRadius < yo)
      {
        kollision = true;
      }
      if (vogelY + vogelRadius > yu)
      {
        kollision = true;
      }   
    }
    return kollision;
  }
}
