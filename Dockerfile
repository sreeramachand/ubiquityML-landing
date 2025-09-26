# Build stage
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Serve stage
FROM caddy:2.8.0
COPY --from=build /app/dist /srv
COPY Caddyfile /etc/caddy/Caddyfile
