# ─── EMI Web — Next.js 14 ────────────────────────────────────────────────────
# Multi-stage build: deps → development | builder → production (standalone).
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
EXPOSE 3000
CMD ["pnpm", "dev"]

# ── Production build ──────────────────────────────────────────────────────────
FROM base AS builder
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ENV NEXT_TELEMETRY_DISABLED=1
RUN pnpm build

# ── Production runtime ────────────────────────────────────────────────────────
FROM node:20-alpine AS production
WORKDIR /app
ARG PNPM_VERSION=9.15.0
RUN corepack enable && corepack prepare pnpm@${PNPM_VERSION} --activate
ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
COPY --from=builder /app/public ./public
EXPOSE 3000
CMD ["node", "server.js"]
