# Dockerfile

FROM node:18-alpine

WORKDIR /app

# Only copy dependency files first to leverage Docker cache
COPY package.json package-lock.json* ./

RUN npm install

# Now copy the rest of the application
COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
