FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

# Forcer l'utilisation de la version JavaScript de Rollup
ENV ROLLUP_SKIP_NATIVE=true
ENV VITE_SKIP_NATIVE=true
ENV NODE_OPTIONS="--max-old-space-size=4096"

COPY . .

EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"] 