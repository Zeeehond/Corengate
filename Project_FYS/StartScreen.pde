// The startscreen hold all functionality for a start screen
class StartScreen {

  // The background image
  PImage startScreenImage;

  // Initialize the image
  void init() {
    startScreenImage = loadImage("nyan_start.png");
  }


  void update() {
    // react on keypresses and celect level

    //
  }
  // update and draw startscreen
  void updateAndDraw() {
    update();

    image(startScreenImage, 0, 0);
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("Select wisely!", width/2, height/2);
    textSize(16);
    text("Press LEFT or RIGHT to start the game", width/2, height/2 + 30);
    text("Press UP to open up the instruction menu", width/2, height/2 + 50);
  }
}