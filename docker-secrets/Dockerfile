FROM node:18-alpine

# VULNERABILIDAD: Secretos hardcodeados en Dockerfile
ENV DATABASE_URL="postgresql://admin:SuperSecretPass123@db.company.com:5432/production"
ENV API_KEY="sk_live_51234567890abcdefghijklmnopqrstuvwxyz"
ENV JWT_SECRET="jwt-super-secret-key-production-2023"
ENV REDIS_PASSWORD="RedisPass123!"

WORKDIR /app
COPY package*.json ./
RUN npm install

# VULNERABILIDAD: Credenciales en variables de build
ARG GITHUB_TOKEN=ghp_1234567890abcdefghijklmnopqrstuvwxyz12
ARG AWS_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE
ARG AWS_SECRET_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

COPY . .
EXPOSE 3000
CMD ["npm", "start"]
