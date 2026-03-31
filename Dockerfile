# Stage 1: build
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install

# Stage 2: runtime
FROM node:20-alpine
WORKDIR /app

# créer un utilisateur non-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# copier node_modules et code
COPY --from=builder /app/node_modules ./node_modules
COPY . .

# chown pour éviter les problèmes de permissions
RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 3000

CMD ["npm", "run", "dev"]
