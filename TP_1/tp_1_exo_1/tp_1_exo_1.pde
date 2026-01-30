// Partie 1 
void setup (){
  background(255); // Couleur blanche d'arrière-plan
  size(900, 400); // Taille de la fênetre
  colorMode(HSB,1); // Couleur sur une échelle de 0 à 1
}

// Partie 2
void draw(){
for (int x = 0; x < width; x++) {  // Boucles de 0 à largeur de la fênetre 
    color c = color(map(x,0, width,0,1),1,1);
    stroke(c); // couleur du tracé
    line(x, 0, x, height); // ligne verticale en fonction de la hauteur de la feuille
  }
}
