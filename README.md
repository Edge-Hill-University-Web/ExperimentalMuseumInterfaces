# Experimental Museum Interfaces (EMI)

**Edge Hill University** — Dr David Walsh · Dr Daniel Campbell

EMI is a research project exploring novel interfaces for cultural heritage collections: voice-controlled browsing, generous browsing, legacy interface approximations, and experimental visualisation. This repository hosts the project website, which doubles as a live showcase of the work.

Live site: [emi.computing.edgehill.ac.uk](https://emi.computing.edgehill.ac.uk/)

---

## Quick start (local development)

> **Prerequisites:** Node 20 LTS, pnpm 9+, Docker Desktop

```bash
# 1. Clone the repo
git clone https://github.com/Edge-Hill-University-Web/ExperimentalMuseumInterfaces.git
cd ExperimentalMuseumInterfaces

# 2. Copy the environment template and fill in your values
cp .env.example .env.local

# 3. Install dependencies
pnpm install

# 4. Start the full stack
docker compose --env-file .env.local -f docker-compose.yml -f docker-compose.dev.yml up --build
```

The CMS admin UI will be available at `http://localhost:1337/admin`.
The web app will be available at `http://localhost:3000`.

> **First run:** create `apps/cms/seed/.env.seed` with your admin credentials before running the seed script. See `docs/DEPLOYMENT.md` for details.

---

## Repository layout

```
ExperimentalMuseumInterfaces/
├── apps/
│   ├── cms/          # Strapi v4 CMS backend
│   └── web/          # Next.js 14 frontend
├── packages/
│   ├── shared-types/ # TypeScript types shared across apps
│   └── ui/           # Shared component library
├── tests/            # All test suites (BDD, unit, e2e, a11y, performance, security)
├── docs/             # Architecture docs, ADRs, contributing and deployment guides
├── legacy-static/    # Read-only copy of the original static site (migration reference)
├── scripts/          # Seed and migration scripts
├── docker-compose.yml
├── .env.example
└── README.md
```

---

## Development workflow

This project follows Test-Driven Development (TDD) and Behaviour-Driven Development (BDD). Every feature has a Gherkin scenario written before the code. See `docs/CONTRIBUTING.md` for the full workflow.

```bash
pnpm lint          # Lint all packages
pnpm typecheck     # TypeScript check all packages
pnpm test:unit     # Run unit tests
pnpm test:bdd      # Run BDD scenarios (Cucumber + Playwright)
pnpm test:e2e      # Run end-to-end tests
```

---

## Documentation

| Document               | Purpose                                |
| ---------------------- | -------------------------------------- |
| `docs/PRD.md`          | Product Requirements Document          |
| `docs/ROADMAP.md`      | Sprint roadmap and backlog             |
| `docs/ARCHITECTURE.md` | System architecture and key decisions  |
| `docs/CONTRIBUTING.md` | How to contribute and the TDD workflow |
| `docs/DEPLOYMENT.md`   | Local dev and production deployment    |
| `docs/adr/`            | Architecture Decision Records          |
| `CHANGELOG.md`         | Release history                        |

---

## Contact

Dr David Walsh — [walshd@edgehill.ac.uk](mailto:walshd@edgehill.ac.uk)

---

## Licence

Code: MIT. Written content: CC BY 4.0. See `LICENSE` for full terms.
