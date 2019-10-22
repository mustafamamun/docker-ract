FROM node:alpine as build_phase
WORKDIR '/app'
copy package.json .
run npm install
copy . .
run npm run build

from nginx
EXPOSE 80
copy --from=build_phase /app/build /usr/share/nginx/html

