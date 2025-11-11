# Use Node.js 20 Alpine as base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./

# Initialize npm and install dependencies
RUN npm install

# Copy the entire project into the container
COPY . .

# Expose port 8080 (Cloud Run default)
EXPOSE 8080

# Set environment variable for port
ENV PORT=8080

# Run the server
CMD ["node", "server.js"]

