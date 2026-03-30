MonApp

Projet Node.js avec Docker, prêt pour le développement et le déploiement.

🔹 Description

Cette application est une API Node.js simple utilisant Express. Elle est containerisée avec Docker et utilise un Dockerfile multi-stage non-root pour la production.

Le projet inclut également un Makefile pour simplifier les commandes Docker et gérer facilement les containers, volumes et images.

🔹 Prérequis
Docker
 (version récente)
Docker Compose
Node.js
 (pour exécuter localement si nécessaire)
Make (make command)
🔹 Structure du projet
.
├── Dockerfile
├── docker-compose.yml
├── Makefile
├── package.json
├── src/
│   └── index.js
└── README.md
Dockerfile : construction multi-stage et non-root.
docker-compose.yml : orchestration du service app.
Makefile : commandes pour build, up, down, nettoyer et vérifier les containers.
src/index.js : fichier principal Node.js.
package.json : dépendances Node.js.
🔹 Installation & Utilisation
1. Build et lancer l’application
make up
make up : construit l’image Docker et démarre le container en arrière-plan.
2. Arrêter l’application
make down
make down : stoppe les containers.
3. Nettoyer les volumes
make clean
make clean : arrête les containers et supprime les volumes associés.
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
🔹 Notes
Le Dockerfile utilise un utilisateur non-root pour plus de sécurité.
Le volume dans docker-compose (./src:/app/src) permet le live-reload avec Nodemon.
Les hooks pre-commit (si activés) permettent de vérifier le code avant chaque commit.
🔹 Commandes utiles Docker
docker ps            # voir les containers actifs
docker logs <id>     # voir les logs d’un container
docker exec -it <id> sh # accéder au shell du container
