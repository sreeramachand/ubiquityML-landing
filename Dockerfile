# Use a Node build stage
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files & install
COPY package.json package-lock.json ./
RUN npm ci

# Copy rest of the source
COPY . .

# Build your app (assuming an Astro build or similar)
RUN npm run build

# Final stage: use Caddy (with HTTP/2, TLS, etc.)
FROM caddy:2-alpine

# Copy built site
# Adjust this path according to your build output (e.g. “dist” or “public”)
COPY --from=builder /app/dist /usr/share/caddy

# Copy Caddyfile
COPY Caddyfile /etc/caddy/Caddyfile

# If you have extra assets, config, etc., copy them as needed

# (Optional) If you have a custom entrypoint, environment variables, etc.
# you can add them here.

# Expose port (Cloud Run uses 8080 by default)
EXPOSE 8080

# Use Caddy’s default command (already baked in)
# caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
