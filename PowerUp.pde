class PowerUp {


  int diameter, radius;

  int x;
  int y;
  int clrPowerUp;
  int PowerUpX = 512;
  float PowerUpY;
  float PowerUpSpeed =1;
  int PowerUpLane;  

  boolean CanShoot = false;


  void init () {


    diameter = 50;
    radius = diameter /2;
    clrPowerUp = color (0, 0, 255);

    PowerUpY = -100;
  }




  void draw() {

    move();

    fill(clrPowerUp);
    ellipse(PowerUpX, PowerUpY, radius, radius);
    PowerUpY ++;

    if (PowerUpY > height) {
      PowerUpY = PowerUpLane;
      PowerUpLane = int(random(15));

      if (PowerUpLane == 0) {
        PowerUpX = 362;
      }
      if (PowerUpLane == 1) {
        PowerUpX = 512;
      }
      if (PowerUpLane == 2) {
        PowerUpX = 662;
      }
    }

    if (dist(theChr.x, theChr.y, PowerUpX, PowerUpY) < radius) {
      // Collision

      CanShoot=true;
      println("alksjhdadkalsdjaklsaj");
    }

    if (dist(x, PowerUpY, theNmy.x, theNmy.enemyY) < radius) {
      // Collision
    }

    if (theNmy.y==PowerUpY) {

      theNmy.y = -1000;
    }
  }
  void move() {
    // Change the x location by speed
    PowerUpY = PowerUpY + PowerUpSpeed;
  }
}