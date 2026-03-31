# Stage builder
FROM node:20-alpine AS builder
WORKDIR /app

# Copie uniquement package.json et package-lock.json
COPY package*.json ./

# Installe seulement les prod dependencies pour le build final
RUN npm ci --only=production

# Stage final
FROM node:20-alpine

# Création d'un utilisateur non-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copie des node_modules produits par le builder
COPY --from=builder /app/node_modules ./node_modules
COPY src/ ./src/

# Pour le dev : on a besoin de nodemon
RUN npm install --global nodemon

# Crée le dossier node_modules et donne les droits
RUN mkdir -p /app/node_modules && chown -R appuser:appgroup /app

# Passe en utilisateur non-root
USER appuser

EXPOSE 3000
CMD ["node", "src/index.js"]
