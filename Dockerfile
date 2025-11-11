FROM node:20-alpine
WORKDIR /app
COPY package.json ./
RUN npm install --production
COPY server.js index.html styles.css script.js moises-photo.jpg ./
EXPOSE 8080
ENV PORT=8080
CMD ["node", "server.js"]

