// The startscreen hold all functionality for a start screen
class InstructionScreen {

  // The background image
  PImage bgInstruction;

  // Initialize the image
  void init(){
    bgInstruction = loadImage("bgInstruction.png");
  }
  
  
  void update() {
    // react on keypresses and celect level
   
//
  }
  // update and draw startscreen
  void updateAndDraw() {
    update();

    image(bgInstruction, 0, 0);
    fill(255);
    textSize(24);
    textAlign(CENTER);
    text("Buttonlist: ",160, 370);
    text("How to play the game", 700,370);
    textSize(20);
    text("Press LEFT to move left",160, 470);
    text("Press RIGHT to move right",175, 500);
    text("It's that easy!",112, 530);
    textSize(18);
    text("Try scoring as much",670, 420);
    text("points as possible.",670, 440);
    text("This can be reached",670, 470);
    text("by dodging the upcoming",670, 490);
    text("guards and picking up all",670, 510);
    text("the different powerups.", 670, 530);
    textSize(16);
    text("Press down to return to main menu", 850, 700);
  }
}