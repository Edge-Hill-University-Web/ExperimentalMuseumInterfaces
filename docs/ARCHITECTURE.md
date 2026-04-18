# Architecture

**EMI Website** — Experimental Museum Interfaces, Edge Hill University

> Last updated: Sprint 0 (2026-04-17). Update this document whenever a structural decision changes.

---

## 1. System overview

The EMI website is a Dockerised monorepo consisting of three runtime services:

| Service | Technology                          | Purpose                                             |
| ------- | ----------------------------------- | --------------------------------------------------- |
| `web`   | Next.js 14 (App Router, TypeScript) | Public-facing website and experiment showcase       |
| `cms`   | Strapi v4 (Node.js, TypeScript)     | Headless CMS for all content; admin-only access     |
| `db`    | PostgreSQL 16                       | Persistent store for both CMS content and analytics |

All three services run together via Docker Compose locally and in production. In production, a reverse proxy (Caddy or Nginx) sits in front of both `web` and `cms`, terminating TLS.

```
Browser → Reverse proxy → Next.js (web, :3000)
                        → Strapi (cms, :1337)  → PostgreSQL (db, :5432)
```

---

## 2. Monorepo layout

```
ExperimentalMuseumInterfaces/
├── apps/
│   ├── cms/          # Strapi v4 backend
│   └── web/          # Next.js 14 frontend
├── packages/
│   ├── shared-types/ # Cross-package TypeScript type definitions
│   └── ui/           # Shared React component library (optional)
├── tests/            # All test suites — BDD, unit, integration, e2e, a11y, perf, security
├── docs/             # This file and other documentation
├── scripts/          # One-off scripts: seed, migrate, etc.
└── legacy-static/    # Read-only copy of the original static site
```

Package manager: pnpm workspaces. Root orchestrates lint, typecheck, and test runs across all packages.

---

## 3. Technology decisions

See the Architecture Decision Records for the full reasoning behind each choice.

| Concern            | Decision                                                | ADR                                        |
| ------------------ | ------------------------------------------------------- | ------------------------------------------ |
| CMS                | Strapi v4                                               | [ADR 0001](adr/0001-cms-choice.md)         |
| Frontend framework | Next.js 14 (App Router)                                 | [ADR 0002](adr/0002-frontend-framework.md) |
| Testing stack      | Vitest + Playwright + Cucumber.js                       | [ADR 0003](adr/0003-testing-stack.md)      |
| Database           | PostgreSQL 16                                           | Follows from CMS choice                    |
| Styling            | Tailwind CSS + CSS Modules for bespoke experiment pages | —                                          |
| CI                 | GitHub Actions                                          | INFRA-002 resolved 2026-04-17              |
| Analytics          | Plausible (cookie-free)                                 | —                                          |
| Auth               | Strapi built-in admin auth                              | —                                          |

---

## 4. Content model (high level)

Detailed field definitions live in `apps/cms/src/api/*/content-types/`. The content types are defined in full in `docs/PRD.md` Section 10 and finalised in Sprint 3.

Core types: Experiment, Project, ResearchStudy, Publication, Essay, Talk, PressMention, Partner, Dataset, TeamMember, ResearchThread, LegacyInterface, VoicePrototype, ContactLead.

---

## 5. Testing pyramid

```
              ┌──────────────────┐
              │  Security / ZAP  │   tests/security/
              ├──────────────────┤
              │   Performance    │   tests/performance/  (Lighthouse CI)
              ├──────────────────┤
              │  Accessibility   │   tests/accessibility/ (axe-core)
              ├──────────────────┤
              │  BDD / End-to-end│   tests/bdd/ + tests/e2e/ (Playwright + Cucumber)
              ├──────────────────┤
              │   Integration    │   tests/integration/  (CMS API + web↔CMS)
              ├──────────────────┤
              │      Unit        │   tests/unit/  (Vitest)
              └──────────────────┘
```

A sprint is "done" only when all tests scoped to that sprint pass in CI. See `docs/CONTRIBUTING.md` for the red-green-refactor workflow.

---

## 6. Route map

Confirmed in Sprint 0 from the agreed sitemap. Scaffold created in Sprint 5.

```
/ (Home)
├── /about
├── /research
│   ├── /research/dch-users
│   │   └── /research/dch-users/casual-users
│   ├── /research/generous-and-rich-prospect
│   ├── /research/ai-supported-exploration
│   ├── /research/evaluation-and-user-categories
│   └── /research/limitations-of-browsing
├── /experiments
│   ├── /experiments/voice                          (Voice — Specialised Thread)
│   │   ├── /experiments/voice/overview
│   │   ├── /experiments/voice/grid                 (Voice-Controlled Grid)
│   │   │   └── /experiments/voice/grid/live        (Live grid research experiment)
│   │   ├── /experiments/voice/driven-browsing
│   │   ├── /experiments/voice/interaction
│   │   ├── /experiments/voice/evaluation
│   │   └── /experiments/voice/roadmap
│   └── /experiments/legacy                         (Legacy Reconstructions)
│       └── /experiments/legacy/[slug]              (Interface recreation detail)
├── /writing
│   ├── /writing/publications
│   └── /writing/blog
└── /collaborate
    └── → links to /experiments/voice/grid
```

Legacy redirects (301): `/experiements/*` → `/experiments/*`, `/*.html` → canonical routes.

Note: `/collaborate` serves as the participate-in-research entry point and links directly to the live voice grid experiment at `/experiments/voice/grid/live`.

---

## 7. Environment variables

All variables are documented in `.env.example` at the repo root. Real values go in `.env.local` (gitignored). Admin seed credentials go in `apps/cms/seed/.env.seed` (gitignored). See `docs/DEPLOYMENT.md` for first-run setup.
