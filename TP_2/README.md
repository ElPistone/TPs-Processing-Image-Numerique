# TP2 : 3D avec Processing

## 🎯 Objectif
Découvrir la programmation 3D avec Processing, manipuler les transformations géométriques et créer des animations complexes dans l'espace tridimensionnel.

## 📁 Structure du projet
TP2/
- ├── tp2_exo_1/
- │ └── tp2_exo_1.pde
- ├── tp2_exo_2/
- │ └── tp2_exo_2.pde
- ├── tp2_exo_3/
- │ └── tp2_exo_3.pde
- └── README.md

## 🧩 Exercices

### Exercice 1 : Rotation d'un cube en 3D
**Objectif** : Créer un cube animé avec rotations contrôlées par la souris
- Initialisation du mode 3D avec `P3D`
- Rotation continue et interactive
- Utilisation de `map()` pour lier souris et angles de rotation
- Fonctions : `box()`, `rotateX()`, `rotateY()`, `rotateZ()`

### Exercice 2 : Animation de plusieurs formes 3D
**Objectif** : Gérer plusieurs objets 3D avec transformations indépendantes
- Utilisation de `pushMatrix()` et `popMatrix()`
- Transformations géométriques multiples (translation, rotation, mise à l'échelle)
- Animations synchronisées et indépendantes
- Formes disponibles : `sphere()`, `box()`, `cone()`, etc.

### Exercice 3 : Simulation d'un système planétaire
**Objectif** : Créer une simulation réaliste de système solaire
- Hiérarchie de transformations (étoile → planètes → lunes)
- Orbites circulaires avec vitesses différentes
- Rotations sur axe propre
- Effets de lumière avec `lights()` et `ambientLight()`

## 🛠️ Compétences acquises
- Programmation graphique 3D avec Processing
- Gestion des transformations hiérarchiques
- Manipulation des matrices de transformation
- Création d'animations complexes
- Gestion de l'éclairage 3D
- Textures et matériaux

## 🚀 Prérequis
- Processing avec support P3D
- Logiciel Processing pour exécuter les fichiers .pde
## 🔧 Configuration recommandée
```java
size(800, 600, P3D);  // Fenêtre 800x600 en mode 3D
smooth();             // Antialiasing activé
```
## 💡 Concepts clés
- Système de coordonnées 3D : X (largeur), Y (hauteur), Z (profondeur)
- Pile de matrices : Isolation des transformations
- Hiérarchie d'objets : Parent-enfant pour les transformations
- Éclairage : Types de lumières et leur influence

## 🎨 Pistes d'amélioration
- Ajouter des textures réalistes aux planètes
- Implémenter un contrôle caméra (zoom, rotation libre)
- Ajouter des effets spéciaux (particules, lens flare)
- Créer des trajectoires elliptiques (lois de Kepler)
- Intégrer un HUD (têtes de lecture) pour les contrôles
- Exporter en format OBJ ou STL

## ⚠️ Notes importantes
- Les performances 3D dépendent de la carte graphique
- Toujours utiliser pushMatrix()/popMatrix() pour éviter les transformations cumulatives
- L'ordre des transformations est crucial (scale → rotate → translate)
