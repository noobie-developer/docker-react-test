# START BUILD PHASE
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#START RUN PHASE
FROM nginx
# COPY /app/build created in the builder phase
COPY --from=builder /app/build /usr/share/nginx/html
