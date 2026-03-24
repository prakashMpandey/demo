FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . . 


FROM node:22-alpine AS runner

WORKDIR /app

# Sirf production dependencies install karo (Size aur kam ho jayega)
COPY package*.json ./
RUN npm install --omit=dev

# Builder stage se sirf main code copy karo
COPY --from=builder /app/index.js ./

EXPOSE 5000

USER node

CMD ["node", "index.js"]