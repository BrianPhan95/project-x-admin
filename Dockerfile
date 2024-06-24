# The builder from node image
FROM node:20.14-alpine as builder
# ENV NODE_OPTIONS=--openssl-legacy-provider

# Move our files into directory name "app"
WORKDIR /app
COPY ./package.json ./package-lock.json  /app/
RUN npm install --legacy-peer-deps
COPY .  /app


# RUN cd /app && npm uninstall @angular-devkit/build-angular
# RUN cd /app && npm install typescript@4.0.5
RUN cd /app && ng version
# RUN cd /app && npm install @angular-devkit/build-angular@0.1100.7
RUN cd /app && npm i --legacy-peer-deps

# Build with $env variable from outside
RUN cd /app && ng build --prod

# Build a small nginx image with static website
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
