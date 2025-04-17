FROM node:23-slim
WORKDIR /app
COPY package.json .
COPY routes.js .
COPY db.js .
RUN npm install
EXPOSE 3000
CMD ["node", "routes.js"]
