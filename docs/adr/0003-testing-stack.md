# ADR 0003 — Testing Stack

**Status:** Accepted  
**Date:** 2026-04-17  
**Deciders:** Dr David Walsh, Dr Daniel Campbell

---

## Context

The project follows TDD and BDD. Every user-facing capability must have an executable Gherkin specification before the code. The testing stack must cover unit, integration, end-to-end, accessibility, performance, and security concerns, and must run in GitHub Actions CI without manual intervention.

---

## Decisions

### Unit and integration tests — Vitest

Vitest is selected over Jest. It is faster (native ES modules, no transpilation step), has a compatible Jest API (minimal migration cost if switching), and integrates directly with Vite-based toolchains. Coverage is provided by Istanbul via the `@vitest/coverage-istanbul` plugin. Initial thresholds: 80% lines, 75% branches for all new code.

### BDD — Cucumber.js with Playwright as the driver

Cucumber.js provides the Gherkin parser and step-definition runtime. Playwright drives the browser for all BDD scenarios that require a UI. This combination was chosen over Playwright's built-in test runner for BDD because:

- Gherkin feature files are readable by non-developers (future research collaborators, postgraduate maintainers).
- Scenarios authored in Sprint 1 serve as executable requirements documentation independent of the implementation.
- The `@cucumber/playwright` package integrates cleanly.

Feature files live in `tests/bdd/features/`. Step definitions live in `tests/bdd/step_definitions/`. Playwright traces are captured on failure in CI.

### End-to-end — Playwright

Playwright runs both the BDD-driven scenarios and standalone e2e specs under `tests/e2e/`. Tests run in headless mode in CI and headed mode locally. Browsers: Chromium and WebKit (covers Chrome and Safari, the two browsers confirmed for the voice experiments).

### Accessibility — axe-core via Playwright

`@axe-core/playwright` is injected into Playwright test runs. Every public route is checked in a smoke suite (`tests/accessibility/axe-checks.spec.ts`). The bar is zero violations at severity Serious or Critical. This maps to WCAG 2.2 AA.

### Performance — Lighthouse CI

`@lhci/cli` runs against a locally served production build in CI. Budgets are defined in `tests/performance/lighthouse-budgets.json`. Initial budgets: LCP under 2.5s on simulated Fast 3G, total weight under 500 KB for text routes.

### Security — npm audit + OWASP ZAP baseline

`npm audit` (via `pnpm audit`) runs in CI on every PR to catch known CVEs in dependencies. OWASP ZAP baseline scan runs in the CI security job against the deployed staging environment (Sprint 16+).

---

## Consequences

- `pnpm test:unit` — Vitest unit and integration tests
- `pnpm test:bdd` — Cucumber.js BDD scenarios
- `pnpm test:e2e` — Playwright e2e specs
- `pnpm test:a11y` — axe-core accessibility sweep
- `pnpm test:perf` — Lighthouse CI budgets
- `pnpm audit` — dependency vulnerability check

All jobs are wired in `.github/workflows/ci.yml`. The full test suite must be green (or intentionally red as documented in Sprint 1) before a PR can be merged.
