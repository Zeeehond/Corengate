// TODO LIST
// start menu with start exit and highscore board
// reset whole game when you get hit
// power-up suitcase, you can then shoot the suitcase 
// you can only shoot 1 time and destroy a enemy if you pick up a power-up (suitcase) you can stack the suitcase 3x 
// highscore board
// changing background after a certain time.
// power up rollband makes you faster.
// power up makes you invinicble for a moment.
// random spawn of power-ups

//
float y =1;
float speed = 1;
PImage d;
int bx = 390;
int by = 400;
int  stage = 0;
boolean alive = true;
int m = millis() /100;
int score = m /10;


Lanes theLns = new Lanes ();
Char theChr = new Char();
Enemy theNmy = new Enemy();
PowerUp powerUp = new PowerUp();
PowerSpeed powerSpeed = new PowerSpeed();

void setup() {
  size(1024, 720);
  d = loadImage("bg.png");
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of the image
  // is 1024 x 720 pixels.
  theChr.init(); 
  theNmy.init();
  powerUp.init();
  powerSpeed.init();
  smooth();
  rectMode(CENTER);
  noStroke();

  if (key == CODED) {
    if (keyCode == ESC) {
      //Exit
    }
  }
}




void keyPressed() {
  theChr.keyPressed();

  if (key == 'x') {
    if (powerUp.CanShoot) {
      shots.add(new Shot(theChr.x, theChr.y+10, map(theChr.x, 0, width, 1, 8)));

      powerUp.CanShoot=false;
    }
  }

  if (key == 'z') {
    if (!alive) {
      reset();

      loop();
    }
  }
}

void updateMe() {
  //theLns.updt();
  theChr.update();
  theNmy.update();
  powerUp.update();
  powerSpeed.update();
}

void drawMe() {

  theLns.draw();
  theChr.draw();
  theNmy.draw();
  powerUp.draw();
  powerSpeed.draw();
  fill(0, 0, 255);
  textSize(20);


  // Draw shots and remove any that have gone off screen.
  for (int i=shots.size()-1; i>0; i--)if (shots.get(i).draw())shots.remove(i);
}

// Tracks all shots.
ArrayList<Shot> shots = new ArrayList();

void reset() { 
  alive = true;
  score = 0;
  theNmy.enemySpeed = 1;
  speed = 1; 
  theChr.init(); 
  theNmy.init();
  powerUp.init();
  theNmy.draw();
  powerUp.draw();
  powerSpeed.draw();
}


//------------------------------------- DO NOT CROSS THIS LINE --------------------------------------------

void draw() {
  updateMe();
  drawMe();
}