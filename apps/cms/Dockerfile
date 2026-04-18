# ─── EMI CMS — Strapi v4 ─────────────────────────────────────────────────────
# Multi-stage build: deps → development | builder → production.
# --no-frozen-lockfile is intentional: no lockfile is committed until a full
# pnpm install has been run inside the container at least once (Sprint 2).

# Global ARG — must be re-declared inside each stage that uses it.
ARG PNPM_VERSION=9.15.0

FROM node:20-alpine AS base
ARG PNPM_VERSION
WORKDIR /app
RUN corepack enable && corepack prepare pnpm@${PNPM_VERSION} --activate

# ── Dependencies ──────────────────────────────────────────────────────────────
FROM base AS deps
COPY package.json pnpm-lock.yaml* ./
RUN pnpm install --no-frozen-lockfile

# ── Development ───────────────────────────────────────────────────────────────
FROM base AS development
COPY --from=deps /app/node_modules ./node_modules
COPY . .
EXPOSE 1337
CMD ["pnpm", "develop"]

# ── Production build ──────────────────────────────────────────────────────────
FROM base AS builder
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN pnpm build

# ── Production runtime ────────────────────────────────────────────────────────
FROM node:20-alpine AS production
WORKDIR /app
ARG PNPM_VERSION=9.15.0
RUN corepack enable && corepack prepare pnpm@${PNPM_VERSION} --activate
COPY --from=builder /app/build ./build
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./
EXPOSE 1337
CMD ["pnpm", "start"]
