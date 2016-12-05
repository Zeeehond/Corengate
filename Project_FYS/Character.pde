class Char {

  //variabelen
  int x, y; // Positie
  int vx; // snelheid
  int radius; //diameter
  int clr; // kleur
  int lane; // welke lane is de character
  
  void init () {
    //void init  initialiseert de variabelen

    //waar bevind de character zich
    x = width/2;
    y = 620; 
    //hoe groot is de character
    radius = 45;
    //welke kleur krjgt de character
    clr = color (0, 255, 80);
    lane = 1;
  }


  void keyPressed() {

    if (key== CODED) {
      if (keyCode == RIGHT) {
        x = x+150;
        lane = lane + 1;
      }
    }
    if (key == CODED) {
      if (keyCode == LEFT) {
        x = x-150;
        lane = lane - 1;
      }
    }
  }


  void draw () {
 
    if (lane < 0) {
      lane = 0;
      x = 362;
    }
    
    if (lane >2) {
     lane = 2;
     x = 662;
    }
  
 // De Charachter      
    fill (clr);
    noStroke();
    ellipse(x, y, radius*2, radius*2); 
  }
}