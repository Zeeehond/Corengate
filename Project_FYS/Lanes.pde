class Lanes {

  //

  void update() {
    y+=speed;
    y%=height;
  }
  void draw() {
    textFont(Font1);
    background(0);
    image(d, 0, int(y));
    image(d.get(0, d.height-int(y), d.width, int(y)), 0, 0);
    fill(255, 10, 10);
    textSize(26);
    text("score: " + score, 70, 50);
  }
}