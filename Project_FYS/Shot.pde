class Shot {


  float px, py, vy;
  int radius;
  int diameter;
  
  Shot(float ipx, float ipy, float ivy) {
    px = ipx + 53;
    ipx = theChr.x;
    py = ipy;
    ipy=theChr.y;
    vy=ivy;
    radius = 10;
    diameter = radius * 2;
  }
  boolean draw() { 
    fill(312, 53, 99);  
    ellipse(px, py, 20, 20);
    py-=vy;
    return(py > height+10);
  }
} 