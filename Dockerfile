FROM node:20.18.1-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

RUN mkdir -p uploads

ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000

VOLUME ["/app/uploads"]

CMD ["npm", "start"]
