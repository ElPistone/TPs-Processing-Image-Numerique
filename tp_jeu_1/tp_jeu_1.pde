// --- VARIABLES GLOBALES ---
Personnage p;
ArrayList<Plateforme> plateformes;
ArrayList<Ennemi> ennemis;
ArrayList<Obstacle> obstacles;

float gravite = 0.8;
int score = 0;
boolean gameOver = false;
int timerEnnemi = 0;
int delaiEnnemi = 100; // Fréquence d'apparition des ennemis

void setup() {
  size(800, 600);
  reinitialiserJeu();
}

void draw() {
  if (gameOver) {
    afficherGameOver();
    return;
  }

  background(240);

  // 1. CALCUL DU SCROLLING (Le mouvement du monde)
  float scrollingSpeed = 0;
  // Si le perso dépasse le milieu de l'écran et qu'il va vers la droite
  if (p.x >= width / 2 && p.vitesseX > 0) {
    scrollingSpeed = -p.vitesseX; // Le monde recule à la vitesse où le perso avance
  }

  // 2. MISE À JOUR DU PERSONNAGE
  p.update(scrollingSpeed);

  // 3. GESTION DU SCORE
  if (frameCount % 60 == 0) score += 10;

  // 4. GESTION DES PLATEFORMES
  for (int i = plateformes.size() - 1; i >= 0; i--) {
    Plateforme plat = plateformes.get(i);
    plat.update(scrollingSpeed);
    plat.dessiner();

    // Recyclage des plateformes qui sortent à gauche (sauf le sol initial)
    if (plat.x + plat.largeur < 0 && i != 0) {
      plat.x = width + random(50, 200);
      plat.y = random(200, 450);
    }
  }

  // 5. GESTION DES ENNEMIS
  timerEnnemi++;
  if (timerEnnemi >= delaiEnnemi) {
    genererEnnemi();
    timerEnnemi = 0;
  }

  for (int i = ennemis.size() - 1; i >= 0; i--) {
    Ennemi e = ennemis.get(i);
    e.update(scrollingSpeed);
    e.dessiner();

    // Collision avec Ennemi
    if (p.getCollision(e.x, e.y, e.largeur, e.hauteur)) {
      gameOver = true;
    }

    if (e.x + e.largeur < 0) ennemis.remove(i);
  }

  // 6. GESTION DES OBSTACLES
  for (Obstacle obs : obstacles) {
    obs.update(scrollingSpeed);
    obs.dessiner();
    if (p.getCollision(obs.x, obs.y, obs.largeur, obs.hauteur)) {
       p.x -= 2; // Repousse un peu le joueur
    }
  }

  // 7. DESSIN DU PERSONNAGE & INTERFACE
  p.dessiner();
  afficherInterface();
}

// --- LOGIQUE DE COLLISION & GÉNÉRATION ---

void genererEnnemi() {
  // On place l'ennemi sur la dernière plateforme à droite
  float yEnnemi = random(200, 500);
  ennemis.add(new Ennemi(width + 50, yEnnemi, 30, 30));
}

void reinitialiserJeu() {
  score = 0;
  gameOver = false;
  p = new Personnage(50, height - 150, 40, 40);
  plateformes = new ArrayList<Plateforme>();
  ennemis = new ArrayList<Ennemi>();
  obstacles = new ArrayList<Obstacle>();

  // Sol de base
  plateformes.add(new Plateforme(0, height - 50, width * 2, 50));
  // Quelques plateformes de départ
  plateformes.add(new Plateforme(300, 400, 150, 20));
  plateformes.add(new Plateforme(600, 300, 150, 20));
  
  obstacles.add(new Obstacle(500, height - 80, 30, 30));
}

// --- CLASSES ---

class Personnage {
  float x, y, largeur, hauteur;
  float vitesseX, vitesseY;
  boolean enAir = true;

  Personnage(float x, float y, float l, float h) {
    this.x = x; this.y = y; this.largeur = l; this.hauteur = h;
  }

  void update(float scroll) {
    // Gravité
    vitesseY += gravite;
    y += vitesseY;
    
    // Déplacement X (si on ne scrolle pas, on avance, sinon on reste au centre)
    if (scroll == 0) {
      x += vitesseX;
    }
    x = constrain(x, 0, width/2); // Bloque le perso au milieu max

    // Détection sol/plateformes
    boolean surTerre = false;
    for (Plateforme plat : plateformes) {
      if (vitesseY >= 0 && x + largeur > plat.x && x < plat.x + plat.largeur) {
        if (y + hauteur >= plat.y && y + hauteur <= plat.y + vitesseY + 5) {
          y = plat.y - hauteur;
          vitesseY = 0;
          enAir = false;
          surTerre = true;
        }
      }
    }
    if (!surTerre) enAir = true;
    
    // Mort par chute
    if (y > height) gameOver = true;
  }

  void dessiner() {
    fill(0, 100, 255);
    rect(x, y, largeur, hauteur);
  }

  boolean getCollision(float ox, float oy, float ol, float oh) {
    return x < ox + ol && x + largeur > ox && y < oy + oh && y + hauteur > oy;
  }
}

class Plateforme {
  float x, y, largeur, hauteur;
  Plateforme(float x, float y, float l, float h) {
    this.x = x; this.y = y; this.largeur = l; this.hauteur = h;
  }
  void update(float s) { x += s; }
  void dessiner() { fill(100, 200, 100); rect(x, y, largeur, hauteur); }
}

class Ennemi {
  float x, y, largeur, hauteur, speed;
  Ennemi(float x, float y, float l, float h) {
    this.x = x; this.y = y; this.largeur = l; this.hauteur = h;
    this.speed = random(-4, -2);
  }
  void update(float s) { x += (speed + s); }
  void dessiner() { fill(255, 50, 50); rect(x, y, largeur, hauteur); }
}

class Obstacle {
  float x, y, largeur, hauteur;
  Obstacle(float x, float y, float l, float h) {
    this.x = x; this.y = y; this.largeur = l; this.hauteur = h;
  }
  void update(float s) { x += s; }
  void dessiner() { fill(100); rect(x, y, largeur, hauteur); }
}

// --- INPUTS ---

void keyPressed() {
  if (gameOver && (key == 'r' || key == 'R')) reinitialiserJeu();
  if (keyCode == LEFT) p.vitesseX = -5;
  if (keyCode == RIGHT) p.vitesseX = 5;
  if ((key == ' ' || keyCode == UP) && !p.enAir) {
    p.vitesseY = -18;
    p.enAir = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT) p.vitesseX = 0;
}

void afficherInterface() {
  fill(0); textSize(20);
  text("Score: " + score, 20, 30);
}

void afficherGameOver() {
  background(0); fill(255); textAlign(CENTER);
  text("GAME OVER\nScore: " + score + "\nPressez R", width/2, height/2);
  textAlign(LEFT);
}
