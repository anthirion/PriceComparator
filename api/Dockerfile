FROM node:23-slim
WORKDIR /app
COPY package.json .
COPY api.js .
RUN npm install
EXPOSE 3000
CMD ["node", "api.js"]
