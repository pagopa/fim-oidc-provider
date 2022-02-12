# Step 1 - Compile code
FROM node:14.17.6-alpine as build

WORKDIR /app

COPY --chown=node:node . /app
RUN yarn --frozen-lockfile
RUN yarn run build

# Step 2 - Prepare production image
FROM node:14.17.6-alpine

USER node
WORKDIR /app
COPY --chown=node:node --from=build /app/dist /app/package.json /app/yarn.lock /app/

RUN yarn --frozen-lockfile && yarn cache clean --force

EXPOSE 3000
CMD ["node", "/app/main.js"]
