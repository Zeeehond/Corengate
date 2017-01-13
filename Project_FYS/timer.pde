class Timer { 
  void update()
  {
    t = interval-int(millis()/1000);
    time = nf(t, 3);
    if (t == 0) {
      interval+=20;
    }
  }
}