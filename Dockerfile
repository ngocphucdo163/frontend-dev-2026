FROM node:22-alpine as build-stage
WORKDIR /app

# Copy dependency files first to leverage Docker caching
COPY package*.json ./
RUN npm install

# Copy all project files and build the production assets
COPY . .

# Expose the port your dev server uses (Vite: 5173, CRA: 3000)
EXPOSE 3000

# Run with HOSTNAME env var
ENV HOSTNAME=0.0.0.0
CMD ["npm", "run", "dev"]