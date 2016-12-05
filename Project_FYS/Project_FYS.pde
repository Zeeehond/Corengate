import processing.sound.*;
SoundFile file;

// Declaring the variables
float y =1;
float speed = 1;
PImage d;
int bx = 390;
int by = 400;
int  stage = 0;
boolean alive = true;
int scorecount = 0;
int score;


Lanes theLns = new Lanes ();
Char theChr = new Char();
Enemy theNmy = new Enemy();
PowerUp powerUp = new PowerUp();
PowerSpeed powerSpeed = new PowerSpeed();
Highscore theScore = new Highscore();



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
 
  file = new SoundFile(this, "bgmusic.mp3"); 
  file.play();
  file.stop();
  file.loop();
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
  theLns.update();
  //theChr.draw();
  //theNmy.draw();
  //powerUp.draw();
  powerSpeed.update();
  scorecount++; 
  score = scorecount/10;
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
  for (int i=shots.size()-1; i>-1; i--)if (shots.get(i).draw())shots.remove(i);

  // If player died, do this
  if (alive == false) {

    background(0);  
    theScore.setup();
    theScore.draw();
    theScore.keyPressed();
    theScore.addNewScore(score);
    noLoop();
  }
  
  
}

// Tracks all shots.
ArrayList<Shot> shots = new ArrayList();

void reset() {
  alive = true;
  theNmy.enemySpeed = 1;
  speed = 1; 
  scorecount = 0;
  score = 0;
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