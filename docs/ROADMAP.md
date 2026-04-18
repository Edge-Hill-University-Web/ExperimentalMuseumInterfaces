# EMI Website Roadmap and Backlog

**Repository:** EMI website (Experimental Museum Interfaces, Edge Hill University)
**Related documents:** `PRD.md`, `README.md` (to be created in Sprint 0), `docs/ARCHITECTURE.md` (to be created in Sprint 0)
**Authors:** Dr David Walsh, Dr Daniel Campbell
**Delivery owner for this roadmap:** Dave Walsh
**Created:** April 2026
**Status:** Living document. Every sprint updates this file with completions, newly discovered work, and revised estimates.

---

## 1. Vision

Rebuild EMI as a Dockerised, CMS-backed research showcase so that new experiments, projects, research studies, publications, essays and partners can be added without code changes. Delivery follows Test-Driven Development (TDD) and Behaviour-Driven Development (BDD): every feature has an executable specification written before the code, and Sprint 1 is dedicated to writing the full initial test corpus so that all subsequent sprints exist to turn failing tests green.

## 2. Methodology

### 2.1 TDD and BDD rhythm

- Every user-facing capability is expressed first as a BDD scenario in Gherkin (`Given / When / Then`), stored under `tests/bdd/features/`.
- Every internal unit of logic is expressed first as a failing unit test under `tests/unit/`.
- Integration and end-to-end tests live under `tests/integration/` and `tests/e2e/`.
- Accessibility, performance, and security checks are expressed as tests under `tests/accessibility/`, `tests/performance/`, and `tests/security/`.
- A sprint is "done" only when all tests scoped for that sprint pass in CI, the PRD, this roadmap, README, and any other docs have been updated, and the CHANGELOG entry has been added.

### 2.2 Red, green, refactor

Each task follows the classic loop: write the failing test, confirm it fails for the right reason, write the minimum code to pass, refactor with tests green. No code is merged unless there is a test that would fail without it.

### 2.3 Definition of Done (applies to every sprint)

1. All acceptance tests scoped to the sprint pass locally and in CI.
2. No new lint, type-check, or accessibility regression errors.
3. `PRD.md`, `ROADMAP.md`, `README.md`, `CHANGELOG.md`, `.gitignore`, and any relevant ADR (architecture decision record) in `docs/adr/` are updated in the same commit series.
4. Test coverage for touched modules is at or above the agreed thresholds (see Sprint 1 for the thresholds).
5. Any items discovered during the sprint that are not closed are added to section 25, the backlog.
6. The Docker compose stack builds and runs cleanly against the sprint output.

## 3. Confirmation of current state

- The live site at `https://emi.computing.edgehill.ac.uk/` is a small static HTML site with four pages (Home, About, Experiments, Literature Review) plus three placeholder experiment sub-pages served under a misspelled `/experiements/` path. See `PRD.md` Section 3 for the full audit.
- The local workspace folder currently contains only `PRD.md` and this `ROADMAP.md`. The source HTML/CSS/JS for the live site is not in the workspace. Sprint 0 includes a task to obtain the current source either by copying the live files into the workspace or by cloning an existing repo. Until then, the migration plan treats the live site as reference only.

## 4. Recommended technology stack (decisions finalised in Sprint 0)

**Backend / CMS:** Strapi v4 (Node.js, TypeScript). Rationale: mature, Docker-native, content types and permissions out of the box, good plugin ecosystem, MIT licensed. Alternative to evaluate in Sprint 0: Payload CMS (code-first, TypeScript-native, stronger type safety).

**Database:** PostgreSQL 16. Rationale: stable, well understood, backs both Strapi and Payload cleanly.

**Frontend:** Next.js 14+ (App Router) in TypeScript. Rationale: SSR for SEO and accessibility, static export where appropriate, strong React component ecosystem for interactive experiments, mature Docker support.

**Styling:** Tailwind CSS with a handful of custom CSS modules for experiment pages that need bespoke visualisation styling.

**Testing:**

- Unit: Vitest
- Component: Vitest + React Testing Library
- BDD: Cucumber.js with Playwright as the driver
- End-to-end: Playwright
- Accessibility: axe-core via Playwright
- Performance: Lighthouse CI
- Security: npm audit plus OWASP ZAP baseline scan in CI

**Tooling:**

- Node 20 LTS
- pnpm workspaces
- ESLint, Prettier, TypeScript strict mode
- Husky pre-commit hooks (lint, format, unit tests)
- commitlint (Conventional Commits)

**CI/CD:** GitHub Actions (or GitLab CI if Edge Hill hosts it internally, decided in Sprint 0).

**Containerisation:** Docker Compose for local development and for server deployment. Multi-stage Dockerfiles for both `cms/` and `web/`.

**Analytics:** Plausible (self-hosted or managed), privacy-preserving, no cookies.

**Auth:** Strapi's built-in admin auth for CMS users, plus a public-facing contact form that is unauthenticated but rate-limited and protected by a lightweight honeypot.

## 5. Proposed folder structure

```
emi-website/
├── .github/
│   └── workflows/
│       ├── ci.yml
│       ├── accessibility.yml
│       ├── lighthouse.yml
│       └── deploy.yml
├── apps/
│   ├── cms/                         # Strapi (or Payload) backend
│   │   ├── src/
│   │   ├── config/
│   │   ├── database/migrations/
│   │   ├── seed/                    # seed scripts including admin seed
│   │   ├── Dockerfile
│   │   ├── package.json
│   │   └── tsconfig.json
│   └── web/                         # Next.js frontend
│       ├── app/
│       │   ├── (marketing)/
│       │   │   ├── page.tsx         # Home
│       │   │   ├── about/page.tsx
│       │   │   ├── experiments/
│       │   │   ├── voice/
│       │   │   ├── legacy/
│       │   │   ├── research/
│       │   │   ├── writing/
│       │   │   └── collaborate/
│       │   ├── api/                 # BFF/proxy routes if needed
│       │   └── layout.tsx
│       ├── components/
│       ├── lib/                     # CMS client, content helpers
│       ├── public/
│       ├── styles/
│       ├── Dockerfile
│       ├── next.config.mjs
│       ├── package.json
│       └── tsconfig.json
├── packages/
│   ├── shared-types/                # cross-package TypeScript types
│   └── ui/                          # optional shared component library
├── tests/
│   ├── unit/
│   │   ├── web/
│   │   └── cms/
│   ├── integration/
│   │   ├── cms-api/
│   │   └── web-cms/
│   ├── e2e/
│   │   ├── specs/
│   │   └── fixtures/
│   ├── bdd/
│   │   ├── features/
│   │   │   ├── home.feature
│   │   │   ├── about.feature
│   │   │   ├── experiments-listing.feature
│   │   │   ├── experiments-detail.feature
│   │   │   ├── voice-section.feature
│   │   │   ├── legacy-section.feature
│   │   │   ├── research-section.feature
│   │   │   ├── writing-section.feature
│   │   │   ├── collaborate.feature
│   │   │   ├── admin-auth.feature
│   │   │   ├── cms-content-model.feature
│   │   │   ├── cms-publishing-workflow.feature
│   │   │   ├── contact-form.feature
│   │   │   ├── search.feature
│   │   │   ├── navigation.feature
│   │   │   ├── redirects-legacy-urls.feature
│   │   │   ├── accessibility.feature
│   │   │   ├── performance.feature
│   │   │   ├── seo-metadata.feature
│   │   │   └── docker-boot.feature
│   │   ├── step_definitions/
│   │   └── support/
│   ├── accessibility/
│   │   └── axe-checks.spec.ts
│   ├── performance/
│   │   └── lighthouse-budgets.json
│   ├── security/
│   │   └── zap-baseline.yaml
│   └── fixtures/
│       └── seed-content/
├── docs/
│   ├── PRD.md
│   ├── README.md
│   ├── ARCHITECTURE.md
│   ├── CONTRIBUTING.md
│   ├── DEPLOYMENT.md
│   ├── CONTENT_AUTHORING.md
│   ├── adr/
│   │   ├── 0001-cms-choice.md
│   │   ├── 0002-frontend-framework.md
│   │   └── 0003-testing-stack.md
│   └── CHANGELOG.md
├── legacy-static/                   # copy of the current live site, read-only reference
├── scripts/
│   ├── seed-admin.ts
│   ├── seed-content.ts
│   └── migrate-legacy.ts
├── docker-compose.yml
├── docker-compose.dev.yml
├── docker-compose.prod.yml
├── .env.example
├── .env.local                       # gitignored, contains real secrets
├── .gitignore
├── .editorconfig
├── .nvmrc
├── package.json                     # pnpm workspaces root
├── pnpm-workspace.yaml
├── tsconfig.base.json
├── README.md
├── ROADMAP.md
└── LICENSE
```

## 6. Admin seed credentials

> **Security.** Credentials are never stored in this file or anywhere in the repository. Before running the seed script for the first time, create `apps/cms/seed/.env.seed` (this path is gitignored) and populate it with the values below. The admin password should be rotated on first login after the seed runs.

| Field    | Value                                                    |
| -------- | -------------------------------------------------------- |
| Username | `walshd@edgehill.ac.uk`                                  |
| Email    | `walshd@edgehill.ac.uk`                                  |
| Role     | Super Admin                                              |
| Password | Set in `apps/cms/seed/.env.seed` as `APP_ADMIN_PASSWORD` |

> **Operator note:** store the password only in `apps/cms/seed/.env.seed` under the key `APP_ADMIN_PASSWORD`. Never commit that file. The seed script reads from the environment; the roadmap holds no plaintext secrets.

## 7. Release milestones

- **M0 Setup complete.** End of Sprint 0.
- **M1 Test harness green with all placeholder assertions failing as expected.** End of Sprint 1.
- **M2 Private preview of the CMS + frontend pair running in Docker.** End of Sprint 6.
- **M3 Public soft launch at current domain with migrated content.** End of Sprint 15.
- **M4 Voice and Legacy sections live.** End of Sprint 18.
- **M5 Public launch announcement.** End of Sprint 20.

## 8. Sprint cadence

Two-week sprints. One-week sprints acceptable for small scopes (Sprints 0, 4, 14). Buffer week inserted after Sprint 10 for mid-project review. Every sprint ends with a demo recording saved to `docs/demos/sprint-NN.mp4`.

---

# Sprint 0: Foundations and decisions

**Duration:** 1 week
**Goal:** Make the technical and repository decisions so all later sprints can start without ambiguity.

## Scope

- Initialise the monorepo with pnpm workspaces.
- Create `.gitignore`, `.editorconfig`, `.nvmrc`, `LICENSE`, `CHANGELOG.md`, `README.md` (initial skeleton), `docs/ARCHITECTURE.md`, `docs/CONTRIBUTING.md`, `docs/adr/0001-cms-choice.md`, `docs/adr/0002-frontend-framework.md`, `docs/adr/0003-testing-stack.md`.
- Decide: Strapi vs Payload (ADR 0001), Next.js vs Astro (ADR 0002), Cucumber vs Playwright-only BDD (ADR 0003).
- Pull the live site into `legacy-static/` as a read-only reference copy, clearly labelled.
- Stand up empty Dockerfiles for `apps/cms/` and `apps/web/` and a `docker-compose.yml` with three services: cms, db, web. They may not run yet; the sprint succeeds when the files exist and pass linting.
- Create `.env.example` listing every environment variable the stack will need.
- Commit Git hooks (Husky, commitlint, lint-staged).
- Wire an initial CI workflow that runs lint and type-check on every pull request.

## Out of scope

- Any runtime functionality.
- Any content modelling (Sprint 3).
- Writing tests beyond the empty harness (Sprint 1).

## Prerequisites

- Access to the live site source. If it is not obtainable in Sprint 0, add a task to Sprint 15 (migration) and scrape-as-read-only until then.
- A GitHub (or GitLab) repository provisioned.

## BDD scenarios to draft (not yet executable)

- `docker-boot.feature`: "Given a fresh clone, when I run `docker compose up`, the cms and web containers start and expose their ports."
- `navigation.feature`: "Given the home page, when I click each top-level nav item, I am navigated to the corresponding section page."

## Acceptance criteria

- `pnpm install` at the repo root succeeds with no warnings.
- `pnpm lint` runs and passes across the empty scaffolds.
- `docker compose config` validates the compose file.
- `README.md` contains a one-page project overview and local-dev quick start.
- Three ADRs exist and reference the tech choices.
- `.gitignore` excludes `.env.local`, `apps/cms/seed/.env.seed`, `node_modules/`, `dist/`, `.next/`, `coverage/`, and `legacy-static/` if Dave prefers the legacy copy not to be tracked (decision point).

## Deliverables

- Monorepo skeleton.
- Empty Dockerfiles and compose files.
- Three ADRs.
- README skeleton.
- `.gitignore`, `.env.example`.

## Documentation updates

- `PRD.md` front matter: add current sprint reference.
- `ROADMAP.md`: mark Sprint 0 items closed, capture newly discovered tasks into section 25.
- `CHANGELOG.md`: initial entry.

---

# Sprint 1: Test harness and full BDD feature corpus ✓ Complete

**Duration:** 2 weeks  
**Delivered:** 2026-04-18  
**Goal:** Write all BDD feature files and unit test stubs for every planned feature so that every subsequent sprint is a matter of turning specific failing tests green. No production code is written in this sprint beyond the minimum needed to make the test runner execute.

## Scope

- Install and configure Vitest, Playwright, Cucumber.js, axe-core, Lighthouse CI.
- Create the full `tests/bdd/features/` set listed in section 5 with Gherkin scenarios covering every capability in the PRD.
- Create stub unit tests for planned `cms/` content-type validators and `web/` helpers.
- Configure coverage reporting (Istanbul via Vitest) with initial target 80% lines, 75% branches for new code.
- Configure Playwright to run in headed and headless modes, and on CI with traces on failure.
- Wire axe-core into a smoke accessibility suite that hits every public route once.
- Wire Lighthouse CI with performance and accessibility budgets.

## BDD feature files to author (each with 3 to 8 scenarios)

**home.feature**

- Landing layout shows positioning statement, featured experiments strip, recent writing list, and Collaborate CTA.
- All featured items are pulled from the CMS, not hardcoded.
- Passes axe smoke check.

**about.feature**

- Renders the group statement, named leads, and institutional links.
- Lists research values and scope statement.

**experiments-listing.feature**

- Lists all Experiments marked Published in the CMS.
- Filters by research thread, dataset, and status.
- Hides Draft entries from anonymous visitors.

**experiments-detail.feature**

- Uses the standard template (title, status, thread, dataset, interface embed, what this demonstrates, evaluation, known limitations, reproduction, citations, acknowledgements, suggested citation).
- Citation widget yields a valid BibTeX block and a formatted APA/Harvard string.

**voice-section.feature**

- Overview page, Grid page, Browse page, Evaluation page, and Roadmap page render.
- Each voice prototype page contains a recorded demo video, a transcript, a keyboard fallback, and an AI disclosure panel where applicable.

**legacy-section.feature**

- Each Legacy entry names the original authors, institution, dataset, and cites the original publication.
- The EMI approximation is clearly labelled as a contemporary approximation.

**research-section.feature**

- Research thread pages link to associated Experiments and Writing entries.
- The Limitations-of-Browsing page renders with numbered sections and a reference list generated from CMS References.

**writing-section.feature**

- Publications, Essays, Talks, and Press tabs each filter the same underlying content type by category and order by date descending.
- Each entry has a stable citation URL.

**collaborate.feature**

- Contact form validates required fields, rate-limits submissions, stores leads in the CMS, and sends a confirmation email to the submitter and a notification email to the owners.
- The form is honeypot-protected and rejects submissions that fail the honeypot check.

**admin-auth.feature**

- The seeded admin user can log in with the exact seeded password.
- Sign-in attempts with trimmed whitespace variants are asserted (see section 6 trailing-space note).
- Incorrect passwords are rejected with a non-enumerating error message.
- After login the admin can access all content-type collections.

**cms-content-model.feature**

- The following content types exist with the specified fields: Experiment, Project, ResearchStudy, Publication, Essay, Talk, PressMention, Partner, Dataset, TeamMember, ResearchThread, LegacyInterface, VoicePrototype, ContactLead.
- Validation rules reject invalid data (empty title, invalid URL, wrong status).

**cms-publishing-workflow.feature**

- Draft, In Review, Published, and Archived states exist.
- Only Published items are visible to anonymous visitors.
- A scheduled-publish timestamp moves an item from Draft to Published at the set time.

**contact-form.feature**

- As above under collaborate.feature; split out for granular unit coverage.

**search.feature**

- Site-wide search returns results from Experiments, Writing, and Research threads.
- Results are ranked by relevance and recency.

**navigation.feature**

- Each top-level nav item routes to the right page.
- The current section is highlighted.
- Skip-to-main-content link works for keyboard users.

**redirects-legacy-urls.feature**

- `/experiements/*` 301-redirects to `/experiments/*`.
- `/about.html`, `/literature.html`, and `/experiments.html` 301-redirect to the new canonical routes.
- The original home URL continues to resolve.

**accessibility.feature**

- Every public route has zero axe violations at severity Serious or above.
- All images have alt text (decorative images marked `role="presentation"`).
- Colour contrast at AA on all text.
- Keyboard focus order follows visual order.

**performance.feature**

- Largest Contentful Paint under 2.5s on simulated Fast 3G for text-heavy pages.
- Total page weight under 500KB for text-only routes (home, about, research pages).
- Demo pages may exceed this budget but must show a lightweight preview first.

**seo-metadata.feature**

- Every page has a unique title, meta description, canonical URL, and OpenGraph tags.
- Sitemap.xml and robots.txt exist and are valid.

**docker-boot.feature**

- `docker compose up --build` brings the stack up within 2 minutes on a developer machine.
- `cms` container is healthy at `/_health`.
- `web` container is healthy at `/api/health`.

## Acceptance criteria for Sprint 1

- Every feature file above exists under `tests/bdd/features/` with scenarios drafted.
- Running `pnpm test:bdd` executes all features and produces a red report.
- Running `pnpm test:unit` executes the unit stubs and produces a red report.
- The CI workflow runs unit, integration, e2e, accessibility, and lighthouse jobs on every PR; all currently failing, as expected.
- A failing-tests dashboard is published as part of CI output so progress can be tracked.

## Documentation updates

- `CONTRIBUTING.md`: explain the red-green-refactor workflow and where to put new tests.
- `ARCHITECTURE.md`: record the testing pyramid decision.
- `ROADMAP.md`: update this file with any newly discovered work into section 25.

---

# Sprint 2: CMS core and Docker foundations ✅ COMPLETE

**Duration:** 2 weeks
**Completed:** 2026-04-18
**Goal:** Stand up the CMS, Postgres, and web containers cleanly. Make `docker-boot.feature` go green.

## Scope

- Bring Strapi (or chosen CMS) online in `apps/cms/`.
- Provision PostgreSQL in `docker-compose.yml` with a persistent volume.
- Configure environment variables via `.env.local`.
- Implement health endpoints.
- Implement TLS-ready config for later production use.
- Turn `docker-boot.feature` green.

## Acceptance criteria

- `docker compose up` brings cms, db, and web up and each reports healthy within 120 seconds.
- The CMS admin UI is reachable at `http://localhost:1337/admin` (or chosen port).
- The web app reaches the CMS and renders a heartbeat route at `/` showing CMS status.
- Sprint 1's docker-boot BDD scenarios all pass.

## Deliverables

- Working compose stack.
- Healthy CMS.
- ADR update 0001 if a choice changed.

## Docs updates

- `DEPLOYMENT.md`: initial local-dev instructions.
- `README.md`: quick start updated.

---

# Sprint 3: Content model

**Duration:** 2 weeks
**Goal:** Define and create every CMS content type required by the PRD, with validation, relations, and fixtures.

## Scope

Content types to create (exact field lists maintained in `apps/cms/src/api/*/content-types/`):

- **Experiment:** title, slug, status (draft/live/archived/in-progress), shortDescription, fullDescription, threads (relation to ResearchThread, many-to-many), dataset (relation to Dataset), interfaceEmbed (URL), howToTry, whatThisDemonstrates, evaluation, knownLimitations, reproductionLinks, citations (relation to Publication, many-to-many), acknowledgements, suggestedCitation, heroImage, gallery, publishedAt.
- **Project:** title, slug, summary, leads (relation to TeamMember), partners (relation to Partner), funding, period, outputs (relation to Experiment/Publication).
- **ResearchStudy:** title, slug, question, method, participants, findings, ethicsApproval, linkedExperiments.
- **Publication:** title, authors, venue, year, doi, url, abstract, bibtex, threads (relation).
- **Essay:** title, slug, author (relation TeamMember), body (rich text), publishedAt, threads.
- **Talk:** title, venue, date, slides (file), recording (URL), speakers (relation).
- **PressMention:** title, outlet, date, url, summary.
- **Partner:** name, logo, url, type (museum/archive/library/industry/academic), active (boolean).
- **Dataset:** name, source, sampleSize, licence, url, rightsNotes.
- **TeamMember:** name, role, bio, email, orcid, dblp, scholar, github, profileImage, active.
- **ResearchThread:** name, slug, definition, openQuestions, featured.
- **LegacyInterface:** title, originalAuthors, originalInstitution, originalDataset, originalPublication, approximationDataset, approximationNotes, liveDemoUrl.
- **VoicePrototype:** name, slug, description, commandGrammar, recogniserConfig, demoVideoUrl, evaluation, knownFailureModes.
- **ContactLead:** organisation, contactName, email, topic, message, submittedAt, source.

## BDD scenarios to satisfy

- `cms-content-model.feature` in full.
- Half of `cms-publishing-workflow.feature` (Draft/Published visibility rules).

## Acceptance criteria

- All content types visible in the CMS admin UI.
- Validation rejects invalid records.
- Relations work in both directions.
- Seed fixtures under `tests/fixtures/seed-content/` load without error.

## Docs updates

- `ARCHITECTURE.md`: content-model section.
- `CONTENT_AUTHORING.md`: first draft showing how to author each content type.
- `PRD.md`: Section 7.3 and Section 10.1 cross-linked to the content model.

---

# Sprint 4: Admin seed and authentication

**Duration:** 1 week
**Goal:** Provision the admin account from a seed script, harden auth, turn `admin-auth.feature` green.

## Scope

- Implement `scripts/seed-admin.ts` that reads `APP_ADMIN_EMAIL` and `APP_ADMIN_PASSWORD` from `apps/cms/seed/.env.seed` and creates the Super Admin on first boot only.
- Source values as per section 6. Preserve the trailing space unless Dave confirms otherwise.
- Add BDD scenarios covering trailing-space handling.
- Enforce account lockout after 10 failed attempts per IP per hour.
- Enforce password minimum complexity for any subsequent admin creation.
- Add a "change password" flow BDD scenario as Backlog-item SEC-001 for later work.

## Acceptance criteria

- `admin-auth.feature` passes.
- Seed is idempotent: re-running does not create a second admin or reset the first.
- `apps/cms/seed/.env.seed` is in `.gitignore`.

## Docs updates

- `DEPLOYMENT.md`: admin bootstrap section with security guidance.
- `README.md`: note that first-run requires `.env.seed`.

---

# Sprint 5: Frontend skeleton and routes

**Duration:** 2 weeks
**Goal:** Scaffold the Next.js app with every route from section 18 of the PRD and a single shared layout.

## Scope

- Create all routes below as empty but accessible pages (confirmed sitemap, Sprint 0):
  - `/` Home
  - `/about`
  - `/research`, `/research/dch-users`, `/research/dch-users/casual-users`, `/research/generous-and-rich-prospect`, `/research/ai-supported-exploration`, `/research/evaluation-and-user-categories`, `/research/limitations-of-browsing`
  - `/experiments`, `/experiments/voice`, `/experiments/voice/overview`, `/experiments/voice/grid`, `/experiments/voice/grid/live`, `/experiments/voice/driven-browsing`, `/experiments/voice/interaction`, `/experiments/voice/evaluation`, `/experiments/voice/roadmap`
  - `/experiments/legacy`, `/experiments/legacy/[slug]`
  - `/writing`, `/writing/publications`, `/writing/blog`
  - `/collaborate`
- Shared `<Header>`, `<Footer>`, `<SkipLink>`, `<Navigation>`.
- Wire CMS client (typed) with a cached fetcher.
- Implement global 404 and 500 pages.
- Implement `/sitemap.xml` and `/robots.txt` generators.
- Turn `navigation.feature`, `seo-metadata.feature` partial, `redirects-legacy-urls.feature` green.

## Acceptance criteria

- Every route in the confirmed sitemap resolves with a 200.
- Navigation highlights the current top-level section.
- `/collaborate` links to `/experiments/voice/grid/live`.
- Legacy URLs redirect as specified.

## Docs updates

- `ARCHITECTURE.md`: route map already updated in Sprint 0. Confirm layout contract here.

---

# Sprint 6: Home and About pages

**Duration:** 2 weeks
**Goal:** Deliver the first two credibility-critical pages end to end. Reach Milestone M2.

## Scope

- Home page: positioning sentence, three-paragraph elaboration, featured experiments strip (pulled from CMS `featured` flag), recent writing list, Collaborate CTA.
- About page: group statement, leads, institutional links, scope statement.
- Remove the unexplained email sign-up form from the current site unless Dave wants to keep it, in which case link it to a properly scoped Mailchimp audience with a clear purpose statement (decision point).
- Turn `home.feature` and `about.feature` green.

## Acceptance criteria

- Home renders all four blocks with real CMS data.
- About renders without a single hardcoded leader name.
- Accessibility tests pass for both pages.

## Docs updates

- `PRD.md`: Section 7.1 and 7.2 cross-linked to delivered pages.

---

# Sprint 7: Experiments catalogue and demo template

**Duration:** 2 weeks
**Goal:** Replace the three placeholder pages with a real catalogue driven by the CMS.

## Scope

- Experiments listing page with filters by thread, dataset, status.
- Experiment detail page following the section 10.1 template.
- Embed slot that renders either an iframe or a React component reference.
- Citation widget.
- Turn `experiments-listing.feature` and `experiments-detail.feature` green.
- Migrate the three existing titles (Collection Explorer, Timeline Journey, Generous Browsing) into real CMS entries with "in progress" status and at least one populated field per section of the template.

## Acceptance criteria

- Listing paginates when more than 12 experiments exist.
- Detail pages pass accessibility tests.
- Citation widget yields valid BibTeX and Harvard strings.

## Docs updates

- `CONTENT_AUTHORING.md`: experiment-authoring walkthrough.

---

# Sprint 8: Research section and Limitations-of-Browsing reference

**Duration:** 2 weeks
**Goal:** Deliver the research-thread pages and the Limitations-of-Browsing reference page. Preserve the existing Generous Interfaces literature review content.

## Scope

- Research thread index and detail pages.
- Preserve the existing Generous Interfaces content at `/research/generous-interfaces`.
- Build the Limitations-of-Browsing page following PRD Section 12.1.
- Reference list pulled from CMS Publication entries.
- Turn `research-section.feature` green.

## Acceptance criteria

- Every research thread has at least one linked Experiment and one linked Publication.
- Limitations-of-Browsing references link to DOIs where available.

## Docs updates

- `PRD.md`: Section 12 cross-linked to implementation.

---

# Sprint 9: Voice section

**Duration:** 2 weeks
**Goal:** Deliver the Voice overview, Grid, Browse, Evaluation, and Roadmap pages as content surfaces, with the first Grid prototype embedded.

## Scope

- Five Voice pages as per PRD Section 9.
- Embed the current voice-controlled collection grid prototype (iframe or Next.js route).
- Transcripts, keyboard fallback, AI disclosure panels.
- Turn `voice-section.feature` green.

## Acceptance criteria

- Every voice page has a recorded demo video with captions and transcript.
- Keyboard-only users can operate the grid prototype.

## Docs updates

- `docs/demos/voice-grid.md`: short operator guide.

---

# Sprint 10: Legacy section with dataset strategy

**Duration:** 2 weeks
**Goal:** First Legacy approximation live plus the section framework.

## Scope

- Legacy index and detail pages.
- At least one approximation built using one of the datasets listed in PRD Section 11.2.
- Turn `legacy-section.feature` green.

## Acceptance criteria

- The first Legacy page names original authors, institution, and publication.
- Live approximation is reachable and annotated as such.

## Docs updates

- `PRD.md`: Section 11.3 updated with the chosen first legacy interface.

_(Buffer week follows Sprint 10 for mid-project review.)_

---

# Sprint 11: Writing section

**Duration:** 2 weeks
**Goal:** Publications, Essays, Talks, Press tabs all driven from the CMS.

## Scope

- Writing index with four tabs.
- Publication detail pages with citation widget.
- Essay renderer with MDX support and footnote plugin.
- Turn `writing-section.feature` green.

## Acceptance criteria

- Publications imported from Walsh's and Campbell's existing lists (manual import in this sprint; automated import is backlog-item IMP-001).
- Essay routes resolvable at stable permalinks.

---

# Sprint 12: Collaborate page and contact form

**Duration:** 2 weeks
**Goal:** Replace "no contact surface" with a partner-facing page and a rate-limited form.

## Scope

- Collaborate page per PRD Section 7.8.
- Contact form backed by the ContactLead content type.
- Confirmation emails via transactional provider (SMTP or SendGrid, decided in Sprint 0 ADR 0004).
- Honeypot + rate limiting.
- Turn `collaborate.feature` and `contact-form.feature` green.

## Acceptance criteria

- Submissions land as ContactLead records.
- Duplicate submissions from the same IP within 60 seconds are rejected.

## Docs updates

- `PRD.md`: Section 7.8 cross-linked.

---

# Sprint 13: Accessibility, SEO, OpenGraph

**Duration:** 2 weeks
**Goal:** Reach WCAG 2.2 AA across all delivered pages.

## Scope

- Full axe-core sweep.
- OpenGraph and Twitter-card metadata for every page.
- Keyboard and screen-reader audits documented in `docs/ACCESSIBILITY.md`.
- Turn `accessibility.feature` and `seo-metadata.feature` green.

## Acceptance criteria

- Zero Serious or Critical axe violations on any route.
- Lighthouse SEO score at 95 or above for all public pages.

## Docs updates

- `ACCESSIBILITY.md`: first version.

---

# Sprint 14: Analytics and privacy

**Duration:** 1 week
**Goal:** Stand up privacy-preserving analytics and a clear privacy notice.

## Scope

- Plausible integration.
- Privacy page explaining what is tracked and what is not.
- Cookie-free analytics confirmed.
- Update email sign-up form (if retained) with a proper privacy note and GDPR lawful-basis statement.

## Acceptance criteria

- Analytics events fire on page views and specific demo interactions.
- No cookies set.
- Privacy page links from the footer.

---

# Sprint 15: Content migration from legacy static site (Milestone M3)

**Duration:** 2 weeks
**Goal:** Every page and piece of content from the legacy static site is either migrated, archived with redirect, or explicitly deprecated.

## Scope

- Migrate About copy into the CMS (retain the current strong wording).
- Migrate Literature Review Generous Interfaces content into `/research/generous-interfaces`.
- Archive the three placeholder experiments as in-progress CMS entries.
- Configure the 301 redirect map.
- Soft-launch at the current domain.

## Acceptance criteria

- Every URL from the legacy audit resolves, either as new content or as a 301 redirect.
- The September 2024 blog post is either archived or rehomed as an Essay.
- `redirects-legacy-urls.feature` fully green.

## Docs updates

- `ROADMAP.md`: tick M3.
- `CHANGELOG.md`: migration release entry.

---

# Sprint 16: Dockerised production build and CI/CD

**Duration:** 2 weeks
**Goal:** Production-ready images and a reproducible deployment pipeline.

## Scope

- Multi-stage Dockerfiles for `cms` and `web`.
- `docker-compose.prod.yml` with Postgres volume, reverse proxy (Caddy or Nginx), TLS via Let's Encrypt.
- GitHub Actions workflows: CI on every PR, build-and-deploy on tagged releases.
- Backup strategy for the Postgres volume documented in `DEPLOYMENT.md`.

## Acceptance criteria

- `docker compose -f docker-compose.prod.yml up --build` produces a working production stack on a target host.
- CI produces signed container images on tagged releases.

## Docs updates

- `DEPLOYMENT.md`: full production runbook.

---

# Sprint 17: First voice prototype delivered end to end

**Duration:** 2 weeks
**Goal:** The voice-controlled collection grid prototype is live, not only described. Milestone M4 begins.

## Scope

- Implement the voice grid with a browser speech recogniser (Web Speech API) and a clearly documented command grammar.
- Add the evaluation protocol as defined in PRD Section 9.2.
- First public write-up as an Essay.

## Acceptance criteria

- Voice commands work in Chrome and Safari latest.
- Keyboard fallback operates every command.
- Usability walkthrough recorded with at least three testers.

---

# Sprint 18: First Legacy approximation end to end (Milestone M4 complete)

**Duration:** 2 weeks
**Goal:** A running, documented approximation of a historically important research interface that is no longer online.

## Scope

- Implement the approximation chosen in Sprint 10 on the confirmed dataset.
- Full detail page with attribution and comparison notes.
- Short essay describing the approximation and its honest limitations.

## Acceptance criteria

- Original authors contacted and approach acknowledged.
- Page carries the full "approximation, not replication" framing.

---

# Sprint 19: Content authoring workflow and handover

**Duration:** 1 week
**Goal:** Make the site maintainable by a single postgraduate researcher without help.

## Scope

- Finalise `CONTENT_AUTHORING.md` with per-content-type walkthroughs and screenshots.
- Record a 20-minute screen walkthrough of the CMS.
- Document the content review checklist.
- Document the emergency rollback procedure.

## Acceptance criteria

- A new contributor can publish an Essay from scratch in under 20 minutes following the docs.

---

# Sprint 20: Public launch (Milestone M5)

**Duration:** 2 weeks
**Goal:** Announce publicly.

## Scope

- Announcement copy for Europeana Pro, DL community, UK museum digital networks, and the authors' own channels.
- Press pack.
- Final accessibility and performance re-audit.
- Soak-test the contact form.

## Acceptance criteria

- No Serious or Critical test failures across any suite.
- Announcement posts scheduled.
- Home page live at the canonical domain with the new structure.

---

# 25. Backlog

Items captured during planning or discovered mid-sprint. Prioritised at the start of every sprint review.

| ID          | Title                                                                 | Origin    | Priority | Notes                                          |
| ----------- | --------------------------------------------------------------------- | --------- | -------- | ---------------------------------------------- |
| SEC-001     | Admin "change password" self-serve flow                               | Sprint 4  | High     | Must be in place before broad internal access. |
| SEC-002     | Two-factor authentication for CMS admin                               | Planning  | High     | TOTP.                                          |
| IMP-001     | Automated publication import from ORCID/DBLP                          | Sprint 11 | Medium   | Nightly cron.                                  |
| DATA-001    | Partner data sharing and NDA template                                 | Planning  | High     | Needed before partner datasets touch the site. |
| DATA-002    | Rights audit script for legacy datasets                               | Planning  | Medium   |                                                |
| VOICE-001   | Voice-paced browsing prototype                                        | PRD §9.3  | Medium   | Novel direction.                               |
| VOICE-002   | Collaborative voice browsing (two users, one screen)                  | PRD §9.3  | Low      | Novel direction.                               |
| AI-001      | Embedding-driven "more like this, but surprising" browser             | PRD §10.2 | Medium   |                                                |
| AI-002      | LLM-backed conversational guide with catalogue citations              | PRD §10.2 | Medium   | Hallucination controls mandatory.              |
| NOVEL-001   | Collections as atmospheres (ambient display prototype)                | PRD §10.2 | Low      |                                                |
| NOVEL-002   | Personal trails as first-class objects                                | PRD §10.2 | Medium   |                                                |
| NOVEL-003   | Negotiated queries                                                    | PRD §10.2 | Medium   |                                                |
| NOVEL-004   | Collection cross-walks                                                | PRD §10.2 | Medium   |                                                |
| NOVEL-005   | Forgetting interfaces                                                 | PRD §10.2 | Low      |                                                |
| NOVEL-006   | Explanation dashboards                                                | PRD §10.2 | Medium   |                                                |
| NOVEL-007   | Child and family modes                                                | PRD §10.2 | Low      |                                                |
| OPS-001     | Weekly Postgres backup verification                                   | Sprint 16 | High     |                                                |
| OPS-002     | On-call rotation and incident log                                     | Planning  | Low      |                                                |
| CONTENT-001 | Campbell programme page inputs                                        | PRD §17   | High     | Blocks Sprint 8.                               |
| CONTENT-002 | Confirmed first legacy interface target                               | PRD §17   | High     | Blocks Sprint 10.                              |
| A11Y-001    | Voice-first accessibility evaluation (screen-reader + voice combined) | PRD §9.3  | Medium   |                                                |
| INFRA-001   | Evaluate Payload vs Strapi with a spike in Sprint 0                   | Planning  | High     | Decision blocker.                              |
| INFRA-002   | ~~Decide CI host~~ **Resolved:** GitHub Actions on public GitHub repo | Planning  | ~~High~~ | Resolved 2026-04-17.                           |
| INFRA-003   | Staging environment                                                   | Planning  | Medium   | Recommended before Sprint 15.                  |

---

# 26. Risks and mitigations

- **Trailing-space password.** Silent whitespace trimming is a common cause of authentication failures; mitigated by the Sprint 4 scenarios and operator note in section 6.
- **CMS choice reversal mid-project.** Mitigated by keeping content-type definitions abstract under `packages/shared-types/` so swapping Strapi for Payload would touch backend only.
- **Voice browser support.** Web Speech API availability varies; mitigated by documenting tested browsers and providing the keyboard fallback as a first-class path.
- **Under-resourcing.** If this is a solo-maintainer project, scope must be allowed to slip; the Backlog and the buffer week give clear overflow routes.
- **GDPR on the current email sign-up.** Mitigated by removing the form or properly scoping it in Sprint 6.
- **Partner data leakage.** Mitigated by DATA-001 and the dataset strategy in PRD Section 14.3.

---

# 27. Open decisions needed before Sprint 0 ends

1. Strapi vs Payload.
2. ~~CI host choice.~~ **Resolved:** GitHub Actions.
3. Email provider for the contact form and confirmations.
4. Hosting target for production (Edge Hill VM vs managed Docker host).
5. Git hosting (GitHub public, GitHub private, Edge Hill GitLab).
6. Whether to keep the home-page email sign-up form or remove it.
7. Licence for the repository (recommended: MIT for code, CC-BY-4.0 for written content).
8. Trailing-space password confirmed or replaced.

---

# 28. Changelog of this roadmap

- **2026-04-17:** v0.1. Initial roadmap with twenty sprints, full BDD feature corpus planned, backlog seeded, admin seed captured with security note.
- **2026-04-17:** v0.2. Credentials redacted from Section 6; admin email updated to `walshd@edgehill.ac.uk`; password reference moved to `apps/cms/seed/.env.seed`. INFRA-002 resolved: GitHub Actions confirmed as CI platform.
- **2026-04-18:** v0.3. Site structure confirmed from agreed sitemap. Sprint 1 delivered: 19 BDD feature files, unit test stubs, test runner configs, axe-core sweep, Lighthouse budgets. Sprint 5 route list updated to match. `ARCHITECTURE.md` route map updated. Key structural decisions: Research is a parent section with five sub-pages; Experiments contains Voice (specialised thread, six sub-pages including live grid) and Legacy (reconstruction detail pages); Writing has Publications and Blog tabs; Collaborate/Participate links to the live voice grid experiment.
