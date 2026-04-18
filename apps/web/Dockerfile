# ─── EMI Web — Next.js 14 ────────────────────────────────────────────────────
# Build context: monorepo root (set in docker-compose.yml).
# The root context is required so pnpm can resolve workspace:* packages
# (e.g. @emi/shared-types) during the deps install step.
#
# Multi-stage build: deps → development | builder → production (standalone).
# --no-frozen-lockfile is intentional: no lockfile is committed until a full
# pnpm install has been run inside the container at least once.

# Global ARG — must be re-declared inside each stage that uses it.
ARG PNPM_VERSION=9.15.0

FROM node:20-alpine AS base
ARG PNPM_VERSION
# All work happens at the workspace root so pnpm module resolution works.
WORKDIR /repo
RUN corepack enable && corepack prepare pnpm@${PNPM_VERSION} --activate

# ── Dependencies ──────────────────────────────────────────────────────────────
# Copy only the manifests needed for workspace resolution — avoids
# invalidating the install layer every time source files change.
FROM base AS deps
COPY pnpm-workspace.yaml package.json ./
COPY packages/shared-types/package.json ./packages/shared-types/
COPY packages/ui/package.json ./packages/ui/
COPY apps/web/package.json ./apps/web/
COPY tests/package.json ./tests/
RUN pnpm install --no-frozen-lockfile

# ── Development ───────────────────────────────────────────────────────────────
FROM base AS development
COPY --from=deps /repo/node_modules ./node_modules
COPY . .
WORKDIR /repo/apps/web
EXPOSE 3000
CMD ["pnpm", "dev"]

# ── Production build ──────────────────────────────────────────────────────────
FROM base AS builder
COPY --from=deps /repo/node_modules ./node_modules
COPY . .
ENV NEXT_TELEMETRY_DISABLED=1
WORKDIR /repo/apps/web
RUN pnpm build

# ── Production runtime ────────────────────────────────────────────────────────
FROM node:20-alpine AS production
WORKDIR /app
ARG PNPM_VERSION=9.15.0
RUN corepack enable && corepack prepare pnpm@${PNPM_VERSION} --activate
ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
COPY --from=builder /repo/apps/web/.next/standalone ./
COPY --from=builder /repo/apps/web/.next/static ./.next/static
COPY --from=builder /repo/apps/web/public ./public
EXPOSE 3000
CMD ["node", "server.js"]
