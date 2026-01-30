float angle = 0;

void setup() {
  size(600, 600, P3D);  // Activer la 3D
  stroke(0);
}

void draw() {
  background(255); // efface l'ancien schéma
  translate(width/2, height/2, 0); // déplace le cube au centre

  // Les rotations permanentes suivant les trois axes
  rotateX(angle); 
  rotateY(angle);
  rotateZ(angle);
 
  // Rotations suivant la souris
  rotateX(-map(mouseY, 0, height, -PI, PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  
  // Dessin du cube
  fill(0, 150, 255);//Couleur de remplissage (bleu)
  box(100); // cube
  
  angle+=0.01; // angle et vitesse de rotation 
}
