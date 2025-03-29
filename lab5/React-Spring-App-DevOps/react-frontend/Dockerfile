FROM node:18.6.0-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci --production && npm cache clean --force

COPY . .

RUN npm run build

FROM node:18.6.0-alpine AS final
WORKDIR /app

COPY --from=build /app /app

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE $PORT

CMD ["npm", "start"]