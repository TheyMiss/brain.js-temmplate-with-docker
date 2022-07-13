FROM node:14.20.0-slim

RUN apt-get update || : && apt-get install python -y

#System dependencies for brain.js
RUN apt-get install -y build-essential libxi-dev libglu1-mesa-dev libglew-dev pkg-config

WORKDIR /app
COPY package*.json ./
RUN npm install
USER node
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]