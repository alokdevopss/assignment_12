FROM node:gallium-bullseye
WORKDIR /usr/src/app
COPY . .
RUN npm install
CMD ["npm", "start"]
