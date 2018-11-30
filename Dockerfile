FROM node:alpine as builer

WORKDIR /app

ADD package.json package.json
ADD package-lock.json package-lock.json

RUN npm install

ADD src src
ADD public public
ADD README.md README.md

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html