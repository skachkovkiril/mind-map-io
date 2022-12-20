FROM node:lts-alpine

RUN npm install -g http-server

WORKDIR /app/

COPY frontend/package*.json /app/

RUN npm install

COPY frontend /app/

RUN npm run build

EXPOSE 8080

CMD [ "http-server", "dist" ]