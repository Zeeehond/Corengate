class PowerDown {


  int diameter, radius;

  int x;
  int y;
  int clrPowerDown;
  int PowerDownX = 512;
  float PowerDownY;
  float PowerDown = -1;
  int PowerDownLane;  


  void init () {


    diameter = 50;
    radius = diameter /2;
    PowerDownLane = color (0, 150, 150 );

    PowerDownY = -100;
  }


  void respawn() {

    PowerDownY = PowerDownLane;
    PowerDownLane = int(random(5));

    if (PowerDownLane == 0) {
      PowerDownX = 362;
    }
    if (PowerDownLane == 1) {
      PowerDownX = 512;
    }
    if (PowerDownLane == 2) {
      PowerDownX = 662;
    }
  }



  void update() {
    move();
// de powerdown spawnr pas wanneer er 1000 punten zijn
    if (score >= 1000) {
      if (PowerDownY > height) {
        respawn();
      }
      // collision van de speler met de powerdown
      if (overlapsPlayer((int)PowerDownX, (int)PowerDownY)) {
        // de effecten van de collision
        scorecount += 500;
        theNmy.enemySpeed -= 1.5;
        theNmy2.enemySpeed2 -= 1.5;
        speed += 1;
        respawn();
      }
    }
  }


  void draw() {
    fill(clrPowerDown);
    ellipse(PowerDownX, PowerDownY, radius, radius);
  }

  void move() {
    // Change the x location by speed
    PowerDownY = PowerDownY + PowerDown;
  }
}