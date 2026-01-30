# TP1 : Fonctions et Couleurs

## 🎯 Objectif
Ce TP a pour objectif de découvrir les bases de la programmation graphique avec Processing, en manipulant les couleurs, les animations simples et les interactions avec la souris.

## 📁 Structure du projet
TP1/
- ├── tp_1_exo_1/
- │             └── tp_1_exo_1.pde
- ├── tp_1_exo_2/
- │             └── tp_1_exo_2.pde
- ├── tp_1_exo_3/
- │             └── tp_1_exo_3.pde
- └── README.md

## 🧩 Exercices

### Exercice 1 : Spectre de couleur
**Objectif** : Créer un dégradé de couleurs en utilisant le mode HSB
- Utilisation de `colorMode(HSB, 1)`
- Boucle `for()` pour parcourir la largeur de la fenêtre
- Fonction `map()` pour convertir les coordonnées en valeurs de teinte

### Exercice 2 : Balle rebondissante
**Objectif** : Animer une balle qui rebondit sur les bords de la fenêtre
- Gestion des positions et vitesses (`posX`, `posY`, `speedX`, `speedY`)
- Détection de collision avec les bords
- Inversion de vitesse pour l'effet rebond

### Exercice 3 : Ellipse suivant la souris
**Objectif** : Faire suivre une ellipse à la souris avec effet de traînée
- Interpolation linéaire avec `lerp()`
- Effet de traînée avec transparence
- Mouvement fluide et progressif

## 🛠️ Compétences acquises
- Manipulation des modes de couleur (HSB vs RGB)
- Gestion des boucles et animations
- Détection de collisions basiques
- Interpolation et transitions fluides
- Gestion des événements utilisateur

## 🚀 Comment exécuter
1. Ouvrir Processing
2. Ouvrir le fichier `.pde` de l'exercice souhaité
3. Cliquer sur le bouton "Run" (▶️)

## 📝 Notes techniques
- Taille des fenêtres : 800x600 pixels 
- Tous les exercices sont indépendants
- Aucune librairie externe requise

## 🔧 Pistes d'amélioration
- Ajouter des paramètres contrôlables au clavier
- Créer des effets de transition plus complexes
- Implémenter une palette de couleurs personnalisée
- Exporter les animations en vidéo
