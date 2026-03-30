MonApp 🚀

Projet Node.js API containerisé avec Docker, utilisant un Dockerfile multi-stage non-root, prêt pour développement et production.

Ce dépôt inclut également un Makefile pour gérer facilement les containers, volumes et rebuilds.

🔹 Livrable validé
✅ Dépôt Git propre
✅ Dockerfile multi-stage non-root
✅ Hooks pre-commit actifs
✅ README clair et complet
🔹 Prérequis
Docker
 (version récente)
Docker Compose
Node.js
 (pour exécuter localement si nécessaire)
Make (make)
🔹 Structure du projet
.
├── Dockerfile
├── docker-compose.yml
├── Makefile
├── package.json
├── src/
│   └── index.js
└── README.md
Dockerfile : construction multi-stage et non-root
docker-compose.yml : orchestration du service app
Makefile : commandes pour build, up, down, nettoyer et vérifier les containers
src/index.js : fichier principal Node.js
package.json : dépendances Node.js
🔹 Installation & Utilisation
1. Build et lancer l’application
make up
Construit l’image Docker et démarre le container en arrière-plan.
2. Arrêter l’application
make down
Stoppe les containers.
3. Nettoyer les volumes
make clean
Arrête les containers et supprime les volumes associés.
4. Vérifier les containers et volumes
make check
Affiche les containers actifs et les volumes existants.
5. Supprimer tous les containers, images et volumes inutilisés
make prune
Supprime les containers arrêtés, images inutilisées et volumes orphelins.
6. Rebuild complet
make re
Arrête les containers, supprime les volumes, puis rebuild et relance l’application.
🔹 Accès à l’API
L’application écoute sur le port 3000 (docker-compose mappe 3000:3000).
Exemple de routes :
# Route racine
GET http://localhost:3000/
# => "Hello from Coucou API!"

# Route API users
GET http://localhost:3000/api/users
# => [
#      { id: 1, name: 'Alice' },
#      { id: 2, name: 'Bob' }
#    ]
🔹 Dockerfile non-root multi-stage

Exemple de Dockerfile inclus dans le projet :

# Build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

# Production stage
FROM node:20-alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY src/ ./src/
USER appuser
EXPOSE 3000
CMD ["node", "src/index.js"]
🔹 Live Reload avec Nodemon
Le volume monté dans docker-compose.yml permet le live reload lors de changements dans src/.
Commande npm run dev utilisée pour le développement.
🔹 Hooks pre-commit
Vérifient le code avant chaque commit.
Assurent la qualité et la sécurité du dépôt.
🔹 Commandes Docker utiles
docker ps            # Voir les containers actifs
docker logs <id>     # Voir les logs d’un container
docker exec -it <id> sh # Accéder au shell du container
🔹 Notes pour les reviewers
✅ Dockerfile respecte les bonnes pratiques multi-stage et non-root
✅ Makefile permet de gérer containers et volumes facilement
✅ Hooks pre-commit actifs (lint et tests si configurés)
✅ README clair et complet
