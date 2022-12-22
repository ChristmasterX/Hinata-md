FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN  npm i -g pm2
RUN  pm2 start index.js
RUN  pm2 save
RUN  pm2 logs
COPY . .

CMD ["node", "."]
