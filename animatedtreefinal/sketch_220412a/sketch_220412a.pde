PImage img;

class pathfinder {
  PVector location;
  PVector velocity;
  float diameter;
  boolean isFinished;
  float w;
  float h;


  pathfinder() {
    location = new PVector(width/2, height);
    velocity = new PVector(0, -1);
    diameter = 10;
    isFinished = true;
  }
  
  
   pathfinder(float w, float h) {
    location = new PVector(w, h);
    velocity = new PVector(0, -1);
    diameter = 10;
    isFinished = false;
  }

  pathfinder(pathfinder parent) {
    location = parent.location.get();
    velocity = parent.velocity.get();
    float area = PI*sq(parent.diameter/2);
    float newDiam = sqrt(area/2/PI)*2;
    diameter = newDiam;
    parent.diameter = newDiam;
    isFinished = parent.isFinished;
  }

  void update() {
    if (diameter>0.5) {
      location.add(velocity);
      PVector bump = new PVector(random(-1, 1), random(-1, 1));
      bump.mult(0.09);   ///branch straightness
      velocity.add(bump);
      velocity.normalize();
      if (random(0, 1)<0.03) {   ////growth size
        paths = (pathfinder[]) append(paths, new pathfinder(this));
      }
    } else {
      if (!isFinished) {
        isFinished=true;
        noStroke();

        //fill(0, 166, 137, 137); // berry
         fill(random(50,100), random(100,250), random(0,150)); // berry
        ellipse(location.x, location.y, 5, 10);
        stroke(230, 255, 255, 50);
      }
    }
  }
}

pathfinder[] paths;



void setup() {


  size(1000, 800);
  img = loadImage("coverart.jpg");
  background(0);
  ellipseMode(CENTER);
  fill(255);
  noStroke();
  smooth();
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}


void sky() {
  textSize(50);
  fill(color(255));


  fill(0, 300, 512, 1000);

  //background(0);
  fill(0, 20);
  //rect(0, 0, width, height);
  fill(100);
  noStroke();
  ellipse(random(width), random(height), 1, 2);
  line(mouseX, mouseY, random(width), random(height));
}

void tree() {
  for (int i=0; i<paths.length; i++) {
    PVector loc = paths[i].location;
    float diam = paths[i].diameter;
    ellipse(loc.x, loc.y, diam, diam);
    paths[i].update();
  }
}



boolean grow=false;
int trees=0;



void draw() {
  image(img, 0, 0, width, 258);

  //tree();


  sky();
  if (mousePressed == true) {
    grow=true;
    trees+=1;
    //println(trees);
    if (trees < 25){
    paths[0] = new pathfinder(mouseX,mouseY);
    }else{
      setup();
      grow=false;
      trees=0;
    }
  }

  if (grow==true) {
    tree();
      //paths = new pathfinder[1];
 

   
  }
}

//void mousePressed() {
////background(0);
//paths = new pathfinder[1];
//paths[0] = new pathfinder();

//}
