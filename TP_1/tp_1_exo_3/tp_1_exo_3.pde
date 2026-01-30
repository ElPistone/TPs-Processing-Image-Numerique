// Variables globales

float posX, posY;

void setup (){
  size (800, 400);
  posX = width/2;
  posY = height/2;
  noStroke();
  background(255,10);
}

void draw(){

  fill(255,100); // pour faire disparaître completement la traînée l'opacité à 100
  rect(0, 0, width, height);
  posX = lerp(posX, mouseX, 0.05);
  posY = lerp(posY, mouseY, 0.05);
  fill(0, 150, 255);
  ellipse(posX, posY, 60, 40);
  
}
