class Lanes {

  //
  void update() {
   y+=speed;
   y%=height; 
}
    void draw() {
      background(0);
      image(d, 0, int(y));
      image(d.get(0, d.height-int(y), d.width, int(y)), 0, 0);
      text("score: " + scoore, 10, 50);
  }
}