// Variables globales
float posX, posY, speedX, speedY;
float ballSize = 80; // diamètre

void setup(){
  size(800, 400);    // taille de la fenêtre
  posX = width/2;
  posY = height/2;

  // vitesses initiales
  speedX = 5;
  speedY = 7;
}

void draw(){
  background(255);

  // mise à jour de la position
  posX += speedX;
  posY += speedY;

  // rayon de la balle
  float r = ballSize / 2;

  // rebond horizontal
  if (posX - r <= 0 || posX + r >= width) {
    speedX *= -1;
  }

  // rebond vertical
  if (posY - r <= 0 || posY + r >= height) {
    speedY *= -1;
  }

  // dessin de la balle
  fill(100, 150, 240);
  ellipse(posX, posY, ballSize, ballSize);
}
