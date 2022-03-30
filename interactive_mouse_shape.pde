void setup() {
  //set the size of window
  size(640,360);
  background (70);
  
}

void draw(){
  
  fill(random (200), random (150), 0);
  noStroke();
  rectMode(CENTER);
  ellipse(mouseX, mouseY, 100, 100);
}


  
