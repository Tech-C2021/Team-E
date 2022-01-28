FROM node:17.4.0

WORKDIR /app
COPY ./app .
RUN npm install
EXPOSE 3000
ENTRYPOINT ["npm", "run", "dev"]
