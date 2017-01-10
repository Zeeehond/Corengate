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

  void update() {
    move();
    // makes the player able to shoot once when the player picks up the power-up
    if (dist(theChr.x, theChr.y, PowerUpX, PowerUpY) < theChr.charLength/2) {
      CanShoot = true;
      respawn();
    } 
    if (PowerUpY > height) {
      respawn();
    }
  }

  void draw() {

    fill(clrPowerUp);
    ellipse(PowerUpX, PowerUpY, radius, radius);
  }

  void respawn() {

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

  void move() {
    // Change the x location by speed
    PowerUpY++;
    PowerUpY = PowerUpY + PowerUpSpeed;
  }
}