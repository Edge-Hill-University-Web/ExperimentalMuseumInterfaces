# Deployment

This document covers local development setup and production deployment for the EMI website.

---

## 1. Prerequisites

| Tool           | Minimum version | Notes                             |
| -------------- | --------------- | --------------------------------- |
| Node.js        | 20 LTS          | `.nvmrc` pins this; use `nvm use` |
| pnpm           | 9+              | `npm install -g pnpm`             |
| Docker Desktop | 4.x             | Includes Docker Compose v2        |

---

## 2. Local development (first run)

```bash
# 1. Clone
git clone https://github.com/Edge-Hill-University-Web/ExperimentalMuseumInterfaces.git
cd ExperimentalMuseumInterfaces

# 2. Environment
cp .env.example .env.local
# Edit .env.local and fill in all values.
# Do NOT commit .env.local.

# 3. Admin seed credentials (never committed)
mkdir -p apps/cms/seed
cat > apps/cms/seed/.env.seed << 'EOF'
APP_ADMIN_EMAIL=walshd@edgehill.ac.uk
APP_ADMIN_PASSWORD=<your-password-here>
EOF

# 4. Dependencies
pnpm install

# 5. Start the stack
# Note: Docker Compose reads .env by default, not .env.local — pass the file explicitly
docker compose --env-file .env.local -f docker-compose.yml -f docker-compose.dev.yml up --build
```

On first boot Strapi will run migrations and create the database schema. Once the CMS is healthy, run the admin seed:

```bash
pnpm --filter cms seed:admin
```

The admin UI is then available at `http://localhost:1337/admin`. Log in with the credentials from `apps/cms/seed/.env.seed`.

---

## 3. Subsequent local starts

```bash
docker compose --env-file .env.local -f docker-compose.yml -f docker-compose.dev.yml up
```

To reset the database and re-seed from scratch:

```bash
docker compose down -v   # removes the Postgres volume
docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build
pnpm --filter cms seed:admin
pnpm --filter cms seed:content
```

---

## 4. Production deployment

> **Status:** Production Dockerfiles and the full production runbook are delivered in Sprint 16.

High-level plan:

1. Build multi-stage Docker images for `cms` and `web`.
2. Push images to a container registry (GitHub Container Registry or Edge Hill equivalent).
3. Pull and run on the target host using `docker-compose.prod.yml`.
4. The reverse proxy (Caddy) handles TLS via Let's Encrypt.

Full runbook will be written in Sprint 16 and added to this section.

---

## 5. Environment variables

All variables are documented in `.env.example`. Key variables by service:

**Database**

- `POSTGRES_DB`, `POSTGRES_USER`, `POSTGRES_PASSWORD`, `DATABASE_URL`

**CMS (Strapi)**

- `APP_KEYS`, `API_TOKEN_SALT`, `ADMIN_JWT_SECRET`, `TRANSFER_TOKEN_SALT`, `JWT_SECRET`
- `STRAPI_HOST`, `STRAPI_PORT`

**Web (Next.js)**

- `NEXT_PUBLIC_CMS_URL` — URL the browser uses to reach the CMS (public)
- `CMS_API_TOKEN` — server-side API token for the CMS (secret, never exposed to browser)
- `NEXT_PUBLIC_SITE_URL`

**Email**

- `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`, `SMTP_PASSWORD`, `EMAIL_FROM`, `EMAIL_NOTIFY`

---

## 6. Postgres backup (backlog OPS-001)

A documented backup strategy is required before production launch. Interim approach: daily `pg_dump` to a mounted volume, retained for 7 days. Full procedure to be documented in Sprint 16.

---

## 7. Security notes

- Rotate all secrets from `.env.example` defaults before any public deployment.
- Rotate the admin password on first login after seeding.
- `apps/cms/seed/.env.seed` must never be committed or transferred via insecure channels.
- The admin endpoint (`/admin`) should be restricted to staff IP ranges in production (Caddy config).
