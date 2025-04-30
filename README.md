# Quiz 101

Quiz 101 est une application mobile développée avec Flutter qui permet aux utilisateurs de tester leurs connaissances à travers des quiz interactifs. L'application inclut des fonctionnalités telles que l'authentification des utilisateurs, un tableau des scores pour suivre les performances, et une interface utilisateur moderne et épurée.

---

## Fonctionnalités

- **Authentification des utilisateurs** : Les utilisateurs peuvent se connecter avec leur email et mot de passe.
- **Quiz dynamique** : Les questions du quiz sont récupérées depuis Firebase Firestore.
- **Tableau des scores** : Affiche les meilleurs scores en temps réel, triés par ordre décroissant.
- **Interface moderne** : Design propre et attrayant avec des arrière-plans en dégradé et des mises en page réactives.

---

## Écrans

### 1. **Écran de connexion**
   - Les utilisateurs peuvent se connecter avec leur email et mot de passe.
   - Firebase Authentication est utilisé pour une connexion sécurisée.

### 2. **Écran d'accueil**
   - Un écran d'accueil accueillant avec un design attrayant et un texte motivant.
   - Aucun bouton de navigation, juste une mise en page visuellement agréable.

### 3. **Écran de quiz**
   - Affiche les questions du quiz récupérées depuis Firebase Firestore.
   - Les utilisateurs peuvent répondre aux questions, et leur score est calculé dynamiquement.
   - À la fin du quiz, le score est enregistré dans Firestore avec l'email de l'utilisateur.

### 4. **Écran du tableau des scores**
   - Affiche un tableau des scores en temps réel avec les meilleurs résultats.
   - Les données sont récupérées depuis Firebase Firestore et triées par score décroissant.

---

## Intégration Firebase

L'application utilise Firebase pour les fonctionnalités suivantes :
1. **Authentification** : Pour gérer la connexion et la déconnexion des utilisateurs.
2. **Base de données Firestore** : 
   - Stocke les questions du quiz dans la collection `quiz_questions`.
   - Enregistre les scores des utilisateurs dans la collection `quiz_scores`.

---

## Comment ça fonctionne

1. **Connexion** :
   - Les utilisateurs doivent se connecter pour accéder à l'application.
   - Si l'utilisateur n'est pas connecté, il est redirigé vers l'écran de connexion.

2. **Quiz** :
   - Les questions sont récupérées dynamiquement depuis Firestore.
   - Les utilisateurs répondent aux questions, et leur score est calculé.
   - À la fin du quiz, le score est enregistré dans Firestore.

3. **Tableau des scores** :
   - Affiche les meilleurs scores en temps réel.
   - Chaque entrée inclut l'email de l'utilisateur et son score.

4. **Navigation** :
   - L'application utilise un tiroir de navigation pour passer d'un écran à l'autre (Accueil, Quiz, Tableau des scores, et Déconnexion).

---

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés sur votre machine :

- **Flutter SDK** : [Installer Flutter](https://docs.flutter.dev/get-started/install)
- **Android Studio** ou **VS Code** : Pour le développement Flutter.
- **Firebase** : Un projet Firebase configuré avec Authentication et Firestore activés.

---

## Configuration du Projet

**Étape 1 : Cloner le dépôt**
Clonez ce dépôt sur votre machine locale :
```bash
git clone https://github.com/votre-repo/quiz_101.git
cd quiz_101

**Étape 2 : Installer les dépendances**

flutter pub get

**Étape 3 : Configurer Firebase**

flutterfire configure

**Étape 4 : Lancer l\'application**

flutter run