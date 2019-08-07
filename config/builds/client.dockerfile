FROM node:10 as builder

WORKDIR /app

COPY package.json yarn.lock ./
COPY packages/common/package.json ./packages/common/package.json
COPY packages/client/package.json ./packages/client/package.json
RUN yarn install --frozen-lockfile

COPY . ./
RUN yarn build:client

FROM nginx:1.16-alpine

COPY --from=builder /app/packages/client/dist/ /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
