FROM node:8

WORKDIR /usr/src/server
COPY . .
RUN npm install

EXPOSE 4000
CMD [ "node", "./dist" ]