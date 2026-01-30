// Simulation d'un système Planétaire en 3D
// Variables globales
float angle_planet_1 = 0, 
      angle_planet_2 = 0,
      angle_planet_3 = 0,
      angle_planet_4 = 0,
      angle_moon_1 = 0,
      angle_moon_2 = 0,
      angle_moon_3 = 0;

void setup(){
  size(700, 525, P3D);
  noStroke();
}

void draw(){
  background(0); 
  
  // Lumière ambiante
  ambientLight(100, 100, 100);
  pointLight(255, 255, 255, width/2, height/2, 0);
  
  // Système Central (Soleil)
  pushMatrix();
    translate(width * 0.5, height * 0.5, 0);
    fill(255, 200, 0); // Jaune pour le soleil
    sphere(45);
  popMatrix();
  
  // Planète 1 avec lune
  pushMatrix();
    translate(width * 0.5, height * 0.5, 0);
    rotateY(angle_planet_1);
    translate(100, 0, 0);
    
    // Planète principale
    fill(100, 130, 255);
    sphere(15);
    
    // Lune
    pushMatrix();
      rotateY(angle_moon_1);
      translate(30, 0, 0);
      fill(200);
      sphere(5);
    popMatrix();
    
    angle_planet_1 += 0.02;
    angle_moon_1 += 0.05;
  popMatrix();
  
  // Planète 2 avec lune (orbite diagonale)
  pushMatrix();
    translate(width * 0.5, height * 0.5, 0);
    rotateZ(PI/4); // Inclinaison de 45 degrés
    rotateY(angle_planet_2);
    translate(150, 0, 0);
    
    // Planète principale
    fill(100, 255, 130);
    sphere(18);
    
    // Lune
    pushMatrix();
      rotateY(angle_moon_2);
      translate(35, 0, 0);
      fill(230);
      sphere(6);
    popMatrix();
    
    angle_planet_2 += 0.015;
    angle_moon_2 += 0.06;
  popMatrix();
  
  // Planète 3 avec lune
  pushMatrix();
    translate(width * 0.5, height * 0.5, 0);
    rotateY(angle_planet_3);
    translate(200, 0, 0);
    
    // Planète principale
    fill(255, 130, 255);
    sphere(20);
    
    // Lune
    pushMatrix();
      rotateY(angle_moon_3);
      translate(40, 0, 0);
      fill(230);
      sphere(7);
    popMatrix();
    
    angle_planet_3 += 0.01;
    angle_moon_3 += 0.04;
  popMatrix();
  
  // Planète 4 (sans lune)
  pushMatrix();
    translate(width * 0.5, height * 0.5, 0);
    rotateX(angle_planet_4); // Rotation différente pour variété
    rotateY(angle_planet_4);
    translate(0, 0, 120); // Orbite sur l'axe Z
    
    fill(255, 150, 100);
    sphere(22);
    
    angle_planet_4 += 0.018;
  popMatrix();
}
