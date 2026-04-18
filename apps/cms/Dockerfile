# ─── EMI CMS — Strapi v4 ─────────────────────────────────────────────────────
# Multi-stage build: base → development | builder → production.
#
# In the development stage we install deps in the same layer as the app rather
# than copying node_modules from a separate stage.  pnpm's virtual store uses
# relative symlinks that can silently break when copied across stages.
#
# --no-frozen-lockfile is intentional: no pnpm-lock.yaml is committed until
# a full install has been run at least once.

# Global ARG — must be re-declared inside each stage that uses it.
ARG PNPM_VERSION=9.15.0

# ── Base ──────────────────────────────────────────────────────────────────────
FROM node:20-alpine AS base
ARG PNPM_VERSION
WORKDIR /app
RUN corepack enable && corepack prepare pnpm@${PNPM_VERSION} --activate

# ── Development ───────────────────────────────────────────────────────────────
# 1. Copy only the manifest so the install layer is cached independently
#    of source changes.
# 2. Install all dependencies.
# 3. Copy source (invalidates only from here when source changes).
FROM base AS development
COPY package.json ./
RUN pnpm install --no-frozen-lockfile
COPY . .
EXPOSE 1337
CMD ["pnpm", "develop"]

# ── Production build ──────────────────────────────────────────────────────────
FROM base AS builder
COPY package.json ./
RUN pnpm install --no-frozen-lockfile
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
