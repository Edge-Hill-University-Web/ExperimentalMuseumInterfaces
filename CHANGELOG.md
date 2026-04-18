# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Added — Sprint 0 (2026-04-17)

- Monorepo scaffold with pnpm workspaces (`apps/cms`, `apps/web`, `packages/shared-types`, `packages/ui`, `tests`)
- `.gitignore`, `.editorconfig`, `.nvmrc` (Node 20 LTS), `LICENSE` (MIT + CC BY 4.0 for written content)
- `.env.example` listing all environment variables the stack will need
- `tsconfig.base.json` with strict TypeScript settings shared across all packages
- `docker-compose.yml`, `docker-compose.dev.yml`, `docker-compose.prod.yml` (cms, db, web services)
- Empty Dockerfiles for `apps/cms` and `apps/web`
- GitHub Actions CI workflow: lint and type-check on every pull request
- Husky pre-commit hooks, commitlint (Conventional Commits), lint-staged
- `docs/ARCHITECTURE.md`, `docs/CONTRIBUTING.md`, `docs/DEPLOYMENT.md`
- ADR 0001: CMS choice (Strapi v4 selected)
- ADR 0002: Frontend framework (Next.js 14+ selected)
- ADR 0003: Testing stack (Vitest + Playwright + Cucumber.js selected)
- `legacy-static/` — read-only copy of the current static site for reference during migration
- `docs/PRD.md` and `docs/ROADMAP.md` relocated from `EMI website/` subfolder

### Added — Sprint 2 (2026-04-18)

- Strapi v4 config files in `apps/cms/config/`: `database.ts`, `server.ts`, `admin.ts`, `middlewares.ts`, `plugins.ts`
- `apps/cms/src/index.ts` — Strapi lifecycle entry point (`register` / `bootstrap` stubs for Sprint 3)
- `apps/web/app/layout.tsx` — root Next.js App Router layout with `<html lang="en">` and metadata
- `apps/web/app/page.tsx` — home page that pings the CMS `/_health` endpoint and renders live status
- `apps/web/app/api/health/route.ts` — `GET /api/health` liveness probe (returns `{ status: "ok" }`)
- `apps/web/lib/cms-health.ts` — server-side CMS ping helper
- `apps/web/styles/globals.css` — minimal base styles (reset + system font stack)
- `apps/web/next.config.mjs` — Next.js config with `output: "standalone"` and CMS image remote pattern
- `scripts/seed-admin.ts` — stub for Sprint 3 admin user seeding script
- Pinned Strapi to `4.25.9` and Next.js to `14.2.15` in respective `package.json` files
- Pinned pnpm to `9.15.0` in both Dockerfiles (replaces `pnpm@latest`)
- Added `apps/cms/.strapi/` and `apps/cms/public/uploads/` to `.gitignore`

### Added — Sprint 1 (2026-04-18)

- `tests/package.json` with full test dependency set (Vitest, Playwright, Cucumber.js, axe-core, Lighthouse CI)
- `tests/playwright.config.ts` — Playwright config for Chromium and WebKit, traces on failure
- `tests/vitest.config.ts` — Vitest config with Istanbul coverage (80% lines / 75% branches thresholds)
- `tests/.cucumber.js` — Cucumber.js config with HTML and JSON reporters
- `tests/bdd/support/world.ts` and `hooks.ts` — shared Playwright browser lifecycle for BDD steps
- `tests/bdd/step_definitions/common.steps.ts` — reusable navigation and assertion steps
- 19 BDD feature files covering every planned capability (updated for confirmed sitemap):
  - `home.feature`, `about.feature`, `research-section.feature`, `experiments-listing.feature`
  - `voice-section.feature`, `legacy-section.feature`, `writing-section.feature`, `collaborate.feature`
  - `admin-auth.feature`, `cms-content-model.feature`, `cms-publishing-workflow.feature`
  - `contact-form.feature`, `search.feature`, `navigation.feature`, `redirects-legacy-urls.feature`
  - `accessibility.feature`, `performance.feature`, `seo-metadata.feature`, `docker-boot.feature`
- Unit test stubs (all intentionally failing until implementation sprints):
  - `tests/unit/cms/slug-validator.test.ts`
  - `tests/unit/cms/publish-status.test.ts`
  - `tests/unit/web/citation-formatter.test.ts`
  - `tests/unit/web/cms-client.test.ts`
  - `tests/unit/web/redirect-map.test.ts`
- `tests/accessibility/axe-checks.spec.ts` — axe-core smoke sweep across all 22 public routes
- `tests/performance/lighthouse-budgets.json` — Lighthouse resource and timing budgets
- `lighthouserc.js` — Lighthouse CI config targeting 6 key routes
- CI workflow expanded with `accessibility` and `lighthouse` jobs (gated behind `if: false` until Sprint 5 when routes exist)

---

[Unreleased]: https://github.com/Edge-Hill-University-Web/ExperimentalMuseumInterfaces/compare/HEAD...HEAD
