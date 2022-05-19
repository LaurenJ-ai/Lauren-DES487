int numFrames = 12;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
//PImage img;    
 int i = 0;
 


void setup() {
  size(800, 800);
  frameRate(1);
  //img = loadImage("coverart.jpg");
  
  
  images[0]  = loadImage("streetsign-01.jpg");
  images[1]  = loadImage("streetsign2-02.jpg"); 
  images[2]  = loadImage("streetsign3-03.jpg");
  images[3]  = loadImage("streetsign4-04.jpg"); 
  images[4]  = loadImage("streetsign-05.jpg");
  images[5]  = loadImage("streetsign6-06.jpg"); 
  images[6]  = loadImage("streetsign7-07.jpg");
 
  
  // If you don't want to load each image separately
  // and you know how many frames you have, you
  // can create the filenames as the program runs.
  // The nf() command does number formatting, which will
  // ensure that the number is (in this case) 4 digits.
  //for (int i = 0; i < numFrames; i++) {
  //  String imageName = "PT_anim" + nf(i, 4) + ".gif";
  //  images[i] = loadImage(imageName);
  //}
} 
 
void draw() { 
  
  //image(img, 0, 0, width, 258);
  //background(0);
  //currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;
  //for (int x = -100; x < width; x += images[0].width) { 
  //  image(images[(currentFrame+offset) % numFrames], x, -20);
  //  offset+=2;
  //  image(images[(currentFrame+offset) % numFrames], x, height/2);
  //  offset+=2;
  //}
  //for (int i = 0; x < 6; x += 1) { 
   
   image(images[i], 0, 0, width, height);
   if (i <6)
     { 
     i+=1;
     }else{
       i=0;
     }
 
}
