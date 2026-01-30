float angle_sphere = 0;
float angle_cubes = 0;
float angle_ellipse = 0;
float angle_triangle = 0;
float angle_rectangle = 0;
float angle_carre = 0;

void setup() {
  size(600, 400, P3D);
  stroke(0);
}

void draw() {
  background(255);
   
  // Cubes
  pushMatrix();
    pushStyle();
      translate(width/4, height/4, 0);
      rotateX(angle_cubes);
      rotateY(angle_cubes);
      rotateZ(angle_cubes);
      fill(250, 0, 100);
      box(50);
      angle_cubes += 0.01;
    popStyle();
  popMatrix();
  
  // Sphere
  pushMatrix();
    pushStyle();
      translate(width*0.75, height*0.5, 0);
      rotateX(angle_sphere);
      rotateY(angle_sphere);
      rotateZ(angle_sphere);
      stroke(240);
      fill(135, 206, 235);
      sphere(35);
      angle_sphere += 0.011; 
    popStyle();
  popMatrix();
  
  // Ellipses
  pushMatrix();
    pushStyle();
      translate(width*0.2, height*0.7, 0);
      rotateX(angle_ellipse);
      rotateY(angle_ellipse);
      rotateZ(angle_ellipse);
      stroke(240);
      fill(206, 135, 235);
      ellipse(0, 0, 80, 50);
      angle_ellipse += 0.012; 
    popStyle();
  popMatrix();
  
  // Triangles
  pushMatrix();
    pushStyle();
      translate(width*0.6, height*0.3, 0);
      rotateX(angle_triangle);
      rotateY(angle_triangle);
      rotateZ(angle_triangle);
      fill(135, 235, 150);
      triangle(-30, 30, 30, 30, 0, -30);
      angle_triangle += 0.013;
    popStyle();
  popMatrix();
  
  // Rectangles
  pushMatrix();
    pushStyle();
      translate(width*0.5, height*0.8, 0);
      rotateX(angle_rectangle);
      rotateY(angle_rectangle);
      rotateZ(angle_rectangle);
      fill(235, 200, 135);
      rectMode(CENTER);
      rect(0, 0, 80, 50);
      angle_rectangle += 0.014;
    popStyle();
  popMatrix();
    // Carré
  pushMatrix();
    pushStyle();
      translate(width*0.8, height*0.8, 0);
      rotateX(angle_carre);
      rotateY(angle_carre);
      rotateZ(angle_carre);
      fill(235, 135, 200);
      rectMode(CENTER);
      rect(0, 0, 50, 50);
      angle_carre += 0.015;
    popStyle();
  popMatrix();
}
