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
  int tintClr;

  boolean STAR = false;

  void init () {
    STARCounter = 0;

    diameter = 50;
    radius = diameter /2;
    clrstar = color (253, 245, 36 );

    starY = -100;
  }

  void respawn() {
    if (t == 0) {
      starY = starLane;
      starLane = int(random(50));

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
  }



  void update() {
    move();

    if (dist(theChr.x, theChr.y, starX, starY) < theChr.lengte /2 - 33) {
      // Collision
      STAR = true;
      respawn();
    }    
    if (STAR == true) {
      starX = 512;
      STARCounter ++;

      tintClr = int(random(5));
      if (tintClr == 0) {
        tint(255, 255, 0);
      }
      if (tintClr == 1) {
        tint(255, 200, 0);
      }
      if (tintClr == 2) {
        tint(255, 255, 0);
      }
      if (tintClr == 3) {
        tint(255, 255, 0);
      }
      if (tintClr == 4) {
        tint(255, 200, 0);
      }
    }


    if (STARCounter == 300) {
      STAR = false;
      STARCounter = 0;
      noTint();
    }

    if (starY > height) {
      respawn();
    }
  }


  void draw() {

    fill(clrstar);
    ellipse(starX, starY, radius, radius);
  }


  void move() {
    // Change the x location by speed
    starY++;
    starY = starY + star;
  }
}