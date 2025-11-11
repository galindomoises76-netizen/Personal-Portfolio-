# Use Node.js 20 Alpine as base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json first for better caching
COPY package.json ./

# Install dependencies (use --legacy-peer-deps if needed)
RUN npm install --production --no-audit --no-fund

# Copy the entire project into the container
COPY . .

# Expose port 8080 (Cloud Run default)
EXPOSE 8080

# Set environment variable for port
ENV PORT=8080
ENV NODE_ENV=production

# Run the server
CMD ["node", "server.js"]

