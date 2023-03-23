FROM node:16
WORKDIR /opt/lavamusic/

# Copy dependencies first to improve layer caching
COPY package*.json ./
RUN npm install --only=production
RUN npm cache clean --force
RUN npm install -g typescript
RUN npx prisma generate

COPY . .

CMD [ "npm", "start2" ]
