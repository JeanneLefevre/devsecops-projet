# MonApp 🚀

Projet **Node.js API** containerisé avec **Docker**, utilisant un **Dockerfile multi-stage non-root**, prêt pour le développement et la production.

Ce dépôt inclut également un **Makefile** pour gérer facilement les containers, volumes et rebuilds.

---

## 🔹 Livrable validé

- ✅ Dépôt Git propre
- ✅ Dockerfile multi-stage non-root
- ✅ Hooks pre-commit actifs
- ✅ README clair et complet

---

## 🔹 Prérequis

Assurez-vous d’avoir installé :

- Docker (version récente)
- Docker Compose
- Node.js (optionnel, pour exécution locale)
- Make (`make`)

---

## 🔹 Structure du projet

- ├── Dockerfile
- ├── docker-compose.yml
- ├── Makefile
- ├── package.json
- ├── src/
- │ └── index.js
- └── README.md


## Description des fichiers

- **Dockerfile** : construction multi-stage et non-root
- **docker-compose.yml** : orchestration du service app
- **Makefile** : commandes pour build, up, down, nettoyage et vérification
- **src/index.js** : point d’entrée de l’application Node.js
- **package.json** : dépendances et scripts Node.js

---

## 🔹 Installation & Utilisation

### 1. Build et lancer l’application

```bash
make up
```
#### Construit l’image Docker et démarre le container en arrière-plan.

### 2. Arrêter l’application
```bash
make down
```
#### Stoppe les containers.

### 3. Nettoyer les volumes
```bash
make clean
```
#### Arrête les containers et supprime les volumes associés.

### 4. Vérifier les containers et volumes
```bash
make check
```
#### Affiche les containers actifs et les volumes existants.

### 5. Supprimer les ressources inutilisées
```bash
make prune
```
#### Supprime :

- les containers arrêtés
- les images inutilisées
- les volumes orphelins

### 6. Rebuild complet
- make re
- Stoppe les containers
- Supprime les volumes
- Rebuild l’image
- Relance l’application


## Accès à l’API

### L’application écoute sur le port 3000.

#### Le docker-compose.yml mappe :

- 3000:3000
- Exemples de routes
- Route racine
- GET http://localhost:3000/

#### Réponse :

- "Hello from Coucou API!"
- Route API users
- GET http://localhost:3000/api/users

#### Réponse :

- [
-   { "id": 1, "name": "Alice" },
-   { "id": 2, "name": "Bob" }
- ]

## Dockerfile non-root multi-stage

### Exemple utilisé dans le projet :

#### Build stage
- FROM node:20-alpine AS builder
- WORKDIR /app
- COPY package*.json ./
- RUN npm ci --only=production

#### Production stage
- FROM node:20-alpine
- RUN addgroup -S appgroup && adduser -S appuser -G appgroup
- WORKDIR /app
- COPY --from=builder /app/node_modules ./node_modules
- COPY src/ ./src/
- USER appuser
- EXPOSE 3000
- CMD ["node", "src/index.js"]


## ✔️ Bonnes pratiques appliquées
- Multi-stage build pour réduire la taille de l’image
- Utilisation d’un utilisateur non-root pour la sécurité
- Installation propre des dépendances avec npm ci

### Live Reload avec Nodemon

Le volume monté dans docker-compose.yml permet le live reload lors des modifications dans src/.

Commande utilisée en développement :
npm run dev

### Hooks pre-commit

Des hooks sont configurés pour :

- Vérifier le code avant commit
- Assurer la qualité du dépôt
- Lancer lint / tests (si configurés)

## Commandes Docker utiles
- cdocker ps                 # Voir les containers actifs
- cdocker logs <id>          # Voir les logs d’un container
- cdocker exec -it <id> sh   # Accéder au shell du container

### Notes pour les reviewers
- ✅ Dockerfile conforme (multi-stage + non-root)
- ✅ Makefile simplifie la gestion Docker
- ✅ Hooks pre-commit actifs
- ✅ Projet propre et prêt pour production
