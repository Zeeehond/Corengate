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

  void move() {
    // Change the x location by speed
    PowerUpY ++;
    PowerUpY = PowerUpY + PowerUpSpeed;
  }

  void randomspawn() {
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
  }

  void collision() {
    //Makes the played be able to shoot once when the player picks up the powerup
    if (dist(theChr.x, theChr.y, PowerUpX, PowerUpY) < radius) {
      CanShoot=true;

      //Testing cause it won't register the first collision fully
      println("alksjhdadkalsdjaklsaj");
    }
  }


  void update() {
    move();
    randomspawn();
    collision();
  }

  void draw() {
    ellipse(PowerUpX, PowerUpY, radius, radius);
    fill(clrPowerUp);
  }
}