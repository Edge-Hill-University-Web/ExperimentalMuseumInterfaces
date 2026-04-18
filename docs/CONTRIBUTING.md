# Contributing

This document describes how to contribute to the EMI website codebase. All contributors — including the project leads — follow the same workflow.

---

## 1. Red, green, refactor

This project is built with Test-Driven Development (TDD) and Behaviour-Driven Development (BDD). **No production code is merged without a failing test that proves it is needed.**

The loop for every piece of work:

1. Write a failing BDD scenario (Gherkin) or unit test that describes the desired behaviour.
2. Confirm the test fails for the right reason (not a setup error).
3. Write the minimum code to make the test pass.
4. Refactor with the tests green.
5. Open a pull request. CI must be green before merging.

---

## 2. Where tests live

| Test type     | Location                                       | Runner                   |
| ------------- | ---------------------------------------------- | ------------------------ |
| Unit          | `tests/unit/web/` and `tests/unit/cms/`        | Vitest                   |
| Integration   | `tests/integration/`                           | Vitest                   |
| BDD / E2E     | `tests/bdd/features/` (Gherkin) + `tests/e2e/` | Cucumber.js + Playwright |
| Accessibility | `tests/accessibility/`                         | axe-core via Playwright  |
| Performance   | `tests/performance/`                           | Lighthouse CI            |
| Security      | `tests/security/`                              | npm audit + OWASP ZAP    |

BDD feature files use the naming pattern `<capability>.feature`. Step definitions live in `tests/bdd/step_definitions/`.

---

## 3. Branches and commits

Branch naming:

```
feat/short-description     # new feature
fix/short-description      # bug fix
chore/short-description    # tooling, deps, docs
test/short-description     # test-only changes
```

Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat(experiments): add citation widget to detail page
fix(cms): correct slug validation on Experiment type
chore(deps): update Playwright to 1.44
test(bdd): add scenarios for legacy URL redirects
docs(adr): add ADR 0004 for email provider choice
```

A commitlint hook enforces this format on every commit. If your commit is rejected, check the format above.

---

## 4. Pull requests

- Open PRs against `main` (or the current sprint branch if one exists).
- Every PR must have a description explaining what it does and which BDD scenarios or tests it turns green.
- CI must pass (lint, typecheck, unit tests, BDD) before a PR can be merged.
- At least one approval is required before merging.

---

## 5. Running the stack locally

See `README.md` for the full quick-start. Short version:

```bash
cp .env.example .env.local   # fill in values
pnpm install
docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build
```

---

## 6. Coverage thresholds

Set in Sprint 1. The initial targets are:

- Lines: 80%
- Branches: 75%

These apply to all new code added after Sprint 1. Legacy migration code (under `scripts/`) is exempt until Sprint 15.

---

## 7. Accessibility bar

Every public page must pass axe-core at severity Serious or above before it is considered done. Run the accessibility suite with:

```bash
pnpm test:a11y
```

---

## 8. Code style

ESLint and Prettier are configured at the repo root. They run automatically on pre-commit via lint-staged. To run manually:

```bash
pnpm lint
pnpm format
```

TypeScript strict mode is enabled. All new code must pass `pnpm typecheck` with zero errors.
