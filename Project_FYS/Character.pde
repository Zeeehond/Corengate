class Char {

  //variabelen
  int x, y; // Positie
  int vx; // snelheid
  int radius; //diameter
  int clr; // kleur
  int lane; // welke lane is de character
  int spriteFrame = 0; //laat de animatiecycle beginnen op de eerste frame
  PImage char0, char1, char2, char3; //afbeeldingen voor de character
  int lengte; //lengte van de charactersprite
  int breedte; //breedte van de charactersprite

  void init () {
    char0 = loadImage("character-0.png");
    char1 = loadImage("character-1.png");
    char2 = loadImage("character-2.png");
    char3 = loadImage("character-3.png");
    //void init  initialiseert de variabelen
    
    //hoe groot is de character
    //radius = 45;
    lengte = 180;
    breedte = 111;
    //waar bevind de character zich
    x = width/2 - breedte/2;
    y = height - lengte; 
    //welke kleur krjgt de character
    clr = color (0, 255, 80);
    lane = 1;
  }


  void keyPressed() {
    //Controls van de Character
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

  void update() {
    //Zorgt ervoor dat de speler niet van de lanes af kan gaan.
    if (lane < 0) {
      lane = 0;
      x = width/2 - 205;
    }

    if (lane > 2) {
      lane = 2;
      x = width/2 + 95;
    }
    
    //Animatie van de character
    spriteFrame++;
    if (spriteFrame == 21) spriteFrame = 0;
  }

  void draw () {
    // De Character      
    //fill (clr);
    //noStroke();
    //ellipse(x, y, radius*2, radius*2);
    
    if (spriteFrame <= 5){
      image(char0, x, y, breedte, lengte);
    } else if (spriteFrame > 5 && spriteFrame <= 10) {
      image(char1, x, y, breedte, lengte);
    } else if (spriteFrame > 10 && spriteFrame <= 15) {
      image(char2, x, y, breedte, lengte);
    } else if (spriteFrame > 15 && spriteFrame <= 20) {
      image(char3, x, y, breedte, lengte);
    }
  }
}