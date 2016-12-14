class invTimer { 
  void update()
  {
    t = interval-int(millis()/1000);
    time = nf(t, 3);
    if (t == 0) {
      println("INVINCIBLE!!!!!!");
      interval+=20;
    }
  }
}