class Lanes {


  void draw() {
    background(0);

    y+=speed;
    y%=height;
    image(d, 0, int(y));
    image(d.get(0, d.height-int(y), d.width, int(y)), 0, 0);
    text("score: " + score/10, 10, 50);

    if (alive==false) {
      fill(255, 40, 10);
      textSize(50);
      text("Game Over " + "\n" + "Your score: " + score/10, 287, 360);
      text("Press 'z' to restart", 287, 490);
      noLoop();
    }
  }
}