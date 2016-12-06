class Star {


  int diameter, radius;
  int x;
  int y;
  int clrstar;
  int starX = 512;
  float starY;
  float star =1;
  int starLane;  
  int STARCounter;


  boolean STAR = false;

  void init () {
    STARCounter = 0;

    diameter = 50;
    radius = diameter /2;
    clrstar = color (253, 245, 36 );

    starY = -100;
  }
  void setup() {
  }

  void respawn() {

    starY = starLane;
    starLane = int(random(20));

    if (starLane == 0) {
      starX = 362;
    }
    if (starLane == 1) {
      starX = 512;
    }
    if (starLane == 2) {
      starX = 662;
    }
  }



  void update() {
    move();

    if (starY > height) {
      respawn();
    }
    if (dist(theChr.x, theChr.y, starX, starY) < radius + theChr.radius) {
      // Collision
      STAR = true;
    }
    if (STAR == true) {
      STARCounter ++;
      if (STARCounter == 300) {
        STAR = false;
        STARCounter = 0;
      }





      respawn();
    }
  }


  void draw() {
    fill(clrstar);
    ellipse(starX, starY, radius, radius);
  }


  void move() {
    // Change the x location by speed
    starY = starY + star;
  }
}