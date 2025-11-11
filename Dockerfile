# Use Node.js 20 Alpine as base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json first for better caching
COPY package.json ./

# Install dependencies
RUN npm install --production --no-audit --no-fund

# Copy only the necessary application files
COPY server.js ./
COPY index.html ./
COPY styles.css ./
COPY script.js ./
COPY moises-photo.jpg ./

# Expose port 8080 (Cloud Run default)
EXPOSE 8080

# Set environment variable for port
ENV PORT=8080
ENV NODE_ENV=production

# Run the server
CMD ["node", "server.js"]

