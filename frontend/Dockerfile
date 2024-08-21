# Base stage for both development and production
FROM oven/bun:1 as base
WORKDIR /app
COPY package*.json bun.lockb ./
RUN bun install --frozen-lockfile

# Development stage
FROM base as development
ENV NODE_ENV=development
COPY . .
CMD ["bun", "run", "dev", "--", "--host"]

# Production build stage
FROM base as build
COPY . .
RUN bun run build

# Production stage
FROM node:22-alpine as production
WORKDIR /app
COPY --from=build /app/dist ./dist
RUN npm install -g serve
EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]