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
    x = width/2 - 53; //459
    y = 530; 
    //hoe groot is de character
    radius = 45;
    //welke kleur krijgt de character
    clr = color (0, 255, 80);
    lane = 1;
  }


  void keyPressed() {
    //Controls van de Character
    if (key== CODED) {
      if (keyCode == RIGHT) {
        x = x + 150;
        lane = lane + 1;
      }
    }
    if (key == CODED) {
      if (keyCode == LEFT) {
        x = x - 150;
        lane = lane - 1;
      }
    }
  }

  void update() {
    //De Lanes
    if (lane < 0) {
      lane = 0;
      x = width/3 - 32;
    }

    if (lane >2) {
      lane = 2;
      x = width/3 * 2 - 73;
    }
  }

  void draw () {
    // De Charachter      
    fill (clr);
    noStroke();
    //ellipse(x, y, radius*2, radius*2);
    image(c, x, y);
  }
}