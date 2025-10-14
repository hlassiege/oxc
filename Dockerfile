FROM node:22.20-alpine

WORKDIR /app

# Copy package files first (for layer caching)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build
RUN npm run build

# Expose port
EXPOSE 3000

# Start
CMD ["node", ".output/server/index.mjs"]