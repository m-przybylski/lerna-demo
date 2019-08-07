FROM node:10 as builder

WORKDIR /app

COPY package.json yarn.lock ./
COPY packages/common/package.json ./packages/common/package.json
COPY packages/server/package.json ./packages/server/package.json
RUN yarn install --frozen-lockfile

COPY . ./
RUN yarn build:backend

FROM node:10-alpine

ENV NODE_ENV=production

WORKDIR /app

# copy project definition
COPY --from=builder /app/package.json /app/yarn.lock ./
COPY --from=builder /app/packages/common/package.json ./packages/common/package.json
COPY --from=builder /app/packages/server/package.json ./packages/server/package.json

# copy build projec
COPY --from=builder /app/packages/common/dist ./packages/common/dist
COPY --from=builder /app/packages/server/dist ./packages/server/dist

RUN yarn install --frozen-lockfile

EXPOSE 3000

CMD ["node", "/app/packages/server/."]